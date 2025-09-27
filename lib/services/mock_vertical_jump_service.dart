import 'dart:async';
import 'dart:math';

class MockVerticalJumpService {
  static final MockVerticalJumpService _instance = MockVerticalJumpService._internal();
  factory MockVerticalJumpService() => _instance;
  MockVerticalJumpService._internal();

  Timer? _timer;
  int _jumpCount = 0;
  double _currentJumpHeight = 0.0;
  final List<double> _jumpHeights = [];
  final Random _random = Random();
  
  // Callbacks
  Function(int count)? onCountUpdate;
  Function(double height)? onHeightUpdate;
  Function(bool isActive)? onStatusUpdate;

  bool get isActive => _timer?.isActive ?? false;
  int get jumpCount => _jumpCount;
  double get currentJumpHeight => _currentJumpHeight;
  List<double> get jumpHeights => List.from(_jumpHeights);

  void start() {
    if (_timer?.isActive ?? false) return;
    
    _jumpCount = 0;
    _jumpHeights.clear();
    onStatusUpdate?.call(true);
    
    // Generate jumps every 2-3 seconds
    _timer = Timer.periodic(Duration(milliseconds: 2000 + _random.nextInt(1000)), (timer) {
      _jumpCount++;
      
      // Generate jump height between 28-35 cm
      _currentJumpHeight = 28.0 + _random.nextDouble() * 7.0;
      _jumpHeights.add(_currentJumpHeight);
      
      onCountUpdate?.call(_jumpCount);
      onHeightUpdate?.call(_currentJumpHeight);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    onStatusUpdate?.call(false);
  }

  void reset() {
    stop();
    _jumpCount = 0;
    _currentJumpHeight = 0.0;
    _jumpHeights.clear();
    onCountUpdate?.call(_jumpCount);
    onHeightUpdate?.call(_currentJumpHeight);
  }

  double getAverageJumpHeight() {
    if (_jumpHeights.isEmpty) return 0.0;
    return _jumpHeights.reduce((a, b) => a + b) / _jumpHeights.length;
  }

  double getBestJumpHeight() {
    if (_jumpHeights.isEmpty) return 0.0;
    return _jumpHeights.reduce((a, b) => a > b ? a : b);
  }
}