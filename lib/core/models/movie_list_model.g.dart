// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) =>
    _MovieListModel(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
      movieData: const MovieDataConverter().fromJson(json['data']),
    );

Map<String, dynamic> _$MovieListModelToJson(_MovieListModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': const MovieDataConverter().toJson(instance.movieData),
    };

_Response _$ResponseFromJson(Map<String, dynamic> json) => _Response(
  code: (json['code'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$ResponseToJson(_Response instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
};

_MovieData _$MovieDataFromJson(Map<String, dynamic> json) => _MovieData(
  movies: (json['movies'] as List<dynamic>)
      .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieDataToJson(_MovieData instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'pagination': instance.pagination,
    };

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  currentPage: (json['currentPage'] as num).toInt(),
  lastPage: (json['maxPage'] as num).toInt(),
  perPage: (json['perPage'] as num).toInt(),
  total: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'maxPage': instance.lastPage,
      'perPage': instance.perPage,
      'totalCount': instance.total,
    };

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  id: json['id'] as String,
  title: json['Title'] as String,
  year: json['Year'] as String,
  rated: json['Rated'] as String,
  released: json['Released'] as String,
  runtime: json['Runtime'] as String,
  genre: json['Genre'] as String,
  director: json['Director'] as String,
  writer: json['Writer'] as String,
  actors: json['Actors'] as String,
  plot: json['Plot'] as String,
  language: json['Language'] as String,
  country: json['Country'] as String,
  awards: json['Awards'] as String,
  poster: json['Poster'] as String,
  metascore: json['Metascore'] as String,
  imdbRating: json['imdbRating'] as String,
  imdbVotes: json['imdbVotes'] as String,
  imdbId: json['imdbID'] as String,
  type: json['Type'] as String,
  response: json['Response'] as String,
  images: (json['Images'] as List<dynamic>).map((e) => e as String).toList(),
  comingSoon: json['ComingSoon'] as bool,
  isFavorite: json['isFavorite'] as bool,
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'Poster': instance.poster,
      'Metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'Response': instance.response,
      'Images': instance.images,
      'ComingSoon': instance.comingSoon,
      'isFavorite': instance.isFavorite,
    };
