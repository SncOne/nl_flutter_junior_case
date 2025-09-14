import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@freezed
abstract class MovieListModel with _$MovieListModel {
  const factory MovieListModel({
    @JsonKey(name: "response") required Response response,
    @JsonKey(name: "data") required List<MovieModel> data,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);
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

@freezed
abstract class Response with _$Response {
  const factory Response({
    @JsonKey(name: "code") required int code,
    @JsonKey(name: "message") required String message,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
