import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class PackageCard extends StatelessWidget {
  final bool isFeatured;
  final String discountLabel;
  final String tokens;
  final String oldTokens;
  final String price;
  const PackageCard({
    super.key,
    required this.isFeatured,
    required this.discountLabel,
    required this.tokens,
    required this.oldTokens,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final gradient =
        isFeatured
            ? AppColors.popularCardGradient
            : AppColors.normalCardGradient;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradient,
                begin: AlignmentGeometry.topLeft,
                end: AlignmentGeometry.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.white40, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white40,
                  blurRadius: 8.33,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              spacing: 12,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      oldTokens,
                      style: AppTextStyles.bodySmall(
                        color: AppColors.white50,
                      ).copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.white50,
                      ),
                    ),
                    Text(
                      tokens,
                      style: AppTextStyles.h3(color: AppColors.white),
                    ),
                    Text(
                      context.t.token,
                      style: AppTextStyles.bodySmall(color: AppColors.white70),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      price,
                      style: AppTextStyles.h5(color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.t.weekly,
                      style: AppTextStyles.bodyXSmall(color: AppColors.white60),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      isFeatured ? AppColors.secondary : AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.white40, width: 1),
                ),
                child: Text(
                  discountLabel,
                  style: AppTextStyles.bodyXSmall(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
