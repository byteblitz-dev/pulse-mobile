import 'package:flutter/material.dart';
import 'dart:async';
import 'package:slide_to_act/slide_to_act.dart';

class ThirtyMetreSprintScreen extends StatefulWidget {
  const ThirtyMetreSprintScreen({super.key});

  @override
  State<ThirtyMetreSprintScreen> createState() =>
      _ThirtyMetreSprintScreenState();
}

class _ThirtyMetreSprintScreenState extends State<ThirtyMetreSprintScreen> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  double? avgSpeed; // m/s
  double? topSpeed; // m/s

  bool submitted = false;

  void startSprint() {
    stopwatch.reset();
    stopwatch.start();
    avgSpeed = null;
    topSpeed = null;
    submitted = false;

    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  void stopSprint() {
    stopwatch.stop();
    timer?.cancel();

    final durationSec = stopwatch.elapsedMilliseconds / 1000;
    const distance = 30.0; // meters
    avgSpeed = distance / durationSec;
    topSpeed = avgSpeed! * 1.2; // mock top speed (20% higher)
    setState(() {});
  }

  void resetSprint() {
    stopwatch.reset();
    timer?.cancel();
    avgSpeed = null;
    topSpeed = null;
    submitted = false;
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = stopwatch.elapsedMilliseconds / 1000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('30 Metre Sprint'),
        backgroundColor: Colors.blueAccent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // <-- makes screen scrollable
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  '30 Metre Sprint',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black38,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _glassCard(
                  child: Column(
                    children: [
                      Text(
                        'Stopwatch',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${time.toStringAsFixed(2)} s',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  // <-- use Wrap instead of Row to prevent overflow
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: startSprint,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Start'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: stopSprint,
                      icon: const Icon(Icons.stop),
                      label: const Text('Stop'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: resetSprint,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                if (avgSpeed != null && topSpeed != null)
                  _glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average Speed: ${avgSpeed!.toStringAsFixed(2)} m/s',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Top Speed: ${topSpeed!.toStringAsFixed(2)} m/s',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (!submitted)
                          Center(
                            child: SlideAction(
                              text: "Slide to Submit",
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              outerColor: Colors.deepPurpleAccent,
                              innerColor: Colors.white,
                              sliderButtonIcon: const Icon(
                                Icons.flag,
                                color: Colors.deepPurpleAccent,
                              ),
                              borderRadius: 12,
                              onSubmit: () {
                                setState(() {
                                  submitted = true;
                                });
                              },
                            ),
                          )
                        else
                          const Center(
                            child: Text(
                              '✅ Submitted',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                const Text(
                  'Instructions:\nRun the 30 metres as fast as possible.\nPress Start when ready, Stop when you cross the finish line, and Slide to Submit.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
