import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/constants/language_constants.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

@RoutePage(name: 'SettingsRoute')
class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguageCode = useState('');

    Future<void> initLanguage(final ValueNotifier<String> code) async {
      final savedLang = await secureStorage.read(
        key: AppLocalStorageKeys.selectedLanguageCode.name,
      );
      if (savedLang != null) code.value = savedLang;
    }

    useEffect(() {
      initLanguage(selectedLanguageCode);

      return null;
    }, []);

    Future<void> saveLanguage(final String langCode) async {
      await secureStorage.write(
        key: AppLocalStorageKeys.selectedLanguageCode.name,
        value: langCode,
      );
      selectedLanguageCode.value = langCode;

      await LocaleSettings.setLocale(
        LanguageConstants.getAppLocaleFromCode(langCode),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: AppColors.bgGradient,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: AppColors.transparent,
              iconTheme: const IconThemeData(color: AppColors.white),
              title: Text(
                context.t.settings,
                style: AppTextStyles.h5(color: AppColors.white),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreferencesCard(
                    selectedLanguageCode: selectedLanguageCode,
                    onLanguageChange: saveLanguage,
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      context.t.version(value: AppStrings.appVersion),
                      style: AppTextStyles.bodySmall(color: AppColors.white60),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

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

class PreferencesTile extends StatelessWidget {
  const PreferencesTile({
    required this.title,
    required this.icon,
    required this.trailing,
    this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final Widget trailing;
  final Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.secondary, size: 24),
                ),
                Text(
                  title,
                  style: AppTextStyles.bodyNormal(color: AppColors.white),
                ),
              ],
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

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
