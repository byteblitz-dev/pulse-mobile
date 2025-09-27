import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';
import 'screens/auth/language_selector.dart';
import 'screens/auth/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const PulseApp());
}

class PulseApp extends StatefulWidget {
  const PulseApp({super.key});

  @override
  State<PulseApp> createState() => _PulseAppState();
}

class _PulseAppState extends State<PulseApp> {
  Locale? _locale;

  /// Called when the user selects a new language
  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LanguageSelectorScreen(onLanguageSelected: _setLocale),
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}

/// Onboarding wrapper that first checks if user is already logged in
class Onboarding extends StatefulWidget {
  final Function(Locale) onLanguageSelected; // ✅ callback to set locale
  const Onboarding({super.key, required this.onLanguageSelected});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      final hasAuth = await AuthService.loadAuthState();
      debugPrint("✅ Onboarding bootstrap - Has Auth? $hasAuth");

      if (!mounted) return;

      if (hasAuth) {
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      } else {
        setState(() => _loading = false); // show onboarding UI
      }
    } catch (e, st) {
      debugPrint("❌ Onboarding bootstrap error: $e\n$st");
      if (!mounted) return;
      setState(() => _loading = false); // fallback: show onboarding UI
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Show Language Selector first
    return LanguageSelectorScreen(
      onLanguageSelected: (locale) {
        // Set the selected locale in MyApp
        widget.onLanguageSelected(locale);

        // After selecting language, navigate to onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => OnboardingScreen(
              onLanguageSelected: widget.onLanguageSelected,
            ),
          ),
        );
      },
    );
  }
}
