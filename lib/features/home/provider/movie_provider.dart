import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_state_model.dart';
import 'package:jr_case_boilerplate/core/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieList extends _$MovieList {
  @override
  MovieListState build() {
    Future.microtask(() => fetchPage(1));
    return const MovieListState();
  }

  Future<void> fetchPage(int page) async {
    if (state.isLoading) return;

    if (page <= state.currentPage && state.currentPage != 0) return;
    if (!state.hasNext && state.currentPage != 0) return;

    state = state.copyWith(isLoading: true);

    try {
      final dio = ref.read(dioService);
      final response = await dio.get(
        'movie/list',
        queryParameters: {'page': page},
      );

      Print.info('Fetched page $page', tag: 'PagingDebug');
      Print.info('Fetched movies: ${response.data}', tag: 'PagingDebug');

      final movieList = MovieListModel.fromJson(response.data);
      final movies = movieList.movieData.movies;

      final isLastPage = movies.length < 5;

      final newItems = [...state.items, ...movies];

      state = state.copyWith(
        items: newItems,
        currentPage: page,
        hasNext: !isLastPage,
        isLoading: false,
      );
    } catch (e) {
      Print.info('Error fetching page $page: $e', tag: 'PagingDebug');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchNextIfNeeded(int index) async {
    if (state.isLoading || !state.hasNext) return;

    final pageOfIndex = (index ~/ 5) + 1;
    final positionInPage = index % 5;

    if (positionInPage == 3 && pageOfIndex == state.currentPage) {
      await fetchPage(pageOfIndex + 1);
    }
  }

  Future<void> refresh() async {
    state = const MovieListState();
    await fetchPage(1);
  }

  void toggleFavoriteLocally(String movieId) {
    final updatedItems =
        state.items.map((m) {
          if (m.id == movieId) {
            return m.copyWith(isFavorite: !m.isFavorite);
          }
          return m;
        }).toList();

    state = state.copyWith(items: updatedItems);
  }
}

@riverpod
Future<List<MovieModel>> favoriteMovies(Ref ref) async {
  final dio = ref.read(dioService);
  try {
    final response = await dio.get('movie/favorites');
    Print.info('Fetched favorite movies: ${response.data}', tag: 'Favorites');

    final movies = MovieListModel.fromJson(response.data);
    Print.info('Parsed favorite movies: $movies', tag: 'Favorites');
    return movies.movieData.movies;
  } catch (e, st) {
    Print.info('Error fetching favorite movies: $e\n$st', tag: 'Favorites');
    return [];
  }
}

@riverpod
class FavoriteMovieNotifier extends _$FavoriteMovieNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> toggleFavorite(String movieId) async {
    final dio = ref.read(dioService);
    try {
      final response = await dio.postRaw('movie/favorite/$movieId', data: {});
      if (response.data['response']['code'] != 200) {
        throw Exception(
          "Failed to toggle favorite: ${response.data['response']['message']}",
        );
      }
      ref.invalidate(favoriteMoviesProvider);

      ref.read(movieListProvider.notifier).toggleFavoriteLocally(movieId);
    } catch (e, st) {
      Print.info(
        'Error toggling favorite for $movieId: $e\n$st',
        tag: 'Favorites',
      );
      rethrow;
    }
  }
}
