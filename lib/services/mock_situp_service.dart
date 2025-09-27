import 'dart:async';
import 'dart:math';

class MockSitupService {
  static final MockSitupService _instance = MockSitupService._internal();
  factory MockSitupService() => _instance;
  MockSitupService._internal();

  Timer? _timer;
  int _situpCount = 0;
  final Random _random = Random();
  
  // Callbacks
  Function(int count)? onCountUpdate;
  Function(bool isActive)? onStatusUpdate;

  bool get isActive => _timer?.isActive ?? false;
  int get situpCount => _situpCount;

  void start() {
    if (_timer?.isActive ?? false) return;
    
    _situpCount = 0;
    onStatusUpdate?.call(true);
    
    // Generate situps every 1-1.2 seconds
    _timer = Timer.periodic(Duration(milliseconds: 1000 + _random.nextInt(200)), (timer) {
      _situpCount++;
      onCountUpdate?.call(_situpCount);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    onStatusUpdate?.call(false);
  }

  void reset() {
    stop();
    _situpCount = 0;
    onCountUpdate?.call(_situpCount);
  }
}