// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'پنهنجي ڪارڪردگي کي ٽريڪ ڪريو';

  @override
  String get onboarding1Subtitle => 'اوچائي، وزن، برداشت وغيره کي آساني سان ماپو.';

  @override
  String get onboarding2Title => 'اے آءِ بنياد بصيرتون';

  @override
  String get onboarding2Subtitle => 'ڊوائيس ماڊلز ۽ بيڪ اينڊ اے آءِ کان راءِ حاصل ڪريو.';

  @override
  String get onboarding3Title => 'سڌاري لاءِ ڊرلز حاصل ڪريو';

  @override
  String get onboarding3Subtitle => 'مهارت بهتر ڪرڻ لاءِ مشقون';

  @override
  String get next => 'اڳيون';

  @override
  String get continueButton => 'جاري رکو';

  @override
  String get selectLanguage => 'پنهنجي ٻولي چونڊيو';

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
