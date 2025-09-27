# Enhanced MediaPipe Pose Detection for Flutter

This implementation provides a robust pose detection system using MediaPipe BlazePose with additional features for vertical jump height calculation and sit-up counting.

## Features

### ✅ Core Functionality
- **MediaPipe BlazePose Integration**: Uses Google ML Kit for accurate 33-point pose detection
- **MediaPipe-Only Detection**: Optimized for MediaPipe BlazePose model
- **Asynchronous Processing**: All functions run asynchronously for smooth UI performance
- **Debug Mode**: Comprehensive logging and visualization for development

### 🦘 Vertical Jump Height Calculation
- **Hip Tracking**: Uses average of left and right hip keypoints (indices 23, 24)
- **Baseline Detection**: Automatically sets standing baseline
- **Real-time Calculation**: Tracks maximum hip lift during jump
- **Unit Conversion**: Converts pixel differences to centimeters (scaling factor: 400)

### 💪 Sit-up Counter
- **Torso Angle Tracking**: Monitors angle between hip, shoulder, and knee keypoints
- **State Detection**: 
  - Down position: torso angle < 45°
  - Up position: torso angle > 70°
- **Smart Counting**: Only increments when moving from down → up
- **Real-time Feedback**: Shows current count and torso angle

### 🔍 Debug Features
- **Model Load Status**: Success/failure logging
- **Landmark Detection**: Number of landmarks detected per frame
- **Key Landmark Visualization**: Console output of critical points
- **Performance Metrics**: Detection method success rates
- **Confidence Tracking**: Per-landmark confidence scores

## Usage

### Basic Setup

```dart
import 'package:your_app/services/pose_detector.dart';

// Initialize detector
final detector = HybridPoseDetector();
await detector.initialize(
  enableMediaPipe: true,
);
```

### Pose Detection

```dart
// Detect pose landmarks
final result = await detector.detectPose(image);
if (result != null) {
  print('Detected ${result.landmarks.length} landmarks');
  print('Confidence: ${result.confidence}');
  print('Method: ${result.method}');
}
```

### Jump Height Calculation

```dart
// Calculate jump height
final jumpHeight = await detector.calculateJumpHeight(image);
if (jumpHeight != null) {
  print('Jump height: ${jumpHeight.toStringAsFixed(1)} cm');
}

// Get current state
print('Current jump height: ${detector.currentJumpHeight} cm');
print('Baseline set: ${detector.isJumpBaselineSet}');
```

### Sit-up Counting

```dart
// Calculate sit-ups
final situpCount = await detector.calculateSitups(image);
if (situpCount != null) {
  print('Sit-ups: $situpCount');
  print('Torso angle: ${detector.lastTorsoAngle.toStringAsFixed(1)}°');
}

// Get current state
print('Current sit-up count: ${detector.currentSitupCount}');
```

### Reset Tracking

```dart
// Reset jump tracking
detector.resetJumpTracking();

// Reset sit-up tracking
detector.resetSitupTracking();
```

## Key Landmark Indices

MediaPipe BlazePose provides 33 landmarks. Key indices for calculations:

- **Left Hip**: 23
- **Right Hip**: 24
- **Left Shoulder**: 11
- **Right Shoulder**: 12
- **Left Knee**: 25
- **Right Knee**: 26

## Configuration

### Debug Mode
Enable detailed logging and visualization:

```dart
final mediaPipeDetector = MediaPipePoseDetector();
await mediaPipeDetector.initialize(debugMode: true);
```

### Detection Method
Switch between detection methods:

```dart
// Use only MediaPipe (recommended)
detector.setDetectionMethod(PoseDetectionMethod.mediaPipe);

// Use hybrid approach (default - MediaPipe only)
detector.setDetectionMethod(PoseDetectionMethod.hybrid);
```

## Performance Optimization

The system automatically optimizes detection method based on:
- Success rates
- Processing time
- Error rates

Since only MediaPipe is available, the system will automatically use MediaPipe for optimal performance.

Manual optimization:
```dart
detector.optimizeMethod();
```

## Error Handling

All functions return `null` on failure with detailed error logging:

```dart
final result = await detector.detectPose(image);
if (result == null) {
  print('Detection failed - check logs for details');
}
```

## Dependencies

Required packages in `pubspec.yaml`:

```yaml
dependencies:
  google_mlkit_pose_detection: ^0.10.0
  image: ^4.2.0
  camera: ^0.10.1+7
```

## Troubleshooting

### Common Issues

1. **Model Loading Fails**
   - Check if `google_mlkit_pose_detection` is properly configured
   - Verify device compatibility
   - Check available storage space

2. **Low Detection Accuracy**
   - Ensure good lighting conditions
   - Position user clearly in frame
   - Check camera resolution settings

3. **Performance Issues**
   - Use lower camera resolution
   - Enable hybrid mode for automatic optimization
   - Check device memory usage

### Debug Output

Enable debug mode to see detailed information:

```
✅ MediaPipe Pose Detector initialized successfully
📊 Debug mode: ENABLED
🎯 Ready for pose detection with 33 landmarks
✅ Detected 33 landmarks
🎯 Key Landmarks:
   Left Hip: (0.500, 0.600) conf: 0.850
   Right Hip: (0.500, 0.600) conf: 0.820
   Left Shoulder: (0.400, 0.500) conf: 0.900
   Right Shoulder: (0.400, 0.500) conf: 0.880
   Left Knee: (0.700, 0.600) conf: 0.750
   Right Knee: (0.700, 0.600) conf: 0.780
📏 Jump baseline set at Y: 0.600
🦘 New max jump height: 45.2cm
📐 Torso angle: 65.3°
⬆️ Sit-up completed! Count: 1
```

## License

This implementation is part of the Pulse Mobile App project for SIH 2025.
