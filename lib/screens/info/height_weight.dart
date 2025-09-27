import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HeightWeightScreen extends StatefulWidget {
  const HeightWeightScreen({super.key});

  @override
  State<HeightWeightScreen> createState() => _HeightWeightScreenState();
}

class _HeightWeightScreenState extends State<HeightWeightScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String selectedHeightUnit = "cm";
  String selectedWeightUnit = "kg";

  void _submitData() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0 && weight > 0) {
      final result = {
        "athleteId": "12345", // TODO: Replace with logged-in athlete ID
        "testType": "Height & Weight",
        "metrics": {
          "height": height,
          "heightUnit": selectedHeightUnit,
          "weight": weight,
          "weightUnit": selectedWeightUnit,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };

      // TODO: Send this result to backend (/data/store)
      print("Submitting Height & Weight Data: $result");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Height & Weight submitted successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid values.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100, // clean background
      appBar: AppBar(
        title: const Text("Height & Weight Test"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Enter Your Measurements",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Height Input + Dropdown
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Height",
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectedHeightUnit,
                      items: const [
                        DropdownMenuItem(value: "cm", child: Text("cm")),
                        DropdownMenuItem(value: "ft", child: Text("ft")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedHeightUnit = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Weight Input + Dropdown
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Weight",
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectedWeightUnit,
                      items: const [
                        DropdownMenuItem(value: "kg", child: Text("kg")),
                        DropdownMenuItem(value: "lbs", child: Text("lbs")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedWeightUnit = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Submit Button
                SlideAction(
                  text: "Slide to Submit",
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  outerColor: Colors.deepPurpleAccent,
                  innerColor: Colors.white,
                  sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.deepPurpleAccent),
                  borderRadius: 12,
                  elevation: 4,
                  onSubmit: () {
                    _submitData(); // call your existing submit function
                    return null;   // important for async
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
