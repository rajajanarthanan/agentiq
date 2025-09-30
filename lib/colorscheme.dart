import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color appFontColor = Colors.white;

  // Primary brand colors
  static const Color primary = Color(0xFF00898A); // Teal Blue
  static const Color primaryDark = Color(0xFF08737F); // Ocean Blue
  static const Color accent = Color(0xFF089F8F); // Turquoise Green

  // Lime accent border / glow
  static const Color limeGlow = Color.fromARGB(
    255,
    141,
    255,
    2,
  ); // Border & accent highlight

  static const Color brandColor = Color(0xFF58B4FF);
  static const Color brandColorDark = Color(0xFF007CE4);
  static const Color brandShadowColor = Color.fromARGB(255, 240, 246, 252);
  static const Color agentiqBorderColor = Color.fromRGBO(13, 16, 27, 0.502);

  static const Color logoColorDark1 = Color(0xFF2C5060);
  static const Color logoColor2 = Color(0xFF215D6E);
  static const Color logoColor3 = Color(0xFF00898A);
  static const Color logoColor4 = Color(0xFF089F8F);
  static const Color logoColor5 = Color(0xFF59BFB4);
  static const Color logoLightColor6 = Color(0xFFC3D5D3);

  static const LinearGradient agentiqGradient = LinearGradient(
    colors: [
      logoColorDark1,
      logoColor2,
      logoColor3,
      logoColor4,
      logoColor5,
      logoLightColor6,
    ],
  );

  static const LinearGradient agentiqGradientReverse = LinearGradient(
    colors: [
      logoLightColor6,
      logoColor5,
      logoColor4,
      // logoColor3,
      Color.fromARGB(255, 2, 250, 229),
      // logoColor2,
      // logoColorDark1,
    ],
  );

  // Gradient.linear(from, to, colors);

  // Neutral & supporting (Light theme)
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color surface = Color(0xFFF5F5F5); // Light card surface
  static const Color border = Color(0xFFDDDDDD); // Light neutral border

  // Neutral & supporting (Dark theme)
  static const Color backgroundDark = Color(0xFF000000); // Full black
  static const Color surfaceDark = Color(0xFF121212); // Dark card surface

  // Text colors
  static const Color primaryText = Color(0xFF000000); // Jet Black
  static const Color headingText = Color(0xFF2C5060); // Deep Slate Blue
  static const Color bodyText = Color(0xFF215D6E); // Steel Blue
  static const Color bodyTextLight = Color(
    0xFF7A9DAF,
  ); // Muted variant for secondary info
  static const Color secondaryText = Color(
    0xFF666666,
  ); // Neutral supporting labels
  static const Color caption = Color(0xFF888888); // Small caption text
  static const Color buttonText = Color(
    0xFFFFFFFF,
  ); // Usually on lime/teal buttons
  static const Color codeText = Color(0xFFB0BEC5); // Monospaced/code labels

  // Gradient themes for cards, effects, transitions
  static const List<List<Color>> gradientPalette = [
    [Color(0xFF00C6FF), Color(0xFF0072FF)], // Blue ocean
    [Color(0xFF8E2DE2), Color(0xFF4A00E0)], // Deep violet
    [Color(0xFFFF512F), Color(0xFFDD2476)], // Cherry blush
    [Color(0xFF12C2E9), Color(0xFFC471ED)], // Aqua to lilac
    [Color(0xFFF7971E), Color(0xFFFFD200)], // Sunset gold
    [Color(0xFF0F2027), Color(0xFF203A43)], // Graphite blue
    [Color(0xFFB24592), Color(0xFFF15F79)], // Plum rosé
    [Color(0xFF00F260), Color(0xFF0575E6)], // Lime to blue neon
    [Color(0xFFE55D87), Color(0xFF5FC3E4)], // Pink sky
    [Color(0xFF6A82FB), Color(0xFFFC5C7D)], // Indigo-pink fusion
  ];

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Core brand
    primary: AppColors.primary, // Main color
    onPrimary: AppColors.buttonText, // Text/icon color on primary

    secondary: AppColors.accent, // Accent actions
    onSecondary: AppColors.buttonText,

    // Background & surfaces
    background: AppColors.backgroundDark,
    onBackground: AppColors.primaryText,

    surface: AppColors.surfaceDark,
    onSurface: AppColors.bodyText,

    // Error handling
    error: Color(0xFFCF6679),
    onError: AppColors.buttonText,

    // Tertiary color (optional enhancements or borders)
    tertiary: AppColors.limeGlow,
    onTertiary: AppColors.backgroundDark,
  );
}


// static const ColorScheme colorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: AppColors.primary,
//   onPrimary: AppColors.buttonText,
//   secondary: AppColors.accent,
//   onSecondary: AppColors.primaryText,
//   background: AppColors.background,
//   onBackground: AppColors.primaryText,
//   surface: AppColors.surface,
//   onSurface: AppColors.bodyText,
//   error: Color(0xFFB00020),
//   onError: Colors.white,
//   tertiary: AppColors.limeGlow,
//   onTertiary: AppColors.primaryText,
// );

