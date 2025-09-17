import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/detail_row.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class MovieDetailsSection extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.details,
          style: AppTextStyles.h4(color: AppColors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              if (movie.director.isNotEmpty && movie.director != 'N/A')
                DetailRow(title: context.t.director, value: movie.director),
              if (movie.writer.isNotEmpty && movie.writer != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(
                    title: context.t.writer,
                    value: movie.writer,
                  ),
                ),
              if (movie.actors.isNotEmpty && movie.actors != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(
                    title: context.t.actors,
                    value: movie.actors,
                  ),
                ),
              if (movie.released.isNotEmpty && movie.released != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(
                    title: context.t.released,
                    value: movie.released,
                  ),
                ),
              if (movie.type.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(
                    title: context.t.type,
                    value: movie.type.toUpperCase(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
