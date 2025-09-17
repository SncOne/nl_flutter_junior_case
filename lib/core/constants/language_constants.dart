import 'package:jr_case_boilerplate/core/models/language_model.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class LanguageConstants {
  static const List<LanguageModel> supportedLanguages = [
    LanguageModel(
      name: 'English',
      turkishName: 'İngilizce',
      englishName: 'English',
      code: 'en',
      localeName: 'en',
    ),
    LanguageModel(
      name: 'Türkçe',
      englishName: 'Turkish',
      turkishName: 'Türkçe',
      code: 'tr',
      localeName: 'tr',
    ),
  ];

  static AppLocale getAppLocaleFromCode(final String code) {
    switch (code) {
      case 'en':
        return AppLocale.en;
      case 'tr':
        return AppLocale.tr;
      default:
        return AppLocale.en;
    }
  }
}
