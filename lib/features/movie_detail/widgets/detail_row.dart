import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '$title:',
            style: AppTextStyles.bodyNormal(
              weight: FontWeight.w500,
              color: AppColors.white70,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyNormal(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
