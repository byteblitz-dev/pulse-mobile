import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class VerticalJumpPage extends StatefulWidget {
  const VerticalJumpPage({super.key});

  @override
  State<VerticalJumpPage> createState() => _VerticalJumpPageState();
}

class _VerticalJumpPageState extends State<VerticalJumpPage> {
  bool _isLoading = false;
  String _status = '';
  double _jumpHeight = 0.0;

  Future<void> _submitVerticalJump() async {
    if (AuthService.userId == null) {
      setState(() => _status = '❌ You must log in first.');
      return;
    }

    setState(() {
      _isLoading = true;
      _status = '';
    });

    try {
      // Simulated Vertical Jump test
      final res = await ApiService.submitEnduranceRunResult(
        userId: AuthService.userId!,
        distanceMeters: _jumpHeight, // Using distanceMeters as height
        timeSeconds: 1, // Dummy time
        date: DateTime.now(),
      );

      setState(() {
        _status = res['success'] == true
            ? '✅ Vertical Jump submitted successfully!'
            : '❌ Failed: ${res['message']}';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _status = '⚠️ Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical Jump Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Jump Height: ${_jumpHeight.toStringAsFixed(1)} cm',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            Slider(
              value: _jumpHeight,
              min: 0,
              max: 100,
              divisions: 100,
              label: _jumpHeight.toStringAsFixed(1),
              onChanged: (val) => setState(() => _jumpHeight = val),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitVerticalJump,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Submit Vertical Jump Test'),
            ),
            const SizedBox(height: 20),
            if (_status.isNotEmpty)
              Text(_status, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
