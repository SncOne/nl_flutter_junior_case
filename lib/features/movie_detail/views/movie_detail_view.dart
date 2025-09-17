import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/favorite_button.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_detail_appbar.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_detail_content.dart';

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
