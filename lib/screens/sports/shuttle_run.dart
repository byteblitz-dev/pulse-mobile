import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:pulse/services/api_service.dart';
import 'package:pulse/services/auth_service.dart';

class ShuttleRunScreen extends StatefulWidget {
  const ShuttleRunScreen({super.key});

  @override
  State<ShuttleRunScreen> createState() => _ShuttleRunScreenState();
}

class _ShuttleRunScreenState extends State<ShuttleRunScreen> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsedTime = "00:00:00";

  void _startStopwatch() {
    setState(() {
      stopwatch.start();
    });
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        elapsedTime = _formatTime(stopwatch.elapsedMilliseconds);
      });
    });
  }

  void _stopStopwatch() {
    setState(() {
      stopwatch.stop();
      timer?.cancel();
    });
  }

  void _resetStopwatch() {
    setState(() {
      stopwatch.reset();
      elapsedTime = "00:00:00";
    });
  }

  String _formatTime(int ms) {
    final seconds = (ms / 1000).floor() % 60;
    final minutes = (ms / (1000 * 60)).floor() % 60;
    final millis = (ms / 10).floor() % 100;
    return "${minutes.toString().padLeft(2, "0")}:"
        "${seconds.toString().padLeft(2, "0")}:"
        "${millis.toString().padLeft(2, "0")}";
  }

  Future<void> _submitData() async {
    final userId = AuthService.userId;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be logged in to submit results.")),
      );
      return;
    }
    try {
      await ApiService.submitShuttleRunResult(
        userId: userId,
        time: elapsedTime,
        date: DateTime.now(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Shuttle Run submitted successfully!")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to submit: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: AppBar(
        title: const Text("Shuttle Run Test"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Shuttle Run Stopwatch",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 40),

              // Stopwatch Time
              Text(
                elapsedTime,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),

              // Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startStopwatch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Start", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _stopStopwatch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Stop", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Reset", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Slide to Submit
              SlideAction(
                text: "Slide to Submit",
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                outerColor: Colors.deepPurpleAccent,
                innerColor: Colors.white,
                sliderButtonIcon: const Icon(Icons.flag, color: Colors.deepPurpleAccent),
                borderRadius: 12,
                onSubmit: () {
                  _submitData();
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
