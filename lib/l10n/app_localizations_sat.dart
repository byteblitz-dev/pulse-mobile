// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Santali (`sat`).
class AppLocalizationsSat extends AppLocalizations {
  AppLocalizationsSat([String locale = 'sat']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'आमाक् कामाक् नोतोक् कुरुम’';

  @override
  String get onboarding1Subtitle => 'लांबा, भार, सहा’रे बाडाय रे साधा’ ते मेनाक् मे';

  @override
  String get onboarding2Title => 'AI ओना’ रे आदेर';

  @override
  String get onboarding2Subtitle => 'डिबाइस मोडेल आ बैकएंड AI खोन ओना’ सेत’ लेकाते';

  @override
  String get onboarding3Title => 'भाला होड मे’ ते ड्रिल लेकाते';

  @override
  String get onboarding3Subtitle => 'दोन कु’ राकाब रे आचोर';

  @override
  String get next => 'आगे';

  @override
  String get continueButton => 'चालाव';

  @override
  String get selectLanguage => 'चेत् आदेर काथा बाछाव';

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
