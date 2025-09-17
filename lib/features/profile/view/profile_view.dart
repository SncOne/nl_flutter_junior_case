import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/app_bar/custom_app_bar.dart';
import 'package:jr_case_boilerplate/core/widgets/async_builder/async_value_builder.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_profile_provider.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

@RoutePage(name: 'ProfileRoute')
class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteMoviesProvider);
    final userAsync = ref.watch(getProfileProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: context.t.profile,
          titleTextStyle: AppTextStyles.h5(color: Colors.white),
          backgroundColor: AppColors.transparent,
          actionLabel: context.t.limited_offer,
          actionColor: AppColors.primary,
          actionIconPath: AppIcons.gem,
          actionOnPressed: () {
            context.router.push(const OfferBottomSheetRoute());
          },
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AsyncValueBuilder(
                asyncData: userAsync,
                builder: (user) {
                  final rawPhoto = user.photoUrl ?? '';
                  final photo = rawPhoto.trim();
                  final image = photo.isEmpty ? null : photo;

                  return Row(
                    spacing: 12,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white10,
                            width: 2,
                          ),
                        ),

                        child: ClipOval(
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: CustomCachedNetworkImage(
                              imageUrl: image ?? '',
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              onTap: () => context.router.push(
                                FullScreenImageRoute(
                                  imageData: jsonEncode({
                                    'urls': image != null ? [image] : [],
                                    'index': 0,
                                  }),
                                ),
                              ),
                              errorBuilder: (context, error) {
                                return SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: AppTextStyles.bodyLarge(
                                weight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              user.id,
                              style: AppTextStyles.bodyNormal(
                                color: AppColors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        onPressed: () {
                          context.router.push(
                            UploadPhotoRoute(initialPhotoUrl: image),
                          );
                        },
                        backgroundColor: AppColors.transparent,
                        borderColor: AppColors.white10,
                        label: context.t.add_photo,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 30),

              const Text(
                "Beğendiklerim",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              AsyncValueBuilder(
                asyncData: favoritesAsync,
                builder: (movies) => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final MovieModel movie = movies[index];
                    return GestureDetector(
                      onTap: () =>
                          context.router.push(MovieDetailRoute(movie: movie)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
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
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
