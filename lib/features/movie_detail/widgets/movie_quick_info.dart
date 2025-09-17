import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/info_row.dart';

class MovieQuickInfo extends StatelessWidget {
  final MovieModel movie;

  const MovieQuickInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movie.runtime.isNotEmpty)
          InfoRow(
            icon: Icons.access_time,
            title: 'Runtime',
            value: movie.runtime,
          ),
        if (movie.genre.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: InfoRow(
              icon: Icons.category,
              title: 'Genre',
              value: movie.genre,
            ),
          ),
        if (movie.language.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: InfoRow(
              icon: Icons.language,
              title: 'Language',
              value: movie.language,
            ),
          ),
        if (movie.country.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: InfoRow(
              icon: Icons.flag,
              title: 'Country',
              value: movie.country,
            ),
          ),
      ],
    );
  }
}
