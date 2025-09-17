import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/features/offer/widgets/bonus_item.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class BonusItemCard extends StatelessWidget {
  const BonusItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white20),
        gradient: RadialGradient(colors: [AppColors.white10, AppColors.white5]),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.t.bonus,
            style: AppTextStyles.bodyLarge(color: AppColors.white),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BonusItem(
                  asset: AppIcons.premium,
                  label: context.t.premium_account,
                ),
              ),
              Expanded(
                child: BonusItem(
                  asset: AppIcons.morematch,
                  label: context.t.more_matches,
                ),
              ),
              Expanded(
                child: BonusItem(
                  asset: AppIcons.promote,
                  label: context.t.featured,
                ),
              ),
              Expanded(
                child: BonusItem(
                  asset: AppIcons.morelike,
                  label: context.t.more_likes,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
