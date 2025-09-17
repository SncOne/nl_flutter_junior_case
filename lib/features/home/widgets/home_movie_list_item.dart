import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/favorite_button.dart';

class HomeMovieListItem extends ConsumerWidget {
  final MovieModel movie;
  final VoidCallback onTap;

  const HomeMovieListItem({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomCachedNetworkImage(
                imageUrl: movie.poster,
                fit: BoxFit.cover,
                errorBuilder: (context, error) {
                  return Container(
                    width: double.infinity,
                    color: AppColors.white20,
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.movie,
                      size: 50,
                      color: Colors.white54,
                    ),
                  );
                },
              ),
            ),

            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: FavoriteButton(movie: movie),
                  ),
                  Text(
                    movie.title,
                    style: AppTextStyles.bodyLarge(
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(
                    movie.plot,
                    style: AppTextStyles.bodySmall(
                      color: Colors.white,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
