import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_anims.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'NoConnectionRoute')
class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAnims.noConnection, width: 150, height: 150),
              Icon(Icons.wifi_off, size: 100, color: AppColors.error),
              Text(
                context.t.no_internet_connection,
                style: AppTextStyles.bodyLarge(color: AppColors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
