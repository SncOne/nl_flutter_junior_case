import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/constants/language_constants.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({
    required this.selectedLanguageCode,
    required this.onLanguageChange,
    super.key,
  });

  final ValueNotifier<String> selectedLanguageCode;
  final Function(String) onLanguageChange;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButtonFormField<String>(
        initialValue: selectedLanguageCode.value.isEmpty
            ? 'en'
            : selectedLanguageCode.value,
        isExpanded: false,
        icon: const Icon(Icons.arrow_drop_down, color: AppColors.secondary),
        style: AppTextStyles.bodyNormal(color: AppColors.white),
        dropdownColor: AppColors.primaryDark,
        items: _buildDropdownItems(),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.white10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.secondary),
          ),
        ),
        onChanged: (final newValue) {
          if (newValue != null) onLanguageChange(newValue);
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return LanguageConstants.supportedLanguages.map((final lang) {
      return DropdownMenuItem<String>(
        value: lang.code,
        child: Text(
          LocaleSettings.currentLocale.languageCode == 'tr'
              ? lang.turkishName
              : lang.englishName,
        ),
      );
    }).toList();
  }
}
