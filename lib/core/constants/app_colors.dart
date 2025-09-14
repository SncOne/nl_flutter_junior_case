import 'dart:ui';

class AppColors {
  //Brand
  static const Color primary = Color(0xFFE50914);
  static const Color primaryDark = Color(0xFF6F060B);
  static const Color secondary = Color(0xFF5949E6);

  //White Tones
  static const Color white90 = Color.fromRGBO(255, 255, 255, 0.90);
  static const Color white80 = Color.fromRGBO(255, 255, 255, 0.80);
  static const Color white70 = Color.fromRGBO(255, 255, 255, 0.70);
  static const Color white60 = Color.fromRGBO(255, 255, 255, 0.60);
  static const Color white50 = Color.fromRGBO(255, 255, 255, 0.50);
  static const Color white40 = Color.fromRGBO(255, 255, 255, 0.40);
  static const Color white30 = Color.fromRGBO(255, 255, 255, 0.30);
  static const Color white20 = Color.fromRGBO(255, 255, 255, 0.20);
  static const Color white10 = Color.fromRGBO(255, 255, 255, 0.10);
  static const Color white5 = Color.fromRGBO(255, 255, 255, 0.05);

  //Alert & Status Colors
  static const Color success = Color(0xFF00C247);
  static const Color info = Color(0xFF004CE8);
  static const Color warning = Color(0xFFFFBE16);
  static const Color error = Color(0xFFF47171);

  //Others
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  //Gradients
  static const List<Color> bgGradient = [Color(0xFF3F0306), Color(0xFF090909)];
  static const List<Color> popularCardGradient = [
    AppColors.secondary,
    AppColors.primary,
  ];
  static const List<Color> normalCardGradient = [
    AppColors.primaryDark,
    AppColors.primary,
  ];
  static const List<Color> activeNavGradient = [
    AppColors.primary,
    AppColors.primaryDark,
  ];
}
