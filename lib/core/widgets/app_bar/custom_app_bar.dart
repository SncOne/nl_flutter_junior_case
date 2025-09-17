import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_provider.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class CustomAppBar extends ConsumerWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final Color backgroundColor;
  final VoidCallback? actionOnPressed;
  final String? actionLabel;
  final Color? actionColor;
  final String? actionIconPath;
  const CustomAppBar({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.centerTitle = false,
    required this.backgroundColor,
    this.actionOnPressed,
    this.actionLabel,
    this.actionColor,
    this.actionIconPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title, style: titleTextStyle),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: [
        AppButton(
          onPressed: actionOnPressed,
          label: actionLabel,
          backgroundColor: actionColor ?? Colors.transparent,
          leftIcon: actionIconPath,
        ),
        const SizedBox(width: 8),
        Tooltip(
          message: context.t.settings,
          child: PopupMenuButton<int>(
            offset: const Offset(0, kToolbarHeight - 8),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: AppColors.white,
            constraints: const BoxConstraints(minWidth: 140, maxWidth: 200),
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.white10,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppIcons.threeDots,
                color: AppColors.white,
                height: 20,
              ),
            ),

            onSelected: (value) {
              if (value == 0) {
                context.router.push(const SettingsRoute());
              } else if (value == 1) {
                ref.read(userProvider.notifier).logout();
                context.router.replaceAll([const LoginRoute()]);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.settings,
                      height: 18,
                      color: AppColors.black,
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        context.t.settings,
                        style: AppTextStyles.bodySmall(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.logout,
                      height: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        context.t.logout,
                        style: AppTextStyles.bodySmall(
                          color: AppColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16.0),
    );
  }
}
