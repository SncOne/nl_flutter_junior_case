import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';

class MovieListState {
  final List<MovieModel> items;
  final int currentPage;
  final bool isLoading;
  final bool hasNext;

  const MovieListState({
    this.items = const [],
    this.currentPage = 0,
    this.isLoading = false,
    this.hasNext = true,
  });

  MovieListState copyWith({
    List<MovieModel>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasNext,
  }) {
    return MovieListState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasNext: hasNext ?? this.hasNext,
    );
  }
}
