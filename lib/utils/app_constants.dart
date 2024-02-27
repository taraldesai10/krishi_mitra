import 'package:krishi_mitra/models/lenguage_model.dart';

class AppConstants {
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
      // imageUrl: "🇺🇸",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      // imageUrl: "🇵🇰",
      languageName: 'हिंदी',
      countryCode: 'IN',
      languageCode: 'hi',
    ),
    LanguageModel(
      // imageUrl: "🇵🇰",
      languageName: 'ગુજરાતી',
      countryCode: 'IN',
      languageCode: 'gu',
    ),
  ];
}
