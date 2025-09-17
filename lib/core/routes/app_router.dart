// ignore_for_file: unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/routes/app_routes.dart';
import 'package:jr_case_boilerplate/core/routes/bottom_sheet_route.dart';
import 'package:jr_case_boilerplate/core/routes/dialog_page_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
AppRouter router(final Ref ref) => AppRouter(ref);

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this._ref);
  final Ref _ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: AppRoutes.splash.path,
      initial: true,
      page: SplashRoute.page,
    ),
    AutoRoute(path: AppRoutes.login.path, page: LoginRoute.page),
    AutoRoute(path: AppRoutes.register.path, page: RegisterRoute.page),
    AutoRoute(path: AppRoutes.uploadPhoto.path, page: UploadPhotoRoute.page),
    AutoRoute(
      path: AppRoutes.main.path,
      page: MainRoute.page,
      children: [
        AutoRoute(path: AppRoutes.home.path, page: HomeRoute.page),
        AutoRoute(path: AppRoutes.profile.path, page: ProfileRoute.page),
      ],
    ),

    DialogPageRoute(path: AppRoutes.terms.path, page: TermsRoute.page),
    BottomSheetPageRoute(
      path: AppRoutes.offer.path,
      page: OfferBottomSheetRoute.page,
    ),
    BottomSheetPageRoute(
      path: AppRoutes.fullScreenImage.path,
      page: FullScreenImageRoute.page,
    ),
    AutoRoute(path: AppRoutes.movieDetail.path, page: MovieDetailRoute.page),
    AutoRoute(path: AppRoutes.settings.path, page: SettingsRoute.page),
    AutoRoute(path: AppRoutes.noConnection.path, page: NoConnectionRoute.page),
  ];
}
