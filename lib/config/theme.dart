import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligth = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.grey.shade700
      ),
    ),
  );
}
