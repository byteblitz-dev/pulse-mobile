// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'మీ ప్రదర్శనను ట్రాక్ చేయండి';

  @override
  String get onboarding1Subtitle => 'ఎత్తు, బరువు, సహనశక్తి వంటి వాటిని సులభంగా కొలవండి.';

  @override
  String get onboarding2Title => 'ఏఐ ఆధారిత అవగాహనలు';

  @override
  String get onboarding2Subtitle => 'డివైస్ మోడల్స్ మరియు బ్యాక్‌ఎండ్ ఏఐ నుండి అభిప్రాయం పొందండి.';

  @override
  String get onboarding3Title => 'మెరుగుపడేందుకు డ్రిల్స్ పొందండి';

  @override
  String get onboarding3Subtitle => 'మీ నైపుణ్యాలను మెరుగుపరచడానికి సాధనాలు';

  @override
  String get next => 'తదుపరి';

  @override
  String get continueButton => 'కొనసాగించు';

  @override
  String get selectLanguage => 'మీ భాషను ఎంచుకోండి';

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
