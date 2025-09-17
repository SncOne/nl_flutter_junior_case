import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/app_bar/custom_app_bar.dart';
import 'package:jr_case_boilerplate/core/widgets/async_builder/async_value_builder.dart';
import 'package:jr_case_boilerplate/features/auth/provider/user_profile_provider.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/empty_movie_card.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_card.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_movie_card.dart';
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

                  return ProfileCard(user: user, image: image);
                },
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 30),

              Text(
                context.t.liked_movies,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              AsyncValueBuilder(
                asyncData: favoritesAsync,
                builder: (movies) {
                  Print.error('Movies empty?: $movies');
                  if (movies.isEmpty) {
                    return const EmptyMovieCard();
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: movies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (context, index) {
                      final MovieModel movie = movies[index];
                      return ProfileMovieCard(movie: movie);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
