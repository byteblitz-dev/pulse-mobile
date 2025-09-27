// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kashmiri (`ks`).
class AppLocalizationsKs extends AppLocalizations {
  AppLocalizationsKs([String locale = 'ks']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'پنٛنۍ کارکردگی ٹریک کٔریو';

  @override
  String get onboarding1Subtitle => 'قد، وزن، برداشت وغیرہ آسانی سان ماپیو۔';

  @override
  String get onboarding2Title => 'AI بُنہ بنیاد بۄدھ';

  @override
  String get onboarding2Subtitle => 'ڈیوایِس ماڈلٕ ہندٕ تے بیک اینڈ AI پیٹھ تام رائے مِلِتھ۔';

  @override
  String get onboarding3Title => 'بہترٕ کرنئ خٕاطر ڈرلٕ حاصل کٔریو';

  @override
  String get onboarding3Subtitle => 'صلاحیت بہترٕ بنون خٕاطر مشق';

  @override
  String get next => 'پتھر';

  @override
  String get continueButton => 'جاری رکھیو';

  @override
  String get selectLanguage => 'پنٛنۍ زبأن ژٲریو';

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
