import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Heading — Bold only
  static TextStyle h1({Color? color}) =>
      _fontFamily(size: 48, weight: FontWeight.w700, color: color);
  static TextStyle h2({Color? color}) =>
      _fontFamily(size: 40, weight: FontWeight.w700, color: color);
  static TextStyle h3({Color? color}) =>
      _fontFamily(size: 32, weight: FontWeight.w700, color: color);
  static TextStyle h4({Color? color}) =>
      _fontFamily(size: 24, weight: FontWeight.w700, color: color);
  static TextStyle h5({Color? color}) =>
      _fontFamily(size: 20, weight: FontWeight.w700, color: color);
  static TextStyle h6({Color? color}) =>
      _fontFamily(size: 18, weight: FontWeight.w700, color: color);

  // Body sizes
  static TextStyle bodyXLarge({
    FontWeight weight = FontWeight.w400,
    bool italic = false,
    Color? color,
    double? height,
  }) => _fontFamily(
    size: 18,
    weight: weight,
    italic: italic,
    color: color,
    height: height,
  );

  static TextStyle bodyLarge({
    FontWeight weight = FontWeight.w400,
    bool italic = false,
    Color? color,
    double? height,
  }) => _fontFamily(
    size: 16,
    weight: weight,
    italic: italic,
    color: color,
    height: height,
  );

  static TextStyle bodyNormal({
    FontWeight weight = FontWeight.w400,
    bool italic = false,
    Color? color,
    double? height,
  }) => _fontFamily(
    size: 14,
    weight: weight,
    italic: italic,
    color: color,
    height: height,
  );

  static TextStyle bodySmall({
    FontWeight weight = FontWeight.w400,
    bool italic = false,
    Color? color,
    double? height,
  }) => _fontFamily(
    size: 12,
    weight: weight,
    italic: italic,
    color: color,
    height: height,
  );

  static TextStyle bodyXSmall({
    FontWeight weight = FontWeight.w400,
    bool italic = false,
    Color? color,
    double? height,
  }) => _fontFamily(
    size: 10,
    weight: weight,
    italic: italic,
    color: color,
    height: height,
  );

  static TextStyle _fontFamily({
    required double size,
    required FontWeight weight,
    bool italic = false,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.instrumentSans(
      fontSize: size,
      fontWeight: weight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color,
      height: height,
    );
  }
}
