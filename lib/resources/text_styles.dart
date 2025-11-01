import 'package:agentiq/resources/colorscheme.dart';
import 'package:flutter/material.dart';

class AgentiqTextStyles {
  /// Large titles for screens, onboarding, hero banners
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'PTSerif',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.appFontColor,
    // fontSize: 18,
    // fontWeight: FontWeight.bold,
    // fontFamily: 'PTSerif', //'Inter',
    // fontWeight: FontWeight.w700,
    letterSpacing: 24.0,

    // foreground:
    //     Paint()
    //       ..shader = AppColors.agentiqGradient.createShader(
    //         Rect.fromLTWH(0, 0, 300, 0),
    //       ),
  );

  /// Headings used for important sections
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Secondary headings or sub-sections
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Titles for cards, modals, and components
  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Smaller titles, overlines
  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Main body text – paragraphs, content
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Secondary body – subtle info, side content
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Captions – form hints, image credits
  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Button text – calls to action
  static const TextStyle buttonText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    letterSpacing: 1.25,
    fontFamily: 'Inter',
    color: AppColors.appFontColor,
  );

  /// Monospaced – code snippets, tokens
  static const TextStyle codeText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontFamily: 'RobotoMono',
    color: AppColors.appFontColor,
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: AgentiqTextStyles.displayLarge,
    headlineLarge: AgentiqTextStyles.headlineLarge,
    headlineMedium: AgentiqTextStyles.headlineMedium,
    titleLarge: AgentiqTextStyles.titleLarge,
    titleSmall: AgentiqTextStyles.titleSmall,
    bodyLarge: AgentiqTextStyles.bodyLarge,
    bodyMedium: AgentiqTextStyles.bodyMedium,
    labelSmall: AgentiqTextStyles.labelSmall,
  );
}


/*

  TextStyle? displayMedium,
  TextStyle? displaySmall,

  TextStyle? headlineSmall,

  
  TextStyle? titleMedium,
  
  
  TextStyle? bodySmall,
  TextStyle? labelLarge,
  TextStyle? labelMedium,
  

*/