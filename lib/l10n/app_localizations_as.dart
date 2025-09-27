// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'আপোনাৰ পৰিফৰ্মেন্স ট্ৰেক কৰক';

  @override
  String get onboarding1Subtitle => 'উচ্চতা, ওজন, সহনশীলতা আদি সহজে মাপক।';

  @override
  String get onboarding2Title => 'এআই-ভিত্তিক অন্তৰ্দৃষ্টি';

  @override
  String get onboarding2Subtitle => 'ডিভাইচ মডেল আৰু বেকএণ্ড এআইৰ পৰা মতামত লাভ কৰক।';

  @override
  String get onboarding3Title => 'উন্নতিৰ বাবে ড্ৰিল লাভ কৰক';

  @override
  String get onboarding3Subtitle => 'দক্ষতা উন্নত কৰিবলৈ অভ্যাসসমূহ';

  @override
  String get next => 'পিছলৈ';

  @override
  String get continueButton => 'আগবাঢ়ক';

  @override
  String get selectLanguage => 'আপোনাৰ ভাষা বাছনি কৰক';

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
