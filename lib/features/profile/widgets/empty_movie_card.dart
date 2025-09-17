import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_anims.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';
import 'package:lottie/lottie.dart';

class EmptyMovieCard extends StatelessWidget {
  const EmptyMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Lottie.asset(
          AppAnims.empty,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          repeat: true,
        ),
        Text(
          context.t.no_liked_movies,
          style: AppTextStyles.bodyNormal(color: AppColors.white70),
        ),
      ],
    );
  }
}
