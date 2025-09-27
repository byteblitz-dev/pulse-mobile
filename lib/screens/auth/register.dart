import 'dart:ui';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  String? gender;
  String? selectedSport;

  final List<String> sports = [
    "Swimming",
    "Archery",
    "Boxing",
    "Athletics",
    "Cycling",
    "Fencing",
    "Hockey",
    "Judo",
    "Rowing",
    "Shooting",
    "Table Tennis",
    "Weightlifting",
    "Wrestling",
  ];

  bool _obscurePassword = true;
  bool _isLoading = false;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleRegister() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered:\n${firstNameController.text} ${lastNameController.text}\n"
                "Email: ${emailController.text}\nPhone: ${phoneController.text}\n"
                "Gender: $gender | Sport: $selectedSport",
          ),
        ),
      );
    });
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildGlassCard(
              child: Column(
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Flexible PageView (no overflow)
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (i) {
                        setState(() => _currentPage = i);
                      },
                      children: [
                        // STEP 1
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: firstNameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration("First Name"),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: lastNameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration("Last Name"),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration("Email"),
                              ),
                            ],
                          ),
                        ),

                        // STEP 2
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration("Password").copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.cyanAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: phoneController,
                                style: const TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                decoration: _inputDecoration("Phone Number"),
                              ),
                            ],
                          ),
                        ),

                        // STEP 3
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Gender",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 16)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Male",
                                        groupValue: gender,
                                        activeColor: Colors.deepPurpleAccent,
                                        onChanged: (val) => setState(() => gender = val),
                                      ),
                                      const Text("Male", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Female",
                                        groupValue: gender,
                                        activeColor: Colors.deepPurpleAccent,
                                        onChanged: (val) => setState(() => gender = val),
                                      ),
                                      const Text("Female", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Others",
                                        groupValue: gender,
                                        activeColor: Colors.deepPurpleAccent,
                                        onChanged: (val) => setState(() => gender = val),
                                      ),
                                      const Text("Others", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.black87,
                                value: selectedSport,
                                decoration: _inputDecoration("Select Sport"),
                                style: const TextStyle(color: Colors.white),
                                items: sports.map((sport) {
                                  return DropdownMenuItem(
                                    value: sport,
                                    child: Text(sport,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() => selectedSport = val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Navigation Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        ElevatedButton(
                          onPressed: _prevPage,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyanAccent),
                          child: const Text("Back",
                              style: TextStyle(color: Colors.black)),
                        ),
                      if (_currentPage < 2)
                        ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent),
                          child: const Text("Next",
                              style: TextStyle(color: Colors.white)),
                        ),
                      if (_currentPage == 2)
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                              color: Colors.white)
                              : const Text("Register",
                              style: TextStyle(color: Colors.white)),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.cyanAccent),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
    );
  }
}
