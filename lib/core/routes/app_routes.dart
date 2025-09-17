enum AppRoutes {
  splash('/'),
  login('/login'),
  register('/register'),
  terms('/terms'),
  uploadPhoto('/upload-photo'),
  main('/main'),
  noConnection('/no-connection'),
  home('home'),
  profile('profile'),
  offer('/offer'),
  fullScreenImage('/full-screen-image/:imageData'),
  movieDetail('/movie-detail/:movie'),
  settings('/settings');

  const AppRoutes(this.path);
  final String path;
}
