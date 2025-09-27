// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Pulse Mobile';

  @override
  String get onboarding1Title => 'अपना प्रदर्शन ट्रैक करें';

  @override
  String get onboarding1Subtitle => 'ऊँचाई, वजन, सहनशक्ति आदि को आसानी से मापें।';

  @override
  String get onboarding2Title => 'एआई-संचालित अंतर्दृष्टि';

  @override
  String get onboarding2Subtitle => 'डिवाइस मॉडल और बैकएंड एआई से फीडबैक प्राप्त करें।';

  @override
  String get onboarding3Title => 'सुधार के लिए अभ्यास प्राप्त करें';

  @override
  String get onboarding3Subtitle => 'कौशल सुधारने के लिए अभ्यास';

  @override
  String get next => 'आगे';

  @override
  String get continueButton => 'जारी रखें';

  @override
  String get selectLanguage => 'अपनी भाषा चुनें';

  @override
  String get loginTitle => 'लॉगिन';

  @override
  String get loginEmail => 'ईमेल';

  @override
  String get loginPassword => 'पासवर्ड';

  @override
  String get loginFailed => 'लॉगिन असफल';

  @override
  String get loginButton => 'लॉगिन';

  @override
  String get loginRegisterPrompt => 'खाता नहीं है? रजिस्टर करें';

  @override
  String get registerTitle => 'रजिस्टर';

  @override
  String get registerName => 'पूरा नाम';

  @override
  String get registerEmail => 'ईमेल';

  @override
  String get registerPassword => 'पासवर्ड';

  @override
  String get registerConfirmPassword => 'पासवर्ड पुष्टि करें';

  @override
  String get registerButton => 'रजिस्टर';

  @override
  String get registerLoginPrompt => 'पहले से खाता है? लॉगिन करें';

  @override
  String get dashboardTitle => 'डैशबोर्ड';

  @override
  String dashboardGreeting(Object userName) {
    return 'स्वागत है, $userName!';
  }

  @override
  String get dashboardTotalProgress => 'कुल प्रगति';

  @override
  String get dashboardSessions => 'सत्र';

  @override
  String get dashboardAchievements => 'उपलब्धियाँ';

  @override
  String get progressTitle => 'प्रगति';

  @override
  String get progressHeight => 'ऊँचाई';

  @override
  String get progressWeight => 'वजन';

  @override
  String get progressEndurance => 'सहनशक्ति';

  @override
  String get progressSpeed => 'गति';

  @override
  String get progressStrength => 'शक्ति';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा बदलें';

  @override
  String get settingsTheme => 'थीम बदलें';
}
