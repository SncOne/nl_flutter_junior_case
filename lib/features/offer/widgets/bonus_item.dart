import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';

class BonusItem extends StatelessWidget {
  final String asset;
  final String label;
  const BonusItem({super.key, required this.asset, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white40, width: 1),
            ),
            child: Center(
              child: Image.asset(
                asset,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: 72,
          child: Text(
            label,
            style: AppTextStyles.bodySmall(color: AppColors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
