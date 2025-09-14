enum AppRoutes {
  splash('/'),
  login('/login'),
  register('/register'),
  uploadPhoto('/upload-photo'),
  main('/main'),
  home('home'),
  profile('profile');

  const AppRoutes(this.path);
  final String path;
}
