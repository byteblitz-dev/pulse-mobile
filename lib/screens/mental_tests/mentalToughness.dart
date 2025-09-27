import 'dart:ui';
import 'package:flutter/material.dart';

class MentalToughnessTestScreen extends StatefulWidget {
  const MentalToughnessTestScreen({super.key});

  @override
  State<MentalToughnessTestScreen> createState() =>
      _MentalToughnessTestScreenState();
}

class _MentalToughnessTestScreenState
    extends State<MentalToughnessTestScreen> {
  int _currentQuestion = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "I remain focused even under pressure.",
      "options": ["Strongly Disagree", "Disagree", "Agree", "Strongly Agree"],
      "points": [1, 2, 3, 4],
    },
    {
      "question": "I bounce back quickly after a setback.",
      "options": ["Strongly Disagree", "Disagree", "Agree", "Strongly Agree"],
      "points": [1, 2, 3, 4],
    },
    {
      "question": "I stay confident when facing tough opponents.",
      "options": ["Strongly Disagree", "Disagree", "Agree", "Strongly Agree"],
      "points": [1, 2, 3, 4],
    },
    {
      "question": "I push myself beyond limits during training.",
      "options": ["Strongly Disagree", "Disagree", "Agree", "Strongly Agree"],
      "points": [1, 2, 3, 4],
    },
  ];

  int? _selectedOption;

  void _nextQuestion() {
    if (_selectedOption != null) {
      // Cast the value to int explicitly
      _score += (_questions[_currentQuestion]["points"][_selectedOption!] as int);
      setState(() {
        _selectedOption = null;
        if (_currentQuestion < _questions.length - 1) {
          _currentQuestion++;
        } else {
          _showResult();
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an option")),
      );
    }
  }


  void _showResult() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Test Completed"),
        content: Text("Your Mental Toughness Score: $_score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_currentQuestion];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mental Toughness Test"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildGlassCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Question ${_currentQuestion + 1} of ${_questions.length}",
                  style: const TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  current["question"],
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...List.generate(current["options"].length, (index) {
                  return RadioListTile<int>(
                    value: index,
                    groupValue: _selectedOption,
                    activeColor: Colors.deepPurpleAccent,
                    title: Text(
                      current["options"][index],
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _selectedOption = val;
                      });
                    },
                  );
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
