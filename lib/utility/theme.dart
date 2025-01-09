import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData? getTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: const Color(0xff63AF23),
      secondaryHeaderColor: const Color(0xfff5f5f5),
      appBarTheme: AppBarTheme(color: Color(0xffb6f235)),
      scaffoldBackgroundColor: const Color(0xfdf7f7f8),
      colorScheme: const ColorScheme(
        primary: Color(0xff2aa332),
        secondary: Color(0xff00c4cc),
        brightness: Brightness.light,
        onPrimary: Color(0xff8b3dff),
        onSecondary: Color(0xfff2f4f7),
        error: Color(0xffdb1436),
        onError: Color(0xffff4757),
        surface: Color(0xffffffff),
        onSurface: Color(0xff100f0f),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.openSans(),
        titleSmall: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff000204)),
        titleMedium: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: const Color(0xff000204),
          textStyle: const TextStyle(overflow: TextOverflow.visible),
        ),
        titleLarge: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: const Color(0xff000204),
            textStyle: const TextStyle(overflow: TextOverflow.visible)),
      ),
    );
  }
}
