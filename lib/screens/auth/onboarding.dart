import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  final Function(Locale) onLanguageSelected; // ✅ receive callback

  const OnboardingScreen({super.key, required this.onLanguageSelected});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> _features(BuildContext context) => [
    {
      "title": AppLocalizations.of(context)?.onboarding1Title ?? "Track Your Performance",
      "subtitle": AppLocalizations.of(context)?.onboarding1Subtitle ?? "Measure height, weight, endurance, and more with ease.",
      "image": "assets/images/onboarding1.jpg",
    },
    {
      "title": AppLocalizations.of(context)?.onboarding2Title ?? "AI-Powered Insights",
      "subtitle": AppLocalizations.of(context)?.onboarding2Subtitle ?? "Get feedback from on-device models and backend AI.",
      "image": "assets/images/onboarding2.jpg",
    },
    {
      "title": AppLocalizations.of(context)?.onboarding3Title ?? "Get Drills to improve",
      "subtitle": AppLocalizations.of(context)?.onboarding3Subtitle ?? "Drills to improve upon your skills",
      "image": "assets/images/onboarding3.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final features = _features(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: features.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final feature = features[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    feature["image"]!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          feature["title"]!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          feature["subtitle"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    features.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.deepPurpleAccent
                            : Colors.white54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == features.length - 1) {
                      // ✅ Navigate to login/register and pass the same callback
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                        arguments: widget.onLanguageSelected,
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == features.length - 1
                        ? (AppLocalizations.of(context)?.continueButton ?? "Continue")
                        : (AppLocalizations.of(context)?.next ?? "Next"),
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
