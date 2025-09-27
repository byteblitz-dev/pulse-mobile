// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'ଆପଣଙ୍କ କାର୍ଯ୍ୟକୁ ଟ୍ରାକ୍ କରନ୍ତୁ';

  @override
  String get onboarding1Subtitle => 'ଉଚ୍ଚତା, ଓଜନ, ସହନଶୀଳତା ଇତ୍ୟାଦି ସହଜରେ ମାପନ୍ତୁ।';

  @override
  String get onboarding2Title => 'ଏଆଇ ଆଧାରିତ ଜ୍ଞାନ';

  @override
  String get onboarding2Subtitle => 'ଡିଭାଇସ୍ ମଡେଲ୍ ଏବଂ ବ୍ୟାକଏଣ୍ଡ ଏଆଇରୁ ପ୍ରତିକ୍ରିୟା ପାଆନ୍ତୁ।';

  @override
  String get onboarding3Title => 'ସୁଧାର ପାଇଁ ଡ୍ରିଲ୍ସ ପାଆନ୍ତୁ';

  @override
  String get onboarding3Subtitle => 'ଦକ୍ଷତା ବୃଦ୍ଧି ପାଇଁ ଅଭ୍ୟାସ';

  @override
  String get next => 'ପରବର୍ତ୍ତୀ';

  @override
  String get continueButton => 'ଚାଲୁ ରଖନ୍ତୁ';

  @override
  String get selectLanguage => 'ଆପଣଙ୍କ ଭାଷା ଚୟନ କରନ୍ତୁ';

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
