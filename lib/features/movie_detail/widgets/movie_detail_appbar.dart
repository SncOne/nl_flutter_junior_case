import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieModel movie;
  final BoxConstraints constraints;

  const MovieDetailAppBar({
    super.key,
    required this.movie,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = constraints.maxWidth > 768;

    return SliverAppBar(
      expandedHeight: isTablet ? 400 : 300,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie.poster,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.black,
                  child: const Icon(
                    Icons.movie,
                    size: 100,
                    color: AppColors.white50,
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.transparent,
                    AppColors.black.withValues(alpha: 0.7),
                    AppColors.black.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
