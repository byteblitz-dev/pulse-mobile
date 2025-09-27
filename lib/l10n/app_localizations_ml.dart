// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'നിങ്ങളുടെ പ്രകടനം ട്രാക്കുചെയ്യൂ';

  @override
  String get onboarding1Subtitle => 'ഉയരം, ഭാരം, സഹിഷ്ണുത എന്നിവ എളുപ്പത്തിൽ അളക്കുക.';

  @override
  String get onboarding2Title => 'എ.ഐ. അടിസ്ഥാനത്തിലുള്ള അറിവുകൾ';

  @override
  String get onboarding2Subtitle => 'ഡിവൈസ് മോഡലുകളും ബാക്ക്എൻഡ് എ.ഐയും നൽകുന്ന ഫീഡ്ബാക്ക് നേടൂ.';

  @override
  String get onboarding3Title => 'മെച്ചപ്പെടുത്താൻ ഡ്രില്ലുകൾ നേടൂ';

  @override
  String get onboarding3Subtitle => 'കൗശലം മെച്ചപ്പെടുത്താനുള്ള അഭ്യാസങ്ങൾ';

  @override
  String get next => 'അടുത്തത്';

  @override
  String get continueButton => 'തുടരുക';

  @override
  String get selectLanguage => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

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
