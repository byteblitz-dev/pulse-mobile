// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'உங்கள் செயல்திறனை கண்காணிக்கவும்';

  @override
  String get onboarding1Subtitle => 'உயரம், எடை, சகிப்புத்தன்மை ஆகியவற்றை எளிதாக அளவிடுங்கள்.';

  @override
  String get onboarding2Title => 'ஏஐ இயக்கப்படும் உள்ளடக்கம்';

  @override
  String get onboarding2Subtitle => 'சாதன மாதிரிகள் மற்றும் பின்தள ஏஐ-இலிருந்து கருத்துகளைப் பெறுங்கள்.';

  @override
  String get onboarding3Title => 'மேம்படுத்த பயிற்சிகளை பெறுங்கள்';

  @override
  String get onboarding3Subtitle => 'திறனை மேம்படுத்த பயிற்சிகள்';

  @override
  String get next => 'அடுத்து';

  @override
  String get continueButton => 'தொடரவும்';

  @override
  String get selectLanguage => 'உங்கள் மொழியைத் தேர்வு செய்யவும்';

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
