// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dogri (`doi`).
class AppLocalizationsDoi extends AppLocalizations {
  AppLocalizationsDoi([String locale = 'doi']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'तुसांदी प्रदर्शनी ट्रैक करो';

  @override
  String get onboarding1Subtitle => 'कद, वज़न, सहनशक्ति आदिकै आसानी नाल नापो।';

  @override
  String get onboarding2Title => 'ए.आई. आधारित जानकारी';

  @override
  String get onboarding2Subtitle => 'डिवाइस मॉडलां ते बैकएंड ए.आई. तो फीडबैक मेलो।';

  @override
  String get onboarding3Title => 'सुधार खातिर ड्रिल्स मेलो';

  @override
  String get onboarding3Subtitle => 'कौशल सुधारन खातिर अभ्यास';

  @override
  String get next => 'अग्गे';

  @override
  String get continueButton => 'जारी रखो';

  @override
  String get selectLanguage => 'अपणी भाषा चुनो';

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
