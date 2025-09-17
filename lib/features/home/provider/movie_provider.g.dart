// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteMoviesHash() => r'a7cb907e18581e1e2029b657cb6c6d87ede6f052';

/// See also [favoriteMovies].
@ProviderFor(favoriteMovies)
final favoriteMoviesProvider =
    AutoDisposeFutureProvider<List<MovieModel>>.internal(
      favoriteMovies,
      name: r'favoriteMoviesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteMoviesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteMoviesRef = AutoDisposeFutureProviderRef<List<MovieModel>>;
String _$movieListHash() => r'0d8a6b1641396c64afee77b2623ef8c6e64de4c4';

/// See also [MovieList].
@ProviderFor(MovieList)
final movieListProvider =
    AutoDisposeNotifierProvider<MovieList, MovieListState>.internal(
      MovieList.new,
      name: r'movieListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$movieListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MovieList = AutoDisposeNotifier<MovieListState>;
String _$favoriteMovieNotifierHash() =>
    r'dec4d853916e8363a3b7f02dcd3aba23b56c9423';

/// See also [FavoriteMovieNotifier].
@ProviderFor(FavoriteMovieNotifier)
final favoriteMovieNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FavoriteMovieNotifier, void>.internal(
      FavoriteMovieNotifier.new,
      name: r'favoriteMovieNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteMovieNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteMovieNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
