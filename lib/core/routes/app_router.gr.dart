// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart' as _i16;
import 'package:jr_case_boilerplate/features/auth/views/login_view.dart' as _i3;
import 'package:jr_case_boilerplate/features/auth/views/register_view.dart'
    as _i9;
import 'package:jr_case_boilerplate/features/full_screen_image/view/full_screen_image_view.dart'
    as _i1;
import 'package:jr_case_boilerplate/features/home/view/home_view.dart' as _i2;
import 'package:jr_case_boilerplate/features/main/main_view.dart' as _i4;
import 'package:jr_case_boilerplate/features/movie_detail/views/movie_detail_view.dart'
    as _i5;
import 'package:jr_case_boilerplate/features/no_connection/view/no_connection_view.dart'
    as _i6;
import 'package:jr_case_boilerplate/features/offer/view/offer_bottom_sheet_view.dart'
    as _i7;
import 'package:jr_case_boilerplate/features/profile/view/profile_view.dart'
    as _i8;
import 'package:jr_case_boilerplate/features/settings/view/settings_view.dart'
    as _i10;
import 'package:jr_case_boilerplate/features/splash/view/splash_view.dart'
    as _i11;
import 'package:jr_case_boilerplate/features/terms/view/terms_view.dart'
    as _i12;
import 'package:jr_case_boilerplate/features/upload_photo/view/upload_photo_view.dart'
    as _i13;

/// generated route for
/// [_i1.FullScreenImageView]
class FullScreenImageRoute
    extends _i14.PageRouteInfo<FullScreenImageRouteArgs> {
  FullScreenImageRoute({
    required String imageData,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         FullScreenImageRoute.name,
         args: FullScreenImageRouteArgs(imageData: imageData, key: key),
         rawPathParams: {'imageData': imageData},
         initialChildren: children,
       );

  static const String name = 'FullScreenImageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FullScreenImageRouteArgs>(
        orElse: () => FullScreenImageRouteArgs(
          imageData: pathParams.getString('imageData'),
        ),
      );
      return _i1.FullScreenImageView(imageData: args.imageData, key: args.key);
    },
  );
}

class FullScreenImageRouteArgs {
  const FullScreenImageRouteArgs({required this.imageData, this.key});

  final String imageData;

  final _i15.Key? key;

  @override
  String toString() {
    return 'FullScreenImageRouteArgs{imageData: $imageData, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FullScreenImageRouteArgs) return false;
    return imageData == other.imageData && key == other.key;
  }

  @override
  int get hashCode => imageData.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginView();
    },
  );
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainPage();
    },
  );
}

/// generated route for
/// [_i5.MovieDetailView]
class MovieDetailRoute extends _i14.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i15.Key? key,
    required _i16.MovieModel movie,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(key: key, movie: movie),
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i5.MovieDetailView(key: args.key, movie: args.movie);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, required this.movie});

  final _i15.Key? key;

  final _i16.MovieModel movie;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailRouteArgs) return false;
    return key == other.key && movie == other.movie;
  }

  @override
  int get hashCode => key.hashCode ^ movie.hashCode;
}

/// generated route for
/// [_i6.NoConnectionView]
class NoConnectionRoute extends _i14.PageRouteInfo<void> {
  const NoConnectionRoute({List<_i14.PageRouteInfo>? children})
    : super(NoConnectionRoute.name, initialChildren: children);

  static const String name = 'NoConnectionRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.NoConnectionView();
    },
  );
}

/// generated route for
/// [_i7.OfferBottomSheet]
class OfferBottomSheetRoute extends _i14.PageRouteInfo<void> {
  const OfferBottomSheetRoute({List<_i14.PageRouteInfo>? children})
    : super(OfferBottomSheetRoute.name, initialChildren: children);

  static const String name = 'OfferBottomSheetRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.OfferBottomSheet();
    },
  );
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileView();
    },
  );
}

/// generated route for
/// [_i9.RegisterView]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterView();
    },
  );
}

/// generated route for
/// [_i10.SettingsView]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute({List<_i14.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsView();
    },
  );
}

/// generated route for
/// [_i11.SplashView]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashView();
    },
  );
}

/// generated route for
/// [_i12.TermsView]
class TermsRoute extends _i14.PageRouteInfo<void> {
  const TermsRoute({List<_i14.PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.TermsView();
    },
  );
}

/// generated route for
/// [_i13.UploadPhotoView]
class UploadPhotoRoute extends _i14.PageRouteInfo<UploadPhotoRouteArgs> {
  UploadPhotoRoute({
    _i15.Key? key,
    String? initialPhotoUrl,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         UploadPhotoRoute.name,
         args: UploadPhotoRouteArgs(key: key, initialPhotoUrl: initialPhotoUrl),
         initialChildren: children,
       );

  static const String name = 'UploadPhotoRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UploadPhotoRouteArgs>(
        orElse: () => const UploadPhotoRouteArgs(),
      );
      return _i13.UploadPhotoView(
        key: args.key,
        initialPhotoUrl: args.initialPhotoUrl,
      );
    },
  );
}

class UploadPhotoRouteArgs {
  const UploadPhotoRouteArgs({this.key, this.initialPhotoUrl});

  final _i15.Key? key;

  final String? initialPhotoUrl;

  @override
  String toString() {
    return 'UploadPhotoRouteArgs{key: $key, initialPhotoUrl: $initialPhotoUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UploadPhotoRouteArgs) return false;
    return key == other.key && initialPhotoUrl == other.initialPhotoUrl;
  }

  @override
  int get hashCode => key.hashCode ^ initialPhotoUrl.hashCode;
}
