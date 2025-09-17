// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieListModel {

@JsonKey(name: "response") Response get response;@MovieDataConverter()@JsonKey(name: "data") MovieData get movieData;
/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieListModelCopyWith<MovieListModel> get copyWith => _$MovieListModelCopyWithImpl<MovieListModel>(this as MovieListModel, _$identity);

  /// Serializes this MovieListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieListModel&&(identical(other.response, response) || other.response == response)&&(identical(other.movieData, movieData) || other.movieData == movieData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,movieData);

@override
String toString() {
  return 'MovieListModel(response: $response, movieData: $movieData)';
}


}

/// @nodoc
abstract mixin class $MovieListModelCopyWith<$Res>  {
  factory $MovieListModelCopyWith(MovieListModel value, $Res Function(MovieListModel) _then) = _$MovieListModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "response") Response response,@MovieDataConverter()@JsonKey(name: "data") MovieData movieData
});


$ResponseCopyWith<$Res> get response;$MovieDataCopyWith<$Res> get movieData;

}
/// @nodoc
class _$MovieListModelCopyWithImpl<$Res>
    implements $MovieListModelCopyWith<$Res> {
  _$MovieListModelCopyWithImpl(this._self, this._then);

  final MovieListModel _self;
  final $Res Function(MovieListModel) _then;

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,Object? movieData = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response,movieData: null == movieData ? _self.movieData : movieData // ignore: cast_nullable_to_non_nullable
as MovieData,
  ));
}
/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res> get response {
  
  return $ResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDataCopyWith<$Res> get movieData {
  
  return $MovieDataCopyWith<$Res>(_self.movieData, (value) {
    return _then(_self.copyWith(movieData: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieListModel].
extension MovieListModelPatterns on MovieListModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieListModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieListModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieListModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "response")  Response response, @MovieDataConverter()@JsonKey(name: "data")  MovieData movieData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that.response,_that.movieData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "response")  Response response, @MovieDataConverter()@JsonKey(name: "data")  MovieData movieData)  $default,) {final _that = this;
switch (_that) {
case _MovieListModel():
return $default(_that.response,_that.movieData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "response")  Response response, @MovieDataConverter()@JsonKey(name: "data")  MovieData movieData)?  $default,) {final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that.response,_that.movieData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieListModel implements MovieListModel {
  const _MovieListModel({@JsonKey(name: "response") required this.response, @MovieDataConverter()@JsonKey(name: "data") required this.movieData});
  factory _MovieListModel.fromJson(Map<String, dynamic> json) => _$MovieListModelFromJson(json);

@override@JsonKey(name: "response") final  Response response;
@override@MovieDataConverter()@JsonKey(name: "data") final  MovieData movieData;

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieListModelCopyWith<_MovieListModel> get copyWith => __$MovieListModelCopyWithImpl<_MovieListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieListModel&&(identical(other.response, response) || other.response == response)&&(identical(other.movieData, movieData) || other.movieData == movieData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,movieData);

@override
String toString() {
  return 'MovieListModel(response: $response, movieData: $movieData)';
}


}

/// @nodoc
abstract mixin class _$MovieListModelCopyWith<$Res> implements $MovieListModelCopyWith<$Res> {
  factory _$MovieListModelCopyWith(_MovieListModel value, $Res Function(_MovieListModel) _then) = __$MovieListModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "response") Response response,@MovieDataConverter()@JsonKey(name: "data") MovieData movieData
});


@override $ResponseCopyWith<$Res> get response;@override $MovieDataCopyWith<$Res> get movieData;

}
/// @nodoc
class __$MovieListModelCopyWithImpl<$Res>
    implements _$MovieListModelCopyWith<$Res> {
  __$MovieListModelCopyWithImpl(this._self, this._then);

  final _MovieListModel _self;
  final $Res Function(_MovieListModel) _then;

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,Object? movieData = null,}) {
  return _then(_MovieListModel(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response,movieData: null == movieData ? _self.movieData : movieData // ignore: cast_nullable_to_non_nullable
as MovieData,
  ));
}

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res> get response {
  
  return $ResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDataCopyWith<$Res> get movieData {
  
  return $MovieDataCopyWith<$Res>(_self.movieData, (value) {
    return _then(_self.copyWith(movieData: value));
  });
}
}


/// @nodoc
mixin _$Response {

@JsonKey(name: "code") int get code;@JsonKey(name: "message") String get message;
/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseCopyWith<Response> get copyWith => _$ResponseCopyWithImpl<Response>(this as Response, _$identity);

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Response&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'Response(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ResponseCopyWith<$Res>  {
  factory $ResponseCopyWith(Response value, $Res Function(Response) _then) = _$ResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "code") int code,@JsonKey(name: "message") String message
});




}
/// @nodoc
class _$ResponseCopyWithImpl<$Res>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._self, this._then);

  final Response _self;
  final $Res Function(Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Response].
extension ResponsePatterns on Response {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Response value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Response value)  $default,){
final _that = this;
switch (_that) {
case _Response():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Response value)?  $default,){
final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int code, @JsonKey(name: "message")  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that.code,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int code, @JsonKey(name: "message")  String message)  $default,) {final _that = this;
switch (_that) {
case _Response():
return $default(_that.code,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "code")  int code, @JsonKey(name: "message")  String message)?  $default,) {final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Response implements Response {
  const _Response({@JsonKey(name: "code") required this.code, @JsonKey(name: "message") required this.message});
  factory _Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

@override@JsonKey(name: "code") final  int code;
@override@JsonKey(name: "message") final  String message;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseCopyWith<_Response> get copyWith => __$ResponseCopyWithImpl<_Response>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Response&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'Response(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) _then) = __$ResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "code") int code,@JsonKey(name: "message") String message
});




}
/// @nodoc
class __$ResponseCopyWithImpl<$Res>
    implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(this._self, this._then);

  final _Response _self;
  final $Res Function(_Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_Response(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MovieData {

@JsonKey(name: "movies") List<MovieModel> get movies;@JsonKey(name: "pagination") Pagination? get pagination;
/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDataCopyWith<MovieData> get copyWith => _$MovieDataCopyWithImpl<MovieData>(this as MovieData, _$identity);

  /// Serializes this MovieData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieData&&const DeepCollectionEquality().equals(other.movies, movies)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(movies),pagination);

@override
String toString() {
  return 'MovieData(movies: $movies, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $MovieDataCopyWith<$Res>  {
  factory $MovieDataCopyWith(MovieData value, $Res Function(MovieData) _then) = _$MovieDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "movies") List<MovieModel> movies,@JsonKey(name: "pagination") Pagination? pagination
});


$PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$MovieDataCopyWithImpl<$Res>
    implements $MovieDataCopyWith<$Res> {
  _$MovieDataCopyWithImpl(this._self, this._then);

  final MovieData _self;
  final $Res Function(MovieData) _then;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movies = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}
/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieData].
extension MovieDataPatterns on MovieData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieData value)  $default,){
final _that = this;
switch (_that) {
case _MovieData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieData value)?  $default,){
final _that = this;
switch (_that) {
case _MovieData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "movies")  List<MovieModel> movies, @JsonKey(name: "pagination")  Pagination? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieData() when $default != null:
return $default(_that.movies,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "movies")  List<MovieModel> movies, @JsonKey(name: "pagination")  Pagination? pagination)  $default,) {final _that = this;
switch (_that) {
case _MovieData():
return $default(_that.movies,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "movies")  List<MovieModel> movies, @JsonKey(name: "pagination")  Pagination? pagination)?  $default,) {final _that = this;
switch (_that) {
case _MovieData() when $default != null:
return $default(_that.movies,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieData implements MovieData {
  const _MovieData({@JsonKey(name: "movies") required final  List<MovieModel> movies, @JsonKey(name: "pagination") this.pagination}): _movies = movies;
  factory _MovieData.fromJson(Map<String, dynamic> json) => _$MovieDataFromJson(json);

 final  List<MovieModel> _movies;
@override@JsonKey(name: "movies") List<MovieModel> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

@override@JsonKey(name: "pagination") final  Pagination? pagination;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDataCopyWith<_MovieData> get copyWith => __$MovieDataCopyWithImpl<_MovieData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieData&&const DeepCollectionEquality().equals(other._movies, _movies)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_movies),pagination);

@override
String toString() {
  return 'MovieData(movies: $movies, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$MovieDataCopyWith<$Res> implements $MovieDataCopyWith<$Res> {
  factory _$MovieDataCopyWith(_MovieData value, $Res Function(_MovieData) _then) = __$MovieDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "movies") List<MovieModel> movies,@JsonKey(name: "pagination") Pagination? pagination
});


@override $PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$MovieDataCopyWithImpl<$Res>
    implements _$MovieDataCopyWith<$Res> {
  __$MovieDataCopyWithImpl(this._self, this._then);

  final _MovieData _self;
  final $Res Function(_MovieData) _then;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movies = null,Object? pagination = freezed,}) {
  return _then(_MovieData(
movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<MovieModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$Pagination {

@JsonKey(name: "currentPage") int get currentPage;@JsonKey(name: "maxPage") int get lastPage;@JsonKey(name: "perPage") int get perPage;@JsonKey(name: "totalCount") int get total;
/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationCopyWith<Pagination> get copyWith => _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,lastPage,perPage,total);

@override
String toString() {
  return 'Pagination(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res>  {
  factory $PaginationCopyWith(Pagination value, $Res Function(Pagination) _then) = _$PaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "currentPage") int currentPage,@JsonKey(name: "maxPage") int lastPage,@JsonKey(name: "perPage") int perPage,@JsonKey(name: "totalCount") int total
});




}
/// @nodoc
class _$PaginationCopyWithImpl<$Res>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Pagination].
extension PaginationPatterns on Pagination {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pagination value)  $default,){
final _that = this;
switch (_that) {
case _Pagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pagination value)?  $default,){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "currentPage")  int currentPage, @JsonKey(name: "maxPage")  int lastPage, @JsonKey(name: "perPage")  int perPage, @JsonKey(name: "totalCount")  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "currentPage")  int currentPage, @JsonKey(name: "maxPage")  int lastPage, @JsonKey(name: "perPage")  int perPage, @JsonKey(name: "totalCount")  int total)  $default,) {final _that = this;
switch (_that) {
case _Pagination():
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "currentPage")  int currentPage, @JsonKey(name: "maxPage")  int lastPage, @JsonKey(name: "perPage")  int perPage, @JsonKey(name: "totalCount")  int total)?  $default,) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pagination implements Pagination {
  const _Pagination({@JsonKey(name: "currentPage") required this.currentPage, @JsonKey(name: "maxPage") required this.lastPage, @JsonKey(name: "perPage") required this.perPage, @JsonKey(name: "totalCount") required this.total});
  factory _Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

@override@JsonKey(name: "currentPage") final  int currentPage;
@override@JsonKey(name: "maxPage") final  int lastPage;
@override@JsonKey(name: "perPage") final  int perPage;
@override@JsonKey(name: "totalCount") final  int total;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationCopyWith<_Pagination> get copyWith => __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,lastPage,perPage,total);

@override
String toString() {
  return 'Pagination(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res> implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(_Pagination value, $Res Function(_Pagination) _then) = __$PaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "currentPage") int currentPage,@JsonKey(name: "maxPage") int lastPage,@JsonKey(name: "perPage") int perPage,@JsonKey(name: "totalCount") int total
});




}
/// @nodoc
class __$PaginationCopyWithImpl<$Res>
    implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_Pagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MovieModel {

@JsonKey(name: "id") String get id;@JsonKey(name: "Title") String get title;@JsonKey(name: "Year") String get year;@JsonKey(name: "Rated") String get rated;@JsonKey(name: "Released") String get released;@JsonKey(name: "Runtime") String get runtime;@JsonKey(name: "Genre") String get genre;@JsonKey(name: "Director") String get director;@JsonKey(name: "Writer") String get writer;@JsonKey(name: "Actors") String get actors;@JsonKey(name: "Plot") String get plot;@JsonKey(name: "Language") String get language;@JsonKey(name: "Country") String get country;@JsonKey(name: "Awards") String get awards;@JsonKey(name: "Poster") String get poster;@JsonKey(name: "Metascore") String get metascore;@JsonKey(name: "imdbRating") String get imdbRating;@JsonKey(name: "imdbVotes") String get imdbVotes;@JsonKey(name: "imdbID") String get imdbId;@JsonKey(name: "Type") String get type;@JsonKey(name: "Response") String get response;@JsonKey(name: "Images") List<String> get images;@JsonKey(name: "ComingSoon") bool get comingSoon;@JsonKey(name: "isFavorite") bool get isFavorite;
/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieModelCopyWith<MovieModel> get copyWith => _$MovieModelCopyWithImpl<MovieModel>(this as MovieModel, _$identity);

  /// Serializes this MovieModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.rated, rated) || other.rated == rated)&&(identical(other.released, released) || other.released == released)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.director, director) || other.director == director)&&(identical(other.writer, writer) || other.writer == writer)&&(identical(other.actors, actors) || other.actors == actors)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.awards, awards) || other.awards == awards)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.metascore, metascore) || other.metascore == metascore)&&(identical(other.imdbRating, imdbRating) || other.imdbRating == imdbRating)&&(identical(other.imdbVotes, imdbVotes) || other.imdbVotes == imdbVotes)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.type, type) || other.type == type)&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.comingSoon, comingSoon) || other.comingSoon == comingSoon)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,year,rated,released,runtime,genre,director,writer,actors,plot,language,country,awards,poster,metascore,imdbRating,imdbVotes,imdbId,type,response,const DeepCollectionEquality().hash(images),comingSoon,isFavorite]);

@override
String toString() {
  return 'MovieModel(id: $id, title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metascore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, response: $response, images: $images, comingSoon: $comingSoon, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $MovieModelCopyWith<$Res>  {
  factory $MovieModelCopyWith(MovieModel value, $Res Function(MovieModel) _then) = _$MovieModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "Title") String title,@JsonKey(name: "Year") String year,@JsonKey(name: "Rated") String rated,@JsonKey(name: "Released") String released,@JsonKey(name: "Runtime") String runtime,@JsonKey(name: "Genre") String genre,@JsonKey(name: "Director") String director,@JsonKey(name: "Writer") String writer,@JsonKey(name: "Actors") String actors,@JsonKey(name: "Plot") String plot,@JsonKey(name: "Language") String language,@JsonKey(name: "Country") String country,@JsonKey(name: "Awards") String awards,@JsonKey(name: "Poster") String poster,@JsonKey(name: "Metascore") String metascore,@JsonKey(name: "imdbRating") String imdbRating,@JsonKey(name: "imdbVotes") String imdbVotes,@JsonKey(name: "imdbID") String imdbId,@JsonKey(name: "Type") String type,@JsonKey(name: "Response") String response,@JsonKey(name: "Images") List<String> images,@JsonKey(name: "ComingSoon") bool comingSoon,@JsonKey(name: "isFavorite") bool isFavorite
});




}
/// @nodoc
class _$MovieModelCopyWithImpl<$Res>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._self, this._then);

  final MovieModel _self;
  final $Res Function(MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? year = null,Object? rated = null,Object? released = null,Object? runtime = null,Object? genre = null,Object? director = null,Object? writer = null,Object? actors = null,Object? plot = null,Object? language = null,Object? country = null,Object? awards = null,Object? poster = null,Object? metascore = null,Object? imdbRating = null,Object? imdbVotes = null,Object? imdbId = null,Object? type = null,Object? response = null,Object? images = null,Object? comingSoon = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as String,released: null == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as String,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,director: null == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String,writer: null == writer ? _self.writer : writer // ignore: cast_nullable_to_non_nullable
as String,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as String,plot: null == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,awards: null == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,metascore: null == metascore ? _self.metascore : metascore // ignore: cast_nullable_to_non_nullable
as String,imdbRating: null == imdbRating ? _self.imdbRating : imdbRating // ignore: cast_nullable_to_non_nullable
as String,imdbVotes: null == imdbVotes ? _self.imdbVotes : imdbVotes // ignore: cast_nullable_to_non_nullable
as String,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,comingSoon: null == comingSoon ? _self.comingSoon : comingSoon // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieModel].
extension MovieModelPatterns on MovieModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "Title")  String title, @JsonKey(name: "Year")  String year, @JsonKey(name: "Rated")  String rated, @JsonKey(name: "Released")  String released, @JsonKey(name: "Runtime")  String runtime, @JsonKey(name: "Genre")  String genre, @JsonKey(name: "Director")  String director, @JsonKey(name: "Writer")  String writer, @JsonKey(name: "Actors")  String actors, @JsonKey(name: "Plot")  String plot, @JsonKey(name: "Language")  String language, @JsonKey(name: "Country")  String country, @JsonKey(name: "Awards")  String awards, @JsonKey(name: "Poster")  String poster, @JsonKey(name: "Metascore")  String metascore, @JsonKey(name: "imdbRating")  String imdbRating, @JsonKey(name: "imdbVotes")  String imdbVotes, @JsonKey(name: "imdbID")  String imdbId, @JsonKey(name: "Type")  String type, @JsonKey(name: "Response")  String response, @JsonKey(name: "Images")  List<String> images, @JsonKey(name: "ComingSoon")  bool comingSoon, @JsonKey(name: "isFavorite")  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.response,_that.images,_that.comingSoon,_that.isFavorite);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "Title")  String title, @JsonKey(name: "Year")  String year, @JsonKey(name: "Rated")  String rated, @JsonKey(name: "Released")  String released, @JsonKey(name: "Runtime")  String runtime, @JsonKey(name: "Genre")  String genre, @JsonKey(name: "Director")  String director, @JsonKey(name: "Writer")  String writer, @JsonKey(name: "Actors")  String actors, @JsonKey(name: "Plot")  String plot, @JsonKey(name: "Language")  String language, @JsonKey(name: "Country")  String country, @JsonKey(name: "Awards")  String awards, @JsonKey(name: "Poster")  String poster, @JsonKey(name: "Metascore")  String metascore, @JsonKey(name: "imdbRating")  String imdbRating, @JsonKey(name: "imdbVotes")  String imdbVotes, @JsonKey(name: "imdbID")  String imdbId, @JsonKey(name: "Type")  String type, @JsonKey(name: "Response")  String response, @JsonKey(name: "Images")  List<String> images, @JsonKey(name: "ComingSoon")  bool comingSoon, @JsonKey(name: "isFavorite")  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _MovieModel():
return $default(_that.id,_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.response,_that.images,_that.comingSoon,_that.isFavorite);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "Title")  String title, @JsonKey(name: "Year")  String year, @JsonKey(name: "Rated")  String rated, @JsonKey(name: "Released")  String released, @JsonKey(name: "Runtime")  String runtime, @JsonKey(name: "Genre")  String genre, @JsonKey(name: "Director")  String director, @JsonKey(name: "Writer")  String writer, @JsonKey(name: "Actors")  String actors, @JsonKey(name: "Plot")  String plot, @JsonKey(name: "Language")  String language, @JsonKey(name: "Country")  String country, @JsonKey(name: "Awards")  String awards, @JsonKey(name: "Poster")  String poster, @JsonKey(name: "Metascore")  String metascore, @JsonKey(name: "imdbRating")  String imdbRating, @JsonKey(name: "imdbVotes")  String imdbVotes, @JsonKey(name: "imdbID")  String imdbId, @JsonKey(name: "Type")  String type, @JsonKey(name: "Response")  String response, @JsonKey(name: "Images")  List<String> images, @JsonKey(name: "ComingSoon")  bool comingSoon, @JsonKey(name: "isFavorite")  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.id,_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.response,_that.images,_that.comingSoon,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieModel implements MovieModel {
  const _MovieModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "Title") required this.title, @JsonKey(name: "Year") required this.year, @JsonKey(name: "Rated") required this.rated, @JsonKey(name: "Released") required this.released, @JsonKey(name: "Runtime") required this.runtime, @JsonKey(name: "Genre") required this.genre, @JsonKey(name: "Director") required this.director, @JsonKey(name: "Writer") required this.writer, @JsonKey(name: "Actors") required this.actors, @JsonKey(name: "Plot") required this.plot, @JsonKey(name: "Language") required this.language, @JsonKey(name: "Country") required this.country, @JsonKey(name: "Awards") required this.awards, @JsonKey(name: "Poster") required this.poster, @JsonKey(name: "Metascore") required this.metascore, @JsonKey(name: "imdbRating") required this.imdbRating, @JsonKey(name: "imdbVotes") required this.imdbVotes, @JsonKey(name: "imdbID") required this.imdbId, @JsonKey(name: "Type") required this.type, @JsonKey(name: "Response") required this.response, @JsonKey(name: "Images") required final  List<String> images, @JsonKey(name: "ComingSoon") required this.comingSoon, @JsonKey(name: "isFavorite") required this.isFavorite}): _images = images;
  factory _MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "Title") final  String title;
@override@JsonKey(name: "Year") final  String year;
@override@JsonKey(name: "Rated") final  String rated;
@override@JsonKey(name: "Released") final  String released;
@override@JsonKey(name: "Runtime") final  String runtime;
@override@JsonKey(name: "Genre") final  String genre;
@override@JsonKey(name: "Director") final  String director;
@override@JsonKey(name: "Writer") final  String writer;
@override@JsonKey(name: "Actors") final  String actors;
@override@JsonKey(name: "Plot") final  String plot;
@override@JsonKey(name: "Language") final  String language;
@override@JsonKey(name: "Country") final  String country;
@override@JsonKey(name: "Awards") final  String awards;
@override@JsonKey(name: "Poster") final  String poster;
@override@JsonKey(name: "Metascore") final  String metascore;
@override@JsonKey(name: "imdbRating") final  String imdbRating;
@override@JsonKey(name: "imdbVotes") final  String imdbVotes;
@override@JsonKey(name: "imdbID") final  String imdbId;
@override@JsonKey(name: "Type") final  String type;
@override@JsonKey(name: "Response") final  String response;
 final  List<String> _images;
@override@JsonKey(name: "Images") List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(name: "ComingSoon") final  bool comingSoon;
@override@JsonKey(name: "isFavorite") final  bool isFavorite;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieModelCopyWith<_MovieModel> get copyWith => __$MovieModelCopyWithImpl<_MovieModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.rated, rated) || other.rated == rated)&&(identical(other.released, released) || other.released == released)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.director, director) || other.director == director)&&(identical(other.writer, writer) || other.writer == writer)&&(identical(other.actors, actors) || other.actors == actors)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.awards, awards) || other.awards == awards)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.metascore, metascore) || other.metascore == metascore)&&(identical(other.imdbRating, imdbRating) || other.imdbRating == imdbRating)&&(identical(other.imdbVotes, imdbVotes) || other.imdbVotes == imdbVotes)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.type, type) || other.type == type)&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.comingSoon, comingSoon) || other.comingSoon == comingSoon)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,year,rated,released,runtime,genre,director,writer,actors,plot,language,country,awards,poster,metascore,imdbRating,imdbVotes,imdbId,type,response,const DeepCollectionEquality().hash(_images),comingSoon,isFavorite]);

@override
String toString() {
  return 'MovieModel(id: $id, title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metascore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, response: $response, images: $images, comingSoon: $comingSoon, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$MovieModelCopyWith<$Res> implements $MovieModelCopyWith<$Res> {
  factory _$MovieModelCopyWith(_MovieModel value, $Res Function(_MovieModel) _then) = __$MovieModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "Title") String title,@JsonKey(name: "Year") String year,@JsonKey(name: "Rated") String rated,@JsonKey(name: "Released") String released,@JsonKey(name: "Runtime") String runtime,@JsonKey(name: "Genre") String genre,@JsonKey(name: "Director") String director,@JsonKey(name: "Writer") String writer,@JsonKey(name: "Actors") String actors,@JsonKey(name: "Plot") String plot,@JsonKey(name: "Language") String language,@JsonKey(name: "Country") String country,@JsonKey(name: "Awards") String awards,@JsonKey(name: "Poster") String poster,@JsonKey(name: "Metascore") String metascore,@JsonKey(name: "imdbRating") String imdbRating,@JsonKey(name: "imdbVotes") String imdbVotes,@JsonKey(name: "imdbID") String imdbId,@JsonKey(name: "Type") String type,@JsonKey(name: "Response") String response,@JsonKey(name: "Images") List<String> images,@JsonKey(name: "ComingSoon") bool comingSoon,@JsonKey(name: "isFavorite") bool isFavorite
});




}
/// @nodoc
class __$MovieModelCopyWithImpl<$Res>
    implements _$MovieModelCopyWith<$Res> {
  __$MovieModelCopyWithImpl(this._self, this._then);

  final _MovieModel _self;
  final $Res Function(_MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? year = null,Object? rated = null,Object? released = null,Object? runtime = null,Object? genre = null,Object? director = null,Object? writer = null,Object? actors = null,Object? plot = null,Object? language = null,Object? country = null,Object? awards = null,Object? poster = null,Object? metascore = null,Object? imdbRating = null,Object? imdbVotes = null,Object? imdbId = null,Object? type = null,Object? response = null,Object? images = null,Object? comingSoon = null,Object? isFavorite = null,}) {
  return _then(_MovieModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as String,released: null == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as String,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,director: null == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String,writer: null == writer ? _self.writer : writer // ignore: cast_nullable_to_non_nullable
as String,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as String,plot: null == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,awards: null == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,metascore: null == metascore ? _self.metascore : metascore // ignore: cast_nullable_to_non_nullable
as String,imdbRating: null == imdbRating ? _self.imdbRating : imdbRating // ignore: cast_nullable_to_non_nullable
as String,imdbVotes: null == imdbVotes ? _self.imdbVotes : imdbVotes // ignore: cast_nullable_to_non_nullable
as String,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,comingSoon: null == comingSoon ? _self.comingSoon : comingSoon // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
