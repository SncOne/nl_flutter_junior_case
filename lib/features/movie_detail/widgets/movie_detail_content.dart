import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_details_section.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_images_gallery.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_plot_section.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_poster_card.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_quick_info.dart';
import 'package:jr_case_boilerplate/features/movie_detail/widgets/movie_title_section.dart';

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
