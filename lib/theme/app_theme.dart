import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.orbitronTextTheme(
      ThemeData.dark().textTheme,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.cyanAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
    ),
  );
}
