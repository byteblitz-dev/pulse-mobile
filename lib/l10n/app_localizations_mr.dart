// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'तुमचा परफॉर्मन्स ट्रॅक करा';

  @override
  String get onboarding1Subtitle => 'उंची, वजन, सहनशक्ती इ. सहज मोजा.';

  @override
  String get onboarding2Title => 'एआयवर आधारित अंतर्दृष्टी';

  @override
  String get onboarding2Subtitle => 'डिव्हाइस मॉडेल्स आणि बॅकएंड एआय कडून अभिप्राय मिळवा.';

  @override
  String get onboarding3Title => 'सुधारण्यासाठी ड्रिल्स मिळवा';

  @override
  String get onboarding3Subtitle => 'तुमची कौशल्ये सुधारण्यासाठी सराव';

  @override
  String get next => 'पुढे';

  @override
  String get continueButton => 'सुरू ठेवा';

  @override
  String get selectLanguage => 'तुमची भाषा निवडा';

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
