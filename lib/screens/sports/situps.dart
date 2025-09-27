import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class SitUpPage extends StatefulWidget {
  const SitUpPage({super.key});

  @override
  State<SitUpPage> createState() => _SitUpPageState();
}

class _SitUpPageState extends State<SitUpPage> {
  bool _isLoading = false;
  String _status = '';
  int _count = 0;

  Future<void> _submitSitUp() async {
    if (AuthService.userId == null) {
      setState(() => _status = '❌ You must log in first.');
      return;
    }

    setState(() {
      _isLoading = true;
      _status = '';
    });

    try {
      // Simulated Sit-Up test data
      final res = await ApiService.submitEnduranceRunResult(
        userId: AuthService.userId!,
        distanceMeters: 0, // Sit-Up doesn't need distance
        timeSeconds: _count * 2, // Example: 2 sec per rep
        date: DateTime.now(),
      );

      setState(() {
        _status = res['success'] == true
            ? '✅ Sit-Up submitted successfully!'
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
      appBar: AppBar(title: const Text('Sit-Up Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Sit-Ups Count: $_count', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _count++),
                  child: const Text('+'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _count = (_count > 0 ? _count - 1 : 0)),
                  child: const Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitSitUp,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Submit Sit-Up Test'),
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
