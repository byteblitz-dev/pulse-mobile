// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'আপনার কর্মক্ষমতা ট্র্যাক করুন';

  @override
  String get onboarding1Subtitle => 'উচ্চতা, ওজন, সহনশীলতা ইত্যাদি সহজে মাপুন।';

  @override
  String get onboarding2Title => 'এআই দ্বারা চালিত অন্তর্দৃষ্টি';

  @override
  String get onboarding2Subtitle => 'ডিভাইস মডেল এবং ব্যাকএন্ড এআই থেকে প্রতিক্রিয়া পান।';

  @override
  String get onboarding3Title => 'উন্নতির জন্য ড্রিলস পান';

  @override
  String get onboarding3Subtitle => 'দক্ষতা উন্নত করতে অনুশীলন';

  @override
  String get next => 'পরবর্তী';

  @override
  String get continueButton => 'চালিয়ে যান';

  @override
  String get selectLanguage => 'আপনার ভাষা নির্বাচন করুন';

  @override
  String get loginTitle => 'লগইন';

  @override
  String get loginEmail => 'ইমেইল';

  @override
  String get loginPassword => 'পাসওয়ার্ড';

  @override
  String get loginFailed => 'লগইন ব্যর্থ হয়েছে';

  @override
  String get loginButton => 'লগইন';

  @override
  String get loginRegisterPrompt => 'অ্যাকাউন্ট নেই? নিবন্ধন করুন';

  @override
  String get registerTitle => 'নিবন্ধন';

  @override
  String get registerName => 'পুরো নাম';

  @override
  String get registerEmail => 'ইমেইল';

  @override
  String get registerPassword => 'পাসওয়ার্ড';

  @override
  String get registerConfirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get registerButton => 'নিবন্ধন';

  @override
  String get registerLoginPrompt => 'ইতিমধ্যেই একটি অ্যাকাউন্ট আছে? লগইন করুন';

  @override
  String get dashboardTitle => 'ড্যাশবোর্ড';

  @override
  String dashboardGreeting(Object userName) {
    return 'স্বাগতম, $userName!';
  }

  @override
  String get dashboardTotalProgress => 'মোট অগ্রগতি';

  @override
  String get dashboardSessions => 'সেশন';

  @override
  String get dashboardAchievements => 'সাফল্য';

  @override
  String get progressTitle => 'প্রগতি';

  @override
  String get progressHeight => 'উচ্চতা';

  @override
  String get progressWeight => 'ওজন';

  @override
  String get progressEndurance => 'সহনশীলতা';

  @override
  String get progressSpeed => 'গতি';

  @override
  String get progressStrength => 'শক্তি';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get settingsTheme => 'থিম পরিবর্তন করুন';
}
