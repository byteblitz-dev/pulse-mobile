import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

class SkeletonPainter extends CustomPainter {
  final Size screenSize;
  final double animationValue;
  final String testType; // 'vertical_jump' or 'situp'

  SkeletonPainter({
    required this.screenSize,
    required this.animationValue,
    required this.testType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final jointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Calculate center position
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Define keypoints for a basic human skeleton
    final keypoints = _generateKeypoints(centerX, centerY);

    // Draw skeleton connections
    _drawSkeleton(canvas, keypoints, paint);

    // Draw joints
    for (final point in keypoints.values) {
      canvas.drawCircle(point, 4.0, jointPaint);
    }
  }

  Map<String, Offset> _generateKeypoints(double centerX, double centerY) {
    final keypoints = <String, Offset>{};

    // Base animation offset (removed unused variable)

    if (testType == 'vertical_jump') {
      // Vertical jump pose - person crouching and jumping
      final jumpHeight = sin(animationValue * 4 * pi) * 30;
      
      keypoints['nose'] = Offset(centerX, centerY - 80 - jumpHeight);
      keypoints['left_eye'] = Offset(centerX - 8, centerY - 85 - jumpHeight);
      keypoints['right_eye'] = Offset(centerX + 8, centerY - 85 - jumpHeight);
      
      keypoints['left_shoulder'] = Offset(centerX - 25, centerY - 50 - jumpHeight);
      keypoints['right_shoulder'] = Offset(centerX + 25, centerY - 50 - jumpHeight);
      
      keypoints['left_elbow'] = Offset(centerX - 40, centerY - 20 - jumpHeight);
      keypoints['right_elbow'] = Offset(centerX + 40, centerY - 20 - jumpHeight);
      
      keypoints['left_wrist'] = Offset(centerX - 50, centerY + 10 - jumpHeight);
      keypoints['right_wrist'] = Offset(centerX + 50, centerY + 10 - jumpHeight);
      
      keypoints['left_hip'] = Offset(centerX - 20, centerY + 20 - jumpHeight);
      keypoints['right_hip'] = Offset(centerX + 20, centerY + 20 - jumpHeight);
      
      keypoints['left_knee'] = Offset(centerX - 25, centerY + 60 - jumpHeight);
      keypoints['right_knee'] = Offset(centerX + 25, centerY + 60 - jumpHeight);
      
      keypoints['left_ankle'] = Offset(centerX - 20, centerY + 100 - jumpHeight);
      keypoints['right_ankle'] = Offset(centerX + 20, centerY + 100 - jumpHeight);
    } else {
      // Situp pose - person lying and sitting up
      final situpAngle = sin(animationValue * 3 * pi) * 0.3;
      final rotation = Matrix4.rotationZ(situpAngle);
      
      keypoints['nose'] = _transformPoint(Offset(centerX, centerY - 60), rotation, centerX, centerY);
      keypoints['left_eye'] = _transformPoint(Offset(centerX - 8, centerY - 65), rotation, centerX, centerY);
      keypoints['right_eye'] = _transformPoint(Offset(centerX + 8, centerY - 65), rotation, centerX, centerY);
      
      keypoints['left_shoulder'] = _transformPoint(Offset(centerX - 25, centerY - 30), rotation, centerX, centerY);
      keypoints['right_shoulder'] = _transformPoint(Offset(centerX + 25, centerY - 30), rotation, centerX, centerY);
      
      keypoints['left_elbow'] = _transformPoint(Offset(centerX - 40, centerY), rotation, centerX, centerY);
      keypoints['right_elbow'] = _transformPoint(Offset(centerX + 40, centerY), rotation, centerX, centerY);
      
      keypoints['left_wrist'] = _transformPoint(Offset(centerX - 50, centerY + 30), rotation, centerX, centerY);
      keypoints['right_wrist'] = _transformPoint(Offset(centerX + 50, centerY + 30), rotation, centerX, centerY);
      
      keypoints['left_hip'] = _transformPoint(Offset(centerX - 20, centerY + 50), rotation, centerX, centerY);
      keypoints['right_hip'] = _transformPoint(Offset(centerX + 20, centerY + 50), rotation, centerX, centerY);
      
      keypoints['left_knee'] = _transformPoint(Offset(centerX - 25, centerY + 90), rotation, centerX, centerY);
      keypoints['right_knee'] = _transformPoint(Offset(centerX + 25, centerY + 90), rotation, centerX, centerY);
      
      keypoints['left_ankle'] = _transformPoint(Offset(centerX - 20, centerY + 130), rotation, centerX, centerY);
      keypoints['right_ankle'] = _transformPoint(Offset(centerX + 20, centerY + 130), rotation, centerX, centerY);
    }

    return keypoints;
  }

  Offset _transformPoint(Offset point, Matrix4 transform, double centerX, double centerY) {
    final vector = vm.Vector3(point.dx - centerX, point.dy - centerY, 0);
    final transformed = transform.transform3(vector);
    return Offset(transformed.x + centerX, transformed.y + centerY);
  }

  void _drawSkeleton(Canvas canvas, Map<String, Offset> keypoints, Paint paint) {
    // Head connections
    _drawLine(canvas, keypoints['nose']!, keypoints['left_eye']!, paint);
    _drawLine(canvas, keypoints['nose']!, keypoints['right_eye']!, paint);
    _drawLine(canvas, keypoints['left_eye']!, keypoints['right_eye']!, paint);

    // Torso
    _drawLine(canvas, keypoints['left_shoulder']!, keypoints['right_shoulder']!, paint);
    _drawLine(canvas, keypoints['left_shoulder']!, keypoints['left_hip']!, paint);
    _drawLine(canvas, keypoints['right_shoulder']!, keypoints['right_hip']!, paint);
    _drawLine(canvas, keypoints['left_hip']!, keypoints['right_hip']!, paint);

    // Arms
    _drawLine(canvas, keypoints['left_shoulder']!, keypoints['left_elbow']!, paint);
    _drawLine(canvas, keypoints['left_elbow']!, keypoints['left_wrist']!, paint);
    _drawLine(canvas, keypoints['right_shoulder']!, keypoints['right_elbow']!, paint);
    _drawLine(canvas, keypoints['right_elbow']!, keypoints['right_wrist']!, paint);

    // Legs
    _drawLine(canvas, keypoints['left_hip']!, keypoints['left_knee']!, paint);
    _drawLine(canvas, keypoints['left_knee']!, keypoints['left_ankle']!, paint);
    _drawLine(canvas, keypoints['right_hip']!, keypoints['right_knee']!, paint);
    _drawLine(canvas, keypoints['right_knee']!, keypoints['right_ankle']!, paint);
  }

  void _drawLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint for smooth animation
  }
}
