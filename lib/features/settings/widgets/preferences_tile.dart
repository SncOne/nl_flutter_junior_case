import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';

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
