// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'ನಿಮ್ಮ ಪ್ರದರ್ಶನವನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ';

  @override
  String get onboarding1Subtitle => 'ಎತ್ತರ, ತೂಕ, ಸಹಿಷ್ಣುತೆಯನ್ನು ಸುಲಭವಾಗಿ ಅಳೆಯಿರಿ.';

  @override
  String get onboarding2Title => 'ಎಐ ಆಧಾರಿತ ಒಳನೋಟಗಳು';

  @override
  String get onboarding2Subtitle => 'ಡಿವೈಸ್ ಮಾದರಿ ಮತ್ತು ಬ್ಯಾಕ್‌ಎಂಡ್ ಎಐಯಿಂದ ಪ್ರತಿಕ್ರಿಯೆ ಪಡೆಯಿರಿ.';

  @override
  String get onboarding3Title => 'ಮೆಚ್ಚುಗೆಯಿಗಾಗಿ ಡ್ರಿಲ್ಸ್ ಪಡೆಯಿರಿ';

  @override
  String get onboarding3Subtitle => 'ಕೌಶಲ್ಯ ಅಭಿವೃದ್ಧಿಗೆ ಅಭ್ಯಾಸಗಳು';

  @override
  String get next => 'ಮುಂದೆ';

  @override
  String get continueButton => 'ಮುಂದುವರಿಸಿ';

  @override
  String get selectLanguage => 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

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
