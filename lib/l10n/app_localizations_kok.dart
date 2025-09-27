// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Konkani (`kok`).
class AppLocalizationsKok extends AppLocalizations {
  AppLocalizationsKok([String locale = 'kok']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'तुझो पारफॉर्मन्स ट्रॅक कर';

  @override
  String get onboarding1Subtitle => 'उंचाई, वजन, स‍हनश‍क्ति इ. सोप्यान माप';

  @override
  String get onboarding2Title => 'AI आधारीत माहिती';

  @override
  String get onboarding2Subtitle => 'डिवाईस मॉडेल आनी बॅकएंड AI कडेन फीडबॅक मेळ';

  @override
  String get onboarding3Title => 'सुधाराक ड्रिल्स मेळ';

  @override
  String get onboarding3Subtitle => 'कौशल्य सुधारपाक अभ्यास';

  @override
  String get next => 'फुडें';

  @override
  String get continueButton => 'चालू द';

  @override
  String get selectLanguage => 'तुझी भाषा वेंच';

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
