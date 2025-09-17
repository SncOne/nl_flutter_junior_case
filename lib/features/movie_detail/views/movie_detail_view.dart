import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/core/widgets/overlay/custom_overlay.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';

@RoutePage(name: 'MovieDetailRoute')
class MovieDetailView extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: AppColors.bgGradient,
              ),
            ),
            child: CustomScrollView(
              slivers: [
                MovieDetailAppBar(movie: movie, constraints: constraints),
                SliverToBoxAdapter(
                  child: MovieDetailContent(
                    movie: movie,
                    constraints: constraints,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FavoriteButton(movie: movie),
    );
  }
}

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

class MovieDetailContent extends StatelessWidget {
  final MovieModel movie;
  final BoxConstraints constraints;

  const MovieDetailContent({
    super.key,
    required this.movie,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = constraints.maxWidth > 768;

    return Container(
      padding: EdgeInsets.all(isTablet ? 32 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieTitleSection(movie: movie),
          Container(
            margin: EdgeInsets.only(top: isTablet ? 32 : 24),
            child: isTablet
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            MoviePosterCard(
                              movie: movie,
                              width: 200,
                              height: 300,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 24),
                              child: MovieQuickInfo(movie: movie),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MoviePlotSection(movie: movie),
                              Container(
                                margin: const EdgeInsets.only(top: 32),
                                child: MovieDetailsSection(movie: movie),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MoviePosterCard(
                            movie: movie,
                            width: 120,
                            height: 180,
                          ),

                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: MovieQuickInfo(movie: movie),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: MoviePlotSection(movie: movie),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: MovieDetailsSection(movie: movie),
                      ),
                    ],
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: isTablet ? 32 : 24),
            child: MovieImagesGallery(movie: movie),
          ),
          Container(height: 80),
        ],
      ),
    );
  }
}

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

class MoviePlotSection extends StatelessWidget {
  final MovieModel movie;

  const MoviePlotSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie.plot.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Plot', style: AppTextStyles.h4(color: AppColors.white)),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Text(
            movie.plot,
            style: AppTextStyles.bodyLarge(
              color: AppColors.white70,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsSection extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: AppTextStyles.h4(color: AppColors.white)),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              if (movie.director.isNotEmpty && movie.director != 'N/A')
                DetailRow(title: 'Director', value: movie.director),
              if (movie.writer.isNotEmpty && movie.writer != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(title: 'Writer', value: movie.writer),
                ),
              if (movie.actors.isNotEmpty && movie.actors != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(title: 'Actors', value: movie.actors),
                ),
              if (movie.released.isNotEmpty && movie.released != 'N/A')
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(title: 'Released', value: movie.released),
                ),
              if (movie.type.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: DetailRow(
                    title: 'Type',
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

class MovieImagesGallery extends StatelessWidget {
  final MovieModel movie;

  const MovieImagesGallery({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie.images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: AppTextStyles.h4(color: AppColors.white)),
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

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.warning, size: 18),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodySmall(
                    weight: FontWeight.w500,
                    color: AppColors.white70,
                  ),
                ),
                Text(
                  value,
                  style: AppTextStyles.bodyNormal(
                    weight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '$title:',
            style: AppTextStyles.bodyNormal(
              weight: FontWeight.w500,
              color: AppColors.white70,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyNormal(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}

class FavoriteButton extends HookConsumerWidget {
  final MovieModel movie;

  const FavoriteButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerIsFav = ref.watch(
      movieListProvider.select(
        (state) => state.items
            .firstWhere((m) => m.id == movie.id, orElse: () => movie)
            .isFavorite,
      ),
    );

    final isFav = useState<bool>(movie.isFavorite);
    final isLoading = useState<bool>(false);

    useEffect(() {
      if (providerIsFav != isFav.value) {
        isFav.value = providerIsFav;
      }
      return null;
    }, [providerIsFav, movie.id]);

    return AppButton(
      onPressed: () async {
        if (isLoading.value) return;

        isFav.value = !isFav.value;
        isLoading.value = true;

        try {
          await ref
              .read(favoriteMovieNotifierProvider.notifier)
              .toggleFavorite(movie.id);
        } catch (e) {
          isFav.value = !isFav.value;
          if (context.mounted) {
            CustomOverlay.show(
              context,
              message: 'Favori güncellenemedi : ${e.toString()}',
              type: OverlayType.error,
            );
          }
        } finally {
          isLoading.value = false;
        }
      },
      backgroundColor: AppColors.transparent,
      borderColor: AppColors.white60,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
      borderRadius: 50,
      iconSize: 24,
      rightIcon: isFav.value ? AppIcons.heartFill : AppIcons.heart,
      iconColor: isFav.value ? AppColors.primary : AppColors.white,
    );
  }
}
