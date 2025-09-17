import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/constants/language_constants.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/providers/connectivity_provider.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedLanguageCode = await secureStorage.read(
    key: AppLocalStorageKeys.selectedLanguageCode.name,
  );

  if (savedLanguageCode != null) {
    final appLocale = LanguageConstants.getAppLocaleFromCode(savedLanguageCode);
    await LocaleSettings.setLocale(appLocale);
  } else {
    final deviceLocale = await LocaleSettings.useDeviceLocale();
    if (AppLocaleUtils.supportedLocales.contains(
      Locale(deviceLocale.languageCode),
    )) {
      await LocaleSettings.setLocale(deviceLocale);
      await secureStorage.write(
        key: AppLocalStorageKeys.selectedLanguageCode.name,
        value: deviceLocale.languageCode,
      );
    } else {
      await LocaleSettings.setLocale(AppLocale.en);
      await secureStorage.write(
        key: AppLocalStorageKeys.selectedLanguageCode.name,
        value: 'en',
      );
    }
  }
  runApp(TranslationProvider(child: ProviderScope(child: const MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.read(connectivityMonitorProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
      locale: const Locale('tr', 'TR'),
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
        ...GlobalCupertinoLocalizations.delegates,
      ],
      routerConfig: router.config(),
    );
  }
}
