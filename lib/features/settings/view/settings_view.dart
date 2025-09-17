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
import 'package:jr_case_boilerplate/features/settings/widgets/preferences_card.dart';
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
