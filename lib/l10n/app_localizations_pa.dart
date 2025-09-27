// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'ਆਪਣੀ ਪ੍ਰਦਰਸ਼ਨਸ਼ੀਲਤਾ ਟਰੈਕ ਕਰੋ';

  @override
  String get onboarding1Subtitle => 'ਲੰਬਾਈ, ਵਜ਼ਨ, ਸਹਿਨਸ਼ਕਤੀ ਆਦਿ ਆਸਾਨੀ ਨਾਲ ਮਾਪੋ।';

  @override
  String get onboarding2Title => 'ਏਆਈ ਆਧਾਰਿਤ ਅੰਦਰੂਨੀ ਜਾਣਕਾਰੀ';

  @override
  String get onboarding2Subtitle => 'ਡਿਵਾਈਸ ਮਾਡਲਾਂ ਅਤੇ ਬੈਕਐਂਡ ਏਆਈ ਤੋਂ ਫੀਡਬੈਕ ਲਓ।';

  @override
  String get onboarding3Title => 'ਸੁਧਾਰ ਲਈ ਡ੍ਰਿਲਾਂ ਹਾਸਲ ਕਰੋ';

  @override
  String get onboarding3Subtitle => 'ਕੁਸ਼ਲਤਾ ਸੁਧਾਰਣ ਲਈ ਅਭਿਆਸ';

  @override
  String get next => 'ਅੱਗੇ';

  @override
  String get continueButton => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get selectLanguage => 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ';

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
