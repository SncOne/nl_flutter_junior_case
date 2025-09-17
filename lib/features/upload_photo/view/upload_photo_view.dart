import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/overlay/custom_overlay.dart';
import 'package:jr_case_boilerplate/core/widgets/shine_overlay/shine_overlay.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_profile_provider.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_provider.dart';
import 'package:jr_case_boilerplate/features/upload_photo/widgets/dashed_border_box.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

@RoutePage(name: 'UploadPhotoRoute')
class UploadPhotoView extends HookConsumerWidget {
  final String? initialPhotoUrl;

  const UploadPhotoView({super.key, this.initialPhotoUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoUrl = useState<String?>(initialPhotoUrl);
    final localFile = useState<File?>(null);

    final isLoading = useState<bool>(false);

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        localFile.value = File(pickedFile.path);
        photoUrl.value = null;
      }
    }

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: AppColors.bgGradient,
            ),
          ),
          child: Stack(
            children: [
              Positioned(top: 10, left: 30, right: 20, child: ShineOverlay()),

              if (isLoading.value)
                Positioned.fill(
                  child: Container(
                    color: Colors.black54,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),

              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (context.router.canPop())
                            AppButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              backgroundColor: AppColors.transparent,
                              leftIcon: AppIcons.arrow,
                              padding: const EdgeInsets.all(8),
                              iconColor: AppColors.white,
                              borderRadius: 10,
                              borderColor: AppColors.white50,
                              isFilled: false,
                            ),
                          const Spacer(),
                          Text(
                            context.t.profile_detail,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.black.withValues(alpha: 0.25),
                      ),
                      child: Image.asset(
                        AppIcons.profileFill,
                        width: 32,
                        height: 40,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      context.t.upload_photo,
                      style: AppTextStyles.h5(color: AppColors.white),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      context.t.upload_photo_subtitle,
                      style: AppTextStyles.bodyNormal(color: AppColors.white70),
                    ),
                    const SizedBox(height: 32),

                    if (localFile.value != null ||
                        (photoUrl.value != null &&
                            photoUrl.value!.isNotEmpty)) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: localFile.value != null
                            ? Image.file(
                                localFile.value!,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                photoUrl.value!,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        onPressed: () {
                          photoUrl.value = null;
                          localFile.value = null;
                        },
                        backgroundColor: AppColors.transparent,
                        leftIcon: AppIcons.close,
                        isCircular: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        borderRadius: 900,
                        borderColor: AppColors.white50,
                        isFilled: false,
                      ),
                    ] else ...[
                      GestureDetector(
                        onTap: () async => pickImage(),
                        child: DashedBorderBox(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white54,
                          dashWidth: 8,
                          dashSpace: 6,
                        ),
                      ),
                    ],

                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              label: context.t.kContinue,
                              onPressed:
                                  (localFile.value != null ||
                                      (photoUrl.value != null &&
                                          photoUrl.value!.isNotEmpty))
                                  ? () async {
                                      if (isLoading.value) return;
                                      isLoading.value = true;
                                      try {
                                        if (localFile.value != null) {
                                          final user = ref.read(
                                            userProvider.notifier,
                                          );
                                          await user.uploadPhoto(
                                            localFile.value!,
                                          );
                                        }
                                        ref.invalidate(getProfileProvider);
                                        if (context.mounted) {
                                          if (context.router.canPop()) {
                                            context.router.pop();
                                          } else {
                                            context.router.replaceAll([
                                              const HomeRoute(),
                                            ]);
                                          }
                                        }
                                      } catch (e) {
                                        if (context.mounted) {
                                          CustomOverlay.show(
                                            context,
                                            message:
                                                'Fotoğraf yüklenemedi: ${e.toString()}',
                                            type: OverlayType.error,
                                          );
                                        }
                                      } finally {
                                        isLoading.value = false;
                                      }
                                    }
                                  : null,

                              backgroundColor: AppColors.primary,
                              disabledColor: AppColors.primaryDark,
                              textColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              borderRadius: 12,
                              isDisabled:
                                  isLoading.value ||
                                  !(localFile.value != null ||
                                      (photoUrl.value != null &&
                                          photoUrl.value!.isNotEmpty)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              if (context.router.canPop()) {
                                context.router.pop();
                              } else {
                                context.router.replaceAll([const HomeRoute()]);
                              }
                            },
                            child: Text(
                              context.t.skip,
                              style: AppTextStyles.bodyNormal(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
