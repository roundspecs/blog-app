import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData themeData = ThemeData().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
