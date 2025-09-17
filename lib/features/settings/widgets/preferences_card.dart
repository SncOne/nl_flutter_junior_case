import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/features/settings/widgets/language_dropdown.dart';
import 'package:jr_case_boilerplate/features/settings/widgets/preferences_tile.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class PreferencesCard extends HookWidget {
  const PreferencesCard({
    required this.selectedLanguageCode,
    required this.onLanguageChange,
    super.key,
  });

  final ValueNotifier<String> selectedLanguageCode;
  final Function(String) onLanguageChange;

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          PreferencesTile(
            title: context.t.select_language,
            icon: Icons.language_outlined,
            trailing: LanguageDropdown(
              selectedLanguageCode: selectedLanguageCode,
              onLanguageChange: onLanguageChange,
            ),
          ),
        ],
      ),
    );
  }
}
