import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/widgets/shine_overlay/shine_overlay.dart';

@RoutePage(name: 'SplashRoute')
class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppStrings.appTitle;
    final token = useState<String?>(null);
    useEffect(() {
      Future.microtask(() async {
        await secureStorage.read(key: AppStrings.jwtToken).then((value) {
          token.value = value;
        });
      });

      return null;
    }, []);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: AppColors.bgGradient,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(child: ShineOverlay()),
              ),

              Center(
                child: TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: text.length),
                  duration: Duration(milliseconds: 150 * text.length),
                  builder: (context, value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.appLogo, height: 80),
                        const SizedBox(height: 20),
                        Text(
                          text.substring(0, value),
                          style: AppTextStyles.bodyXLarge(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    );
                  },
                  onEnd: () {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      if (token.value != null && token.value!.isNotEmpty) {
                        if (context.mounted) {
                          context.router.replacePath(AppRoutes.main.path);
                        }
                      } else {
                        if (context.mounted) {
                          context.router.replacePath(AppRoutes.login.path);
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
