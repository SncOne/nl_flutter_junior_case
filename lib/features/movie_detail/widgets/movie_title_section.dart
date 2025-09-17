import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';

class MovieTitleSection extends StatelessWidget {
  final MovieModel movie;

  const MovieTitleSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title, style: AppTextStyles.h3(color: AppColors.white)),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              if (movie.year.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.year,
                    style: AppTextStyles.bodySmall(
                      weight: FontWeight.w600,
                      color: AppColors.white70,
                    ),
                  ),
                ),
              if (movie.rated.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.rated,
                    style: AppTextStyles.bodySmall(
                      weight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
