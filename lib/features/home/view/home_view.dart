import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';

@RoutePage(name: 'HomeRoute')
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Home View'),
            TextButton(
              onPressed: () async {
                await secureStorage.delete(key: AppStrings.jwtToken);
                if (context.mounted) {
                  context.router.replaceAll([const LoginRoute()]);
                }
              },
              child: const Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
