import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';
import 'package:jr_case_boilerplate/features/home/widgets/home_movie_list_item.dart';

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
        color: AppColors.primaryDark,
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
                  return HomeMovieListItem(
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
