import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class ProfileMovieCard extends StatelessWidget {
  final MovieModel movie;
  const ProfileMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.router.push(MovieDetailRoute(movie: movie)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: IgnorePointer(
                ignoring: true,
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
            ),
          ),
          const SizedBox(height: 6),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            movie.director,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
