import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:pulse/services/api_service.dart';
import 'package:pulse/services/auth_service.dart';

class EnduranceRunScreen extends StatefulWidget {
  const EnduranceRunScreen({super.key});

  @override
  State<EnduranceRunScreen> createState() => _EnduranceRunScreenState();
}

class _EnduranceRunScreenState extends State<EnduranceRunScreen> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsedTime = "00:00:00";

  double totalDistance = 0.0; // meters
  Position? lastPosition;
  Position? startPosition; // initial location

  StreamSubscription<Position>? positionStream;

  @override
  void dispose() {
    timer?.cancel();
    positionStream?.cancel();
    super.dispose();
  }

  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permission denied")),
      );
    }
  }

  void _startRun() async {
    await _requestPermission();

    // Get initial location
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      startPosition = position; // store starting location
      totalDistance = 0.0;
      lastPosition = null;
      stopwatch.reset();
      stopwatch.start();
    });

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        elapsedTime = _formatTime(stopwatch.elapsedMilliseconds);
      });
    });

    positionStream =
        Geolocator.getPositionStream(locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 5, // update every 5 meters
        )).listen((Position position) {
          if (lastPosition != null) {
            final distance = Geolocator.distanceBetween(
              lastPosition!.latitude,
              lastPosition!.longitude,
              position.latitude,
              position.longitude,
            );
            setState(() {
              totalDistance += distance;
            });
          }
          lastPosition = position;
        });
  }

  void _stopRun() {
    stopwatch.stop();
    timer?.cancel();
    positionStream?.cancel();
  }

  void _resetRun() {
    setState(() {
      stopwatch.reset();
      elapsedTime = "00:00:00";
      totalDistance = 0.0;
      lastPosition = null;
      startPosition = null;
    });
  }

  String _formatTime(int ms) {
    final seconds = (ms / 1000).floor() % 60;
    final minutes = (ms / (1000 * 60)).floor() % 60;
    final hours = (ms / (1000 * 60 * 60)).floor();
    return "${hours.toString().padLeft(2, "0")}:"
        "${minutes.toString().padLeft(2, "0")}:"
        "${seconds.toString().padLeft(2, "0")}";
  }

  Future<void> _submitData() async {
    final userId = AuthService.userId;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must be logged in to submit results.")),
      );
      return;
    }

    final durationSec = stopwatch.elapsed.inSeconds;

    try {
      await ApiService.submitEnduranceRunResult(
        userId: userId,
        distanceMeters: totalDistance,
        timeSeconds: durationSec,
        date: DateTime.now(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Endurance Run submitted successfully!")),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Endurance Run"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Track your run in real-time",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 30),

              // Stopwatch
              Text(
                elapsedTime,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Distance
              Text(
                "Distance: ${(totalDistance / 1000).toStringAsFixed(2)} km",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),

              // Pace
              Text(
                "Pace: ${totalDistance > 0 ? ((stopwatch.elapsed.inSeconds / 60) / (totalDistance / 1000)).toStringAsFixed(2) : "0.00"} min/km",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),

              // Start Location
              if (startPosition != null)
                Text(
                  "Start Location: ${startPosition!.latitude.toStringAsFixed(5)}, ${startPosition!.longitude.toStringAsFixed(5)}",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),

              const SizedBox(height: 40),

              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startRun,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child:
                    const Text("Start", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _stopRun,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child:
                    const Text("Stop", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _resetRun,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child:
                    const Text("Reset", style: TextStyle(color: Colors.white)),
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
                sliderButtonIcon:
                const Icon(Icons.flag, color: Colors.deepPurpleAccent),
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
