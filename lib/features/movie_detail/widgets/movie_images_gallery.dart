import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class MovieImagesGallery extends StatelessWidget {
  final MovieModel movie;

  const MovieImagesGallery({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie.images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.gallery,
          style: AppTextStyles.h4(color: AppColors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.images.length,
            itemBuilder: (context, index) {
              final imageUrls = movie.images.map((final img) => img).toList();
              final imageData = jsonEncode({'urls': imageUrls, 'index': index});
              return Container(
                margin: EdgeInsets.only(
                  right: index < movie.images.length - 1 ? 12 : 0,
                ),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomCachedNetworkImage(
                    imageUrl: movie.images[index],
                    fit: BoxFit.cover,
                    onTap: () => context.router.push(
                      FullScreenImageRoute(imageData: imageData),
                    ),
                    errorBuilder: (context, error) {
                      return Container(
                        color: AppColors.black,
                        child: const Icon(
                          Icons.image,
                          color: AppColors.white50,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
