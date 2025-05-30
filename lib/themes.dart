import 'package:flutter/material.dart';

ThemeData agentiqLightTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
).copyWith(
  inputDecorationTheme: agentiqInputDecorationTheme,
  elevatedButtonTheme: agentiqElevatedButtonTheme,
);

ThemeData agentiqDarkTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
).copyWith(
  inputDecorationTheme: agentiqInputDecorationTheme,
  elevatedButtonTheme: agentiqElevatedButtonTheme,
);

const buttonMinSize = 50.0;
ElevatedButtonThemeData agentiqElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(buttonMinSize, buttonMinSize),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

InputDecorationTheme agentiqInputDecorationTheme = InputDecorationTheme(
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
  ),
);
