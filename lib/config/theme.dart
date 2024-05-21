import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligth = ThemeData(
    colorScheme: ColorScheme(
      primary: Colors.indigo.shade400,
      background: Colors.grey.shade50,
      brightness: Brightness.light,
      error: Colors.red.shade600,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      secondary: Colors.indigo.shade400,
      surface: Colors.indigo.shade400,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white
      ),
      elevation: 2
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      elevation: 2,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) => !states.contains(MaterialState.selected)
            ? const IconThemeData(color: Colors.white)
            : null,
      ),
      labelTextStyle: const MaterialStatePropertyAll(
        TextStyle(color: Colors.white),
      ),
      indicatorColor: Colors.black54
    ),
  );
}
