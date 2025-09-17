import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';
import 'package:jr_case_boilerplate/features/movie_detail/views/movie_detail_view.dart';

@RoutePage(name: 'HomeRoute')
class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(movieListProvider);
    final movieNotifier = ref.read(movieListProvider.notifier);

    final pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: movieNotifier.refresh,
        color: Colors.red,
        child: movieState.items.isEmpty && movieState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: movieState.items.length,
                onPageChanged: (index) async {
                  await movieNotifier.fetchNextIfNeeded(index);
                },
                itemBuilder: (context, index) {
                  final movie = movieState.items[index];
                  return _FullScreenMovieItem(
                    movie: movie,
                    onTap: () {
                      context.router.push(MovieDetailRoute(movie: movie));
                    },
                  );
                },
              ),
      ),
    );
  }
}

class _FullScreenMovieItem extends ConsumerWidget {
  final MovieModel movie;
  final VoidCallback onTap;

  const _FullScreenMovieItem({required this.movie, required this.onTap});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: FavoriteButton(movie: movie),
                  ),
                  Text(
                    movie.title,
                    style: GoogleFonts.urbanist(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    movie.plot,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
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
