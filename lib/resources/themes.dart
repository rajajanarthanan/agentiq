import 'package:agentiq/resources/colorscheme.dart';
import 'package:agentiq/resources/text_styles.dart';
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

const double buttonMinSize = 50.0;

ElevatedButtonThemeData agentiqElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(buttonMinSize, buttonMinSize),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.buttonText,
    overlayColor: AppColors.brandShadowColor,
    elevation: 6,
    shadowColor: const Color.fromARGB(255, 51, 51, 51),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.white, width: 1.5),
    ),
    textStyle: AgentiqTextStyles.buttonText,
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

IconButtonThemeData agentiqIconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: AppColors.logoLightColor6,
    iconSize: 24,
    padding: const EdgeInsets.all(8),

    // highlightColor: AppColors.accent.withOpacity(0.1),
  ),
);

ThemeData agentiqMindsTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: AppColors.colorScheme,
  textTheme: AgentiqTextStyles.textTheme,
  elevatedButtonTheme: agentiqElevatedButtonTheme,
  inputDecorationTheme: agentiqInputDecorationTheme,
  iconButtonTheme: agentiqIconButtonTheme,
);
