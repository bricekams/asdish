import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligth = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.grey.shade700
      ),
    ),
    // navigationBarTheme: NavigationBarThemeData(
    //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //   elevation: 2,
    //   iconTheme: MaterialStateProperty.resolveWith(
    //     (states) => !states.contains(MaterialState.selected)
    //         ? const IconThemeData(color: Colors.white)
    //         : null,
    //   ),
    //   labelTextStyle: const MaterialStatePropertyAll(
    //     TextStyle(color: Colors.white),
    //   ),
    //   indicatorColor: Colors.black54
    // ),
  );
}
