import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

class MovieDataConverter implements JsonConverter<MovieData, dynamic> {
  const MovieDataConverter();

  @override
  MovieData fromJson(dynamic json) {
    if (json == null) {
      return MovieData(movies: const [], pagination: null);
    }

    if (json is List) {
      final movies = json
          .map<MovieModel>(
            (e) => MovieModel.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
      return MovieData(movies: movies, pagination: null);
    }

    if (json is Map<String, dynamic>) {
      return MovieData.fromJson(json);
    }

    return MovieData(movies: const [], pagination: null);
  }

  @override
  dynamic toJson(MovieData object) => object.toJson();
}

@freezed
abstract class MovieListModel with _$MovieListModel {
  const factory MovieListModel({
    @JsonKey(name: "response") required Response response,
    @MovieDataConverter() @JsonKey(name: "data") required MovieData movieData,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);
}

@freezed
abstract class Response with _$Response {
  const factory Response({
    @JsonKey(name: "code") required int code,
    @JsonKey(name: "message") required String message,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
abstract class MovieData with _$MovieData {
  const factory MovieData({
    @JsonKey(name: "movies") required List<MovieModel> movies,
    @JsonKey(name: "pagination") Pagination? pagination,
  }) = _MovieData;

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);
}

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: "currentPage") required int currentPage,
    @JsonKey(name: "maxPage") required int lastPage,
    @JsonKey(name: "perPage") required int perPage,
    @JsonKey(name: "totalCount") required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "Title") required String title,
    @JsonKey(name: "Year") required String year,
    @JsonKey(name: "Rated") required String rated,
    @JsonKey(name: "Released") required String released,
    @JsonKey(name: "Runtime") required String runtime,
    @JsonKey(name: "Genre") required String genre,
    @JsonKey(name: "Director") required String director,
    @JsonKey(name: "Writer") required String writer,
    @JsonKey(name: "Actors") required String actors,
    @JsonKey(name: "Plot") required String plot,
    @JsonKey(name: "Language") required String language,
    @JsonKey(name: "Country") required String country,
    @JsonKey(name: "Awards") required String awards,
    @JsonKey(name: "Poster") required String poster,
    @JsonKey(name: "Metascore") required String metascore,
    @JsonKey(name: "imdbRating") required String imdbRating,
    @JsonKey(name: "imdbVotes") required String imdbVotes,
    @JsonKey(name: "imdbID") required String imdbId,
    @JsonKey(name: "Type") required String type,
    @JsonKey(name: "Response") required String response,
    @JsonKey(name: "Images") required List<String> images,
    @JsonKey(name: "ComingSoon") required bool comingSoon,
    @JsonKey(name: "isFavorite") required bool isFavorite,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
