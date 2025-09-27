// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'તમારી કામગીરી ટ્રૅક કરો';

  @override
  String get onboarding1Subtitle => 'ઊંચાઈ, વજન, સહનશક્તિ વગેરે સરળતાથી માપો.';

  @override
  String get onboarding2Title => 'એઆઈ આધારિત માર્ગદર્શન';

  @override
  String get onboarding2Subtitle => 'ડિવાઇસ મોડલો અને બેકએન્ડ એઆઈથી પ્રતિસાદ મેળવો.';

  @override
  String get onboarding3Title => 'સુધારવા માટે ડ્રિલ્સ મેળવો';

  @override
  String get onboarding3Subtitle => 'તમારી કુશળતા સુધારવા માટે અભ્યાસ';

  @override
  String get next => 'આગળ';

  @override
  String get continueButton => 'ચાલુ રાખો';

  @override
  String get selectLanguage => 'તમારી ભાષા પસંદ કરો';

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
