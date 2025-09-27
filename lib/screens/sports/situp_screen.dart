import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../services/mock_situp_service.dart';
import '../../services/skeleton_painter.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class SitupScreen extends StatefulWidget {
  const SitupScreen({super.key});

  @override
  State<SitupScreen> createState() => _SitupScreenState();
}

class _SitupScreenState extends State<SitupScreen>
    with TickerProviderStateMixin {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  bool _isRecording = false;
  String _status = 'Ready to start';
  
  // Mock service
  final MockSitupService _mockService = MockSitupService();
  
  // Animation
  late AnimationController _animationController;
  late Animation<double> _animation;
  
  // Test data
  int _situpCount = 0;
  DateTime? _testStartTime;
  DateTime? _testEndTime;
  
  // Screenshot
  final GlobalKey _screenshotKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _setupAnimation();
    _setupMockService();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat();
  }

  void _setupMockService() {
    _mockService.onCountUpdate = (count) {
      setState(() {
        _situpCount = count;
      });
    };
    
    _mockService.onStatusUpdate = (isActive) {
      setState(() {
        _isRecording = isActive;
        if (isActive) {
          _testStartTime = DateTime.now();
          _status = 'Recording situps...';
        } else {
          _testEndTime = DateTime.now();
          _status = 'Test completed';
        }
      });
    };
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.medium,
          enableAudio: false,
        );
        
        await _cameraController!.initialize();
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      print('Camera initialization error: $e');
      setState(() {
        _status = 'Camera not available - Demo mode only';
      });
    }
  }

  void _startTest() {
    _mockService.start();
    _animationController.repeat();
  }

  void _stopTest() {
    _mockService.stop();
    _animationController.stop();
    _submitResults();
  }

  void _resetTest() {
    _mockService.reset();
    setState(() {
      _situpCount = 0;
      _testStartTime = null;
      _testEndTime = null;
      _status = 'Ready to start';
    });
  }

  Future<void> _takeScreenshot() async {
    try {
      setState(() => _status = '📸 Saving test data...');

      // Create a comprehensive test data file since screenshots are blocked
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'situp_test_$timestamp.txt';
      final filePath = '${directory.path}/$fileName';
      
      final testData = '''
╔══════════════════════════════════════════════════════════════╗
║                      SIT-UP TEST REPORT                     ║
╠══════════════════════════════════════════════════════════════╣
║ Test Date: ${DateTime.now().toString()}                    ║
║ Test Mode: Demo (Mock) - AI Tracking Simulation             ║
╠══════════════════════════════════════════════════════════════╣
║ RESULTS:                                                     ║
║ • Total Sit-ups: $_situpCount                               ║
║ • Test Duration: ${_testEndTime != null && _testStartTime != null ? _testEndTime!.difference(_testStartTime!).inSeconds : 0} seconds                    ║
║ • Average Time per Sit-up: ${_situpCount > 0 && _testEndTime != null && _testStartTime != null ? (_testEndTime!.difference(_testStartTime!).inSeconds / _situpCount).toStringAsFixed(1) : "0.0"} seconds        ║
║ • Sit-ups per Minute: ${_situpCount > 0 && _testEndTime != null && _testStartTime != null ? ((_situpCount / _testEndTime!.difference(_testStartTime!).inSeconds) * 60).toStringAsFixed(1) : "0.0"}              ║
╠══════════════════════════════════════════════════════════════╣
║ STATUS: $_status                                            ║
║                                                              ║
║ Note: Screenshot capture is disabled for security reasons.  ║
║ This file contains all test data and results.               ║
╚══════════════════════════════════════════════════════════════╝
''';

      final file = await File(filePath).writeAsString(testData);

      if (await file.exists()) {
        final fileSize = await file.length();
        setState(() => _status = '📄 Test report saved: $fileName');
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('✅ Test Report Saved Successfully!'),
                Text('File: $fileName'),
                Text('Size: ${(fileSize / 1024).toStringAsFixed(1)} KB'),
                Text('Path: ${file.path}'),
                Text('Note: Screenshots disabled, saved detailed report instead'),
              ],
            ),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 5),
          ),
        );
      } else {
        throw Exception('Could not create test report file');
      }

    } catch (e) {
      setState(() => _status = '⚠️ Save failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Failed to save test report: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _submitResults() async {
    if (AuthService.userId == null) {
      setState(() => _status = '❌ You must log in first.');
      return;
    }

    setState(() => _status = 'Submitting results...');

    try {
      final testData = {
        'testType': 'situp',
        'userId': AuthService.userId!,
        'timestamp': DateTime.now().toIso8601String(),
        'results': {
          'situpCount': _situpCount,
          'testDuration': _testEndTime != null && _testStartTime != null
              ? _testEndTime!.difference(_testStartTime!).inSeconds
              : 0,
          'averageTimePerSitup': _situpCount > 0 && _testEndTime != null && _testStartTime != null
              ? (_testEndTime!.difference(_testStartTime!).inSeconds / _situpCount)
              : 0,
        },
        'metadata': {
          'mode': 'demo',
          'device': 'mobile',
          'version': '1.0.0',
        }
      };

      final result = await ApiService.storeTestData(testData: testData);
      
      setState(() {
        _status = result['success'] == true
            ? '✅ Results submitted successfully!'
            : '❌ Failed to submit: ${result['message']}';
      });
    } catch (e) {
      setState(() {
        _status = '⚠️ Error: $e';
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _animationController.dispose();
    _mockService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sit-up Test'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _takeScreenshot,
            tooltip: 'Take Screenshot',
          ),
        ],
      ),
      body: RepaintBoundary(
        key: _screenshotKey,
        child: Stack(
        children: [
          // Camera preview or placeholder
          if (_isInitialized && _cameraController != null)
            Positioned.fill(
              child: CameraPreview(_cameraController!),
            )
          else
            Positioned.fill(
              child: Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          
          // Skeleton overlay
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: SkeletonPainter(
                    screenSize: MediaQuery.of(context).size,
                    animationValue: _animation.value,
                    testType: 'situp',
                  ),
                );
              },
            ),
          ),
          
          // UI Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Top status bar
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _isRecording ? Colors.red : Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Mode: Demo (Mock)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Center counter
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$_situpCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'SIT-UPS',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Instructions
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Lie down and perform sit-ups',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Stats
                    if (_situpCount > 0 && _testStartTime != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Avg: ${_situpCount > 0 && _testEndTime != null ? (_testEndTime!.difference(_testStartTime!).inSeconds / _situpCount).toStringAsFixed(1) : "0.0"}s per sit-up',
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    
                    const Spacer(),
                    
                    // Control buttons
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Start/Stop button
                          ElevatedButton(
                            onPressed: _isRecording ? _stopTest : _startTest,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isRecording ? Colors.red : Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              _isRecording ? 'STOP' : 'START',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                          // Reset button
                          ElevatedButton(
                            onPressed: _resetTest,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'RESET',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Status text
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}