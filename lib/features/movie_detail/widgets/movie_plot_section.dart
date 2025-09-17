import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class MoviePlotSection extends StatelessWidget {
  final MovieModel movie;

  const MoviePlotSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie.plot.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.t.plot, style: AppTextStyles.h4(color: AppColors.white)),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Text(
            movie.plot,
            style: AppTextStyles.bodyLarge(
              color: AppColors.white70,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
