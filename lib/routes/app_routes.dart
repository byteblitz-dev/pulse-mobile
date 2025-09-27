import 'package:flutter/material.dart';
import 'package:pulse/screens/dashboard/mentalTests.dart';
import 'package:pulse/screens/sports/progress_page.dart';
import 'package:pulse/screens/sports/shuttle_run.dart';
import 'package:pulse/screens/sports/sitAndReach.dart';
import 'package:pulse/screens/auth/language_selector.dart';
import 'package:pulse/screens/auth/login.dart';
import 'package:pulse/screens/auth/onboarding.dart';
import 'package:pulse/screens/auth/register.dart';
import 'package:pulse/screens/dashboard/dashboard.dart';
import 'package:pulse/screens/info/height_weight.dart';
import 'package:pulse/screens/sports/30mtSprint.dart';
import 'package:pulse/screens/sports/endurance_run.dart';
import 'package:pulse/screens/sports/medicineBallThrow.dart';
import 'package:pulse/screens/sports/standingBroadJump.dart';
import 'package:pulse/screens/sports/vertical_jump_screen.dart';
import 'package:pulse/screens/sports/situp_screen.dart';
import 'package:pulse/screens/profile/profile_page.dart';

import '../screens/mental_tests/mentalToughness.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String heightWeight = '/heightWeight';
  static const String shuttleRun = '/shuttleRun';
  static const String enduranceRun = '/enduranceRun';
  static const String verticalJumpScreen = '/verticalJumpScreen';
  static const String situpScreen = '/situpScreen';
  static const String progress = '/progress';
  static const String profile = '/profile';
  static const String language = '/language';
  static const String sitNreach = '/sitNreach';
  static const String broadJump = '/broadJump';
  static const String medicineBallThrow = '/medicineBallThrow';
  static const String thirtyMetreSprint = '/thirtyMetreSprint';
  static const String mentalTests = '/mentalTests';
  static const String mentalToughness = '/mentalToughness';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
            builder: (_) =>
                OnboardingScreen(onLanguageSelected: _noopLocale));
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case heightWeight:
        return MaterialPageRoute(builder: (_) => const HeightWeightScreen());
      case shuttleRun:
        return MaterialPageRoute(builder: (_) => const ShuttleRunScreen());
      case enduranceRun:
        return MaterialPageRoute(builder: (_) => const EnduranceRunScreen());
      case verticalJumpScreen:
        return MaterialPageRoute(builder: (_) => const VerticalJumpScreen());
      case situpScreen:
        return MaterialPageRoute(builder: (_) => const SitupScreen());
      case progress:
        return MaterialPageRoute(builder: (_) => const ProgressPage());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case sitNreach:
        return MaterialPageRoute(builder: (_) => const SitAndReachScreen());
      case broadJump:
        return MaterialPageRoute(builder: (_) => const BroadJumpScreen());
      case medicineBallThrow:
        return MaterialPageRoute(
            builder: (_) => const MedicineBallThrowScreen());
      case thirtyMetreSprint:
        return MaterialPageRoute(
            builder: (_) => const ThirtyMetreSprintScreen());
      case language:
        return MaterialPageRoute(
            builder: (_) =>
                LanguageSelectorScreen(onLanguageSelected: _noopLocale));
      case mentalTests:
        return MaterialPageRoute(
            builder: (_) => const MentalAssessmentDashboard());
      case mentalToughness:
        return MaterialPageRoute(
            builder: (_) => const MentalToughnessTestScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Comming Soon")),
          ),
        );
    }
  }
}

void _noop(Locale _) {}
void _noopLocale(Locale _) {}
