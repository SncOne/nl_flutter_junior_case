import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/mixins/validators_mixin.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/overlay/custom_overlay.dart';
import 'package:jr_case_boilerplate/core/widgets/shine_overlay/shine_overlay.dart';
import 'package:jr_case_boilerplate/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_provider.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/auth_rich_text.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/custom_check_box.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

@RoutePage(name: 'RegisterRoute')
class RegisterView extends HookConsumerWidget with ValidatorsMixin {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repasswordController = useTextEditingController();
    final nameSurnameController = useTextEditingController();
    final termsAccepted = useState(false);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                          vertical: 16.0,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 12,
                            children: [
                              Stack(
                                children: [
                                  const Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Center(child: ShineOverlay()),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: 12,
                                    children: [
                                      SizedBox(height: isTablet ? 100 : 50),

                                      Image.asset(
                                        AppImages.appLogo,
                                        width: 78,
                                        height: 78,
                                      ),
                                      Text(
                                        context.t.createAccount,
                                        style: AppTextStyles.h4(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        context.t.createAccountSubtitle,
                                        style: AppTextStyles.bodyNormal(
                                          color: AppColors.white90,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),

                                      Column(
                                        spacing: 24,
                                        children: [
                                          CustomTextFormField(
                                            hintText:
                                                '${context.t.name} ${context.t.surname}',
                                            controller: nameSurnameController,
                                            keyboardType: TextInputType.name,
                                            prefixIcon: Image.asset(
                                              AppIcons.profile,
                                            ),

                                            validator: (value) =>
                                                validateName(value),
                                          ),

                                          CustomTextFormField(
                                            hintText: context.t.email,
                                            controller: emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            prefixIcon: Image.asset(
                                              AppIcons.mail,
                                            ),

                                            validator: (value) =>
                                                validateEmail(value),
                                          ),

                                          CustomTextFormField(
                                            hintText: context.t.password,
                                            controller: passwordController,
                                            obscureText: true,
                                            showVisibilityToggle: true,
                                            prefixIcon: Image.asset(
                                              AppIcons.lock,
                                            ),
                                            validator: (value) =>
                                                validatePassword(value),
                                          ),

                                          CustomTextFormField(
                                            hintText: context.t.confirmPassword,
                                            controller: repasswordController,
                                            obscureText: true,
                                            showVisibilityToggle: true,
                                            prefixIcon: Image.asset(
                                              AppIcons.lock,
                                            ),
                                            validator: (value) =>
                                                validateConfirmPassword(
                                                  value,
                                                  passwordController.text,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  CustomCheckbox(
                                    value: termsAccepted.value,
                                    onChanged: (value) {
                                      termsAccepted.value = value;
                                    },
                                  ),
                                  Expanded(
                                    child: AuthRichText(
                                      prefixText:
                                          context.t.termsAndConditions.prefix,
                                      actionText:
                                          context.t.termsAndConditions.action,
                                      actionOnTap: () {
                                        context.router.pushPath(
                                          AppRoutes.terms.path,
                                        );
                                      },
                                      suffixText:
                                          context.t.termsAndConditions.suffix,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: AppButton(
                                  label: context.t.signUp,
                                  onPressed: () async {
                                    if (!termsAccepted.value) {
                                      CustomOverlay.show(
                                        context,
                                        message: 'Lütfen şartları kabul edin',
                                        type: OverlayType.error,
                                      );
                                      return;
                                    }
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        final response = await ref
                                            .read(userProvider.notifier)
                                            .register(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameSurnameController.text,
                                            );
                                        Print.info(response);
                                        final token = response['data']['token'];
                                        if (token != null) {
                                          if (context.mounted) {
                                            CustomOverlay.show(
                                              context,
                                              message: 'Kayıt başarılı!',
                                              type: OverlayType.success,
                                            );
                                          }
                                          await secureStorage.write(
                                            key: AppLocalStorageKeys
                                                .jwtToken
                                                .name,
                                            value: token,
                                          );
                                          if (context.mounted) {
                                            context.router.replaceAll([
                                              UploadPhotoRoute(),
                                            ]);
                                          }
                                        } else {
                                          if (context.mounted) {
                                            CustomOverlay.show(
                                              context,
                                              message: 'Token alınamadı',
                                              type: OverlayType.error,
                                            );
                                          }
                                        }
                                      } catch (e, st) {
                                        Print.error('Login failed: $e', st: st);
                                        if (context.mounted) {
                                          CustomOverlay.show(
                                            context,
                                            message:
                                                'Kayıt başarısız: ${e.toString()}',
                                            type: OverlayType.error,
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
                                    onPressed: () {
                                      CustomOverlay.show(
                                        context,
                                        message: 'Çok yakında',
                                        type: OverlayType.info,
                                      );
                                    },
                                  ),
                                  AppButton(
                                    leftIcon: AppIcons.google,
                                    isFilled: false,
                                    padding: const EdgeInsets.all(8),
                                    iconSize: 60,
                                    borderRadius: 16,
                                    borderColor: AppColors.white20,
                                    onPressed: () {
                                      CustomOverlay.show(
                                        context,
                                        message: 'Çok yakında',
                                        type: OverlayType.info,
                                      );
                                    },
                                  ),
                                  AppButton(
                                    leftIcon: AppIcons.apple,
                                    padding: const EdgeInsets.all(8),
                                    isFilled: false,
                                    iconSize: 60,
                                    borderRadius: 16,
                                    borderColor: AppColors.white20,
                                    onPressed: () {
                                      CustomOverlay.show(
                                        context,
                                        message: 'Çok yakında',
                                        type: OverlayType.info,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.t.haveAccount,
                                    style: AppTextStyles.bodyNormal(
                                      color: AppColors.white90,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.router.pushPath(
                                        AppRoutes.login.path,
                                      );
                                    },
                                    child: Text(
                                      context.t.login,
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
