import 'package:flutter/material.dart';
import 'package:auth/main.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();

  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(background: Colors.orange),
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 20, color: Colors.limeAccent),
          bodyLarge: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 16, 155, 88))));

  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.dark(background: Colors.blue),
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 20, color: Colors.limeAccent),
          bodyLarge: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontSize: 15, color: Colors.grey)));

  // void Changemode() {
  //   if (themeMode == ThemeMode.dark) {
  //     themeMode = ThemeMode.light;
  //   } else {
  //     themeMode = ThemeMode.dark;
  //   }
  // }
}
