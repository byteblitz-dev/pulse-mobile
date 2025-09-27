// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'आफ्नो प्रदर्शन ट्रयाक गर्नुहोस्';

  @override
  String get onboarding1Subtitle => 'उचाइ, तौल, सहनशीलता आदि सजिलै मापन गर्नुहोस्।';

  @override
  String get onboarding2Title => 'एआई-आधारित अन्तर्दृष्टि';

  @override
  String get onboarding2Subtitle => 'डिभाइस मोडेल र ब्याकइण्ड एआईबाट प्रतिक्रियाहरू पाउनुहोस्।';

  @override
  String get onboarding3Title => 'सुधारका लागि ड्रिलहरू प्राप्त गर्नुहोस्';

  @override
  String get onboarding3Subtitle => 'सीप सुधारका लागि अभ्यास';

  @override
  String get next => 'अर्को';

  @override
  String get continueButton => 'जारी राख्नुहोस्';

  @override
  String get selectLanguage => 'आफ्नो भाषा छान्नुहोस्';

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
