import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_strings.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_anims.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/shine_overlay/shine_overlay.dart';
import 'package:jr_case_boilerplate/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_provider.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'LoginRoute')
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;
            final maxContentWidth = isTablet ? 500.0 : double.infinity;

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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Center(
                      child: Container(
                        width: maxContentWidth,
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 48.0 : 24.0,
                          vertical: 24.0,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 24,
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    const Positioned(
                                      top: 10,
                                      left: 0,
                                      right: 0,
                                      child: Center(child: ShineOverlay()),
                                    ),
                                    LottieBuilder.network(
                                      AppAnims.cdnLogin,
                                      animate: true,
                                      repeat: true,
                                      height: isTablet ? 300 : null,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 24,
                                children: [
                                  Image.asset(
                                    AppImages.appLogo,
                                    width: 78,
                                    height: 78,
                                  ),
                                  Text(
                                    context.t.login,
                                    style: AppTextStyles.h4(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    context.t.loginSubtitle,
                                    style: AppTextStyles.bodyNormal(
                                      color: AppColors.white90,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Column(
                                    spacing: 24,
                                    children: [
                                      CustomTextFormField(
                                        hintText: context.t.email,
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        prefixIcon: Image.asset(AppIcons.mail),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'E-posta adresi gereklidir';
                                          }
                                          if (!value.contains('@')) {
                                            return 'Geçerli bir e-posta adresi girin';
                                          }
                                          return null;
                                        },
                                      ),
                                      CustomTextFormField(
                                        hintText: context.t.password,
                                        controller: passwordController,
                                        obscureText: true,
                                        showVisibilityToggle: true,
                                        prefixIcon: Image.asset(AppIcons.lock),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Şifre gereklidir';
                                          }
                                          if (value.length < 6) {
                                            return 'Şifre en az 6 karakter olmalıdır';
                                          }
                                          return null;
                                        },
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            // context.router.pushPath(AppRoutes.forgotPassword.path);
                                          },
                                          child: Text(
                                            context.t.forgotPassword,
                                            style:
                                                AppTextStyles.bodyNormal(
                                                  color: AppColors.white90,
                                                ).copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 12,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: AppButton(
                                      label: context.t.login,
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          try {
                                            final response = await ref
                                                .read(userProvider.notifier)
                                                .login(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                );
                                            Print.info(response);
                                            final token =
                                                response['data']['token'];
                                            if (token != null) {
                                              secureStorage.write(
                                                key: AppStrings.jwtToken,
                                                value: token,
                                              );
                                              if (context.mounted) {
                                                context.router.replacePath(
                                                  AppRoutes.main.path,
                                                );
                                              }
                                            } else {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Token alınamadı',
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          } catch (e, st) {
                                            Print.error(
                                              'Login failed: $e',
                                              st: st,
                                            );
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Giriş başarısız: ${e.toString()}',
                                                  ),
                                                ),
                                              );
                                            }
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 15,
                                    children: [
                                      AppButton(
                                        leftIcon: AppIcons.facebook,
                                        isFilled: false,
                                        borderRadius: 16,
                                        padding: const EdgeInsets.all(8),
                                        iconSize: 60,
                                        borderColor: AppColors.white20,
                                        onPressed: () {},
                                      ),
                                      AppButton(
                                        leftIcon: AppIcons.google,
                                        isFilled: false,
                                        padding: const EdgeInsets.all(8),
                                        iconSize: 60,
                                        borderRadius: 16,
                                        borderColor: AppColors.white20,
                                        onPressed: () {},
                                      ),
                                      AppButton(
                                        leftIcon: AppIcons.apple,
                                        padding: const EdgeInsets.all(8),
                                        isFilled: false,
                                        iconSize: 60,
                                        borderRadius: 16,
                                        borderColor: AppColors.white20,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        context.t.noAccount,
                                        style: AppTextStyles.bodyNormal(
                                          color: AppColors.white90,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.router.pushPath(
                                            AppRoutes.register.path,
                                          );
                                        },
                                        child: Text(
                                          context.t.signUp,
                                          style:
                                              AppTextStyles.bodyNormal(
                                                color: AppColors.white,
                                              ).copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
