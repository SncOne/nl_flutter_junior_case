class LanguageModel {
  const LanguageModel({
    required this.name,
    required this.turkishName,
    required this.englishName,
    required this.code,
    required this.localeName,
  });
  final String name;
  final String code;
  final String turkishName;
  final String englishName;
  final String localeName;
}
