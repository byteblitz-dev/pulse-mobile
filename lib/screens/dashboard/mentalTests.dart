import 'dart:ui';
import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class MentalAssessmentDashboard extends StatelessWidget {
  const MentalAssessmentDashboard({super.key});

  final List<Map<String, dynamic>> tests = const [
    {
      "title": "Mental Toughness",
      "subtitle": "Assess your resilience & grit",
      "link": "/mentalToughness",
    },
    {
      "title": "Competitive Anxiety",
      "subtitle": "Measure pre-competition anxiety",
      "link": "/competitiveAnxiety",
    },
    {
      "title": "Team Cohesion",
      "subtitle": "Evaluate teamwork & bonding",
      "link": "/teamCohesion",
    },
    {
      "title": "Mental Health Screening",
      "subtitle": "General mental health check",
      "link": "/mentalHealth",
    },
    {
      "title": "Personality Traits",
      "subtitle": "Confidence, resilience & anxiety",
      "link": "/personalityTraits",
    },
    {
      "title": "Motivation Assessment",
      "subtitle": "Understand your goals & drive",
      "link": "/motivation",
    },
    {
      "title": "Stress & Coping",
      "subtitle": "Measure how you handle pressure",
      "link": "/stressCoping",
    },
    {
      "title": "Reaction Time Test",
      "subtitle": "Check reflexes & speed",
      "link": "/reactionTime",
    },
    {
      "title": "Attention & Alertness",
      "subtitle": "Focus & concentration test",
      "link": "/attention",
    },
  ];

  // Different gradient colors for each card
  final List<List<Color>> cardGradients = const [
    [Color(0xFF7F00FF), Color(0xFFE100FF)], // Purple to pink
    [Color(0xFF2193b0), Color(0xFF6dd5ed)], // Blue
    [Color(0xFF56ab2f), Color(0xFFA8E063)], // Green
    [Color(0xFFff512f), Color(0xFFdd2476)], // Red to pink
    [Color(0xFF1f4037), Color(0xFF99f2c8)], // Teal
    [Color(0xFFee9ca7), Color(0xFFffdde1)], // Soft pink
    [Color(0xFF373B44), Color(0xFF4286f4)], // Dark blue
    [Color(0xFF614385), Color(0xFF516395)], // Violet/blue
    [Color(0xFF02AABD), Color(0xFF00CDAC)], // Aqua
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Psychological Tests'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: tests.length,
            itemBuilder: (context, index) {
              final test = tests[index];
              final colors = cardGradients[index % cardGradients.length];

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(-0.02)
                    ..rotateY(0.02),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: colors
                            .map((c) => c.withOpacity(0.6))
                            .toList(), // glassy gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colors.first.withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter:
                            ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "Assessment",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  test["title"]!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.white,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  test["subtitle"]!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, test['link']!);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.first,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 6,
                                  ),
                                  icon: const Icon(Icons.psychology),
                                  label: const Text("Start Assessment"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
