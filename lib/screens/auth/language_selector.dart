import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../auth/onboarding.dart';

/// Map of language codes to display names (native)
final Map<String, String> languageNames = {
  'en': 'English',
  'as': 'অসমীয়া',
  'bn': 'বাংলা',
  'bo': 'བོད་སྐད་',
  'doi': 'डोगरी',
  'gu': 'ગુજરાતી',
  'hi': 'हिन्दी',
  'kn': 'ಕನ್ನಡ',
  'ks': 'كشميري / کشمیری',
  'kok': 'कोंकणी',
  'mai': 'मैथिली',
  'ml': 'മലയാളം',
  'mni': 'ꯃꯤꯇꯩ ꯂꯣꯟ',
  'mr': 'मराठी',
  'ne': 'नेपाली',
  'or': 'ଓଡ଼ିଆ',
  'pa': 'ਪੰਜਾਬੀ',
  'sa': 'संस्कृतम्',
  'sat': 'ᱥᱟᱱᱛᱟᱲᱤ',
  'sd': 'سنڌي',
  'ta': 'தமிழ்',
  'te': 'తెలుగు',
  'ur': 'اردو',
  'brx':'बड़ो'
};

class LanguageSelectorScreen extends StatefulWidget {
  final Function(Locale) onLanguageSelected;
  const LanguageSelectorScreen({super.key, required this.onLanguageSelected});

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  Locale? _selectedLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)?.selectLanguage ?? "Select Language",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<Locale>(
                    value: _selectedLocale,
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    underline: const SizedBox(),
                    items: AppLocalizations.supportedLocales.map((locale) {
                      return DropdownMenuItem(
                        value: locale,
                        child: Text(
                          languageNames[locale.languageCode] ?? locale.languageCode,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      );
                    }).toList(),
                    onChanged: (locale) {
                      if (locale != null) {
                        setState(() {
                          _selectedLocale = locale;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _selectedLocale == null
                      ? null
                      : () {
                    // Set selected locale in PulseApp
                    widget.onLanguageSelected(_selectedLocale!);

                    // Navigate directly to OnboardingScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OnboardingScreen(
                          onLanguageSelected: widget.onLanguageSelected,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)?.continueButton ?? "Continue",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
