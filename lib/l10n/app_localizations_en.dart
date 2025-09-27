// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'Track Your Performance';

  @override
  String get onboarding1Subtitle => 'Measure height, weight, endurance, and more with ease.';

  @override
  String get onboarding2Title => 'AI-Powered Insights';

  @override
  String get onboarding2Subtitle => 'Get feedback from on-device models and backend AI.';

  @override
  String get onboarding3Title => 'Get Drills to improve';

  @override
  String get onboarding3Subtitle => 'Drills to improve upon your skills';

  @override
  String get next => 'Next';

  @override
  String get continueButton => 'Continue';

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginEmail => 'Email';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get loginButton => 'Login';

  @override
  String get loginRegisterPrompt => 'Don’t have an account? Register';

  @override
  String get registerTitle => 'Register';

  @override
  String get registerName => 'Full Name';

  @override
  String get registerEmail => 'Email';

  @override
  String get registerPassword => 'Password';

  @override
  String get registerConfirmPassword => 'Confirm Password';

  @override
  String get registerButton => 'Register';

  @override
  String get registerLoginPrompt => 'Already have an account? Login';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String dashboardGreeting(Object userName) {
    return 'Welcome, $userName!';
  }

  @override
  String get dashboardTotalProgress => 'Total Progress';

  @override
  String get dashboardSessions => 'Sessions';

  @override
  String get dashboardAchievements => 'Achievements';

  @override
  String get progressTitle => 'Progress';

  @override
  String get progressHeight => 'Height';

  @override
  String get progressWeight => 'Weight';

  @override
  String get progressEndurance => 'Endurance';

  @override
  String get progressSpeed => 'Speed';

  @override
  String get progressStrength => 'Strength';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Change Language';

  @override
  String get settingsTheme => 'Change Theme';
}
