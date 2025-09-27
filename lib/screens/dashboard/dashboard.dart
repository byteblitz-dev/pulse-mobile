import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override

  final List<Map<String, dynamic>> tests = const [
    {
      "title": "Height & Weight",
      "subtitle": "Record your measurements",
      "image": "assets/images/weight.jpg",
      "link": "/heightWeight",
    },
    {
      "title": "Sit and Reach",
      "subtitle": "Test your flexibility",
      "image": "assets/images/sitNreach.jpeg",
      "link": "/sitNreach",
    },
    {
      "title": "Shuttle Run",
      "subtitle": "Test your speed & agility",
      "image": "assets/images/running.jpg",
      "link": '/shuttleRun'
    },
    {
      "title": "Endurance Run",
      "subtitle": "Track your stamina",
      "image": "assets/images/running2.jpg",
      "link": '/enduranceRun'
    },
    {
      "title": "Vertical Jump",
      "subtitle": "Measure jump height with AI tracking",
      "image": "assets/images/jump.jpg",
      "link": '/verticalJumpScreen'
    },
    {
      "title": "Broad Jump",
      "subtitle": "Measure Broad Jump height",
      "image": "assets/images/jump2.jpg",
      "link": '/broadJump'
    },
    {
      "title": "Medicine Ball Throw",
      "subtitle": "Measure your upper body strength",
      "image": "assets/images/ballThrow.jpeg",
      "link": '/medicineBallThrow'
    },
    {
      "title": "30mts Sprint",
      "subtitle": "Check your speed with accuracy",
      "image": "assets/images/run4.jpg",
      "link": '/thirtyMetreSprint'
    },
    {
      "title": "Sit-ups",
      "subtitle": "Count repetitions with AI tracking",
      "image": "assets/images/crunches.jpg",
      "link": '/situpScreen'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Standardized Test'),
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: tests.map((test) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // perspective
                    ..rotateX(-0.03)         // slight X rotation
                    ..rotateY(0.03),         // slight Y rotation
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            test["image"]!,
                            fit: BoxFit.cover,
                            height: 180,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "Test",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  test["title"]!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  test["subtitle"]!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(context, test['link']!);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      icon: const Icon(Icons.play_arrow),
                                      label: const Text("Get Started"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
