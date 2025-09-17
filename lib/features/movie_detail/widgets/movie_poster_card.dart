import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class MoviePosterCard extends StatelessWidget {
  final MovieModel movie;
  final double width;
  final double height;

  const MoviePosterCard({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomCachedNetworkImage(
          imageUrl: movie.poster,
          fit: BoxFit.cover,
          onTap: () => context.router.push(
            FullScreenImageRoute(
              imageData: jsonEncode({
                'urls': [movie.poster],
                'index': 0,
              }),
            ),
          ),
          errorBuilder: (context, error) {
            return Container(
              color: AppColors.white20,
              child: const Icon(
                Icons.movie,
                size: 50,
                color: AppColors.white50,
              ),
            );
          },
        ),
      ),
    );
  }
}
