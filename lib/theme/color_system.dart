import 'package:flutter/material.dart';

// Figma Design System - Primary Blue from Tonal Palettes
const Color _primarySeedColor = Color(0xFF3F6FEC); // Primary 50 from Figma

// Custom color extensions from Figma design system
class FigmaColors {
  // Primary palette from Figma
  static const Color primary0 = Color(0xFF000D35);
  static const Color primary10 = Color(0xFF00174C);
  static const Color primary20 = Color(0xFF002979);
  static const Color primary30 = Color(0xFF003DA9);
  static const Color primary40 = Color(0xFF1B54D1);
  static const Color primary50 = Color(0xFF3F6FEC);
  static const Color primary60 = Color(0xFF628AFF);
  static const Color primary70 = Color(0xFF8CA8FF);
  static const Color primary80 = Color(0xFFB4C5FF);
  static const Color primary90 = Color(0xFFDBE1FF);
  static const Color primary95 = Color(0xFFEFF0FF);
  static const Color primary99 = Color(0xFFFEFBFF);
  static const Color primary100 = Color(0xFFFFFFFF);

  // Secondary palette from Figma
  static const Color secondary0 = Color(0xFF000000);
  static const Color secondary10 = Color(0xFF002020);
  static const Color secondary20 = Color(0xFF0A3636);
  static const Color secondary30 = Color(0xFF254D4C);
  static const Color secondary40 = Color(0xFF3E6564);
  static const Color secondary50 = Color(0xFF577E7D);
  static const Color secondary60 = Color(0xFF709897);
  static const Color secondary70 = Color(0xFF8AB3B2);
  static const Color secondary80 = Color(0xFFA5CECD);
  static const Color secondary90 = Color(0xFFC1EBE9);
  static const Color secondary95 = Color(0xFFCFF9F7);
  static const Color secondary100 = Color(0xFFFFFFFF);

  // Error palette from Figma
  static const Color error0 = Color(0xFF000000);
  static const Color error10 = Color(0xFF410004);
  static const Color error20 = Color(0xFF65090E);
  static const Color error30 = Color(0xFF93000A);
  static const Color error40 = Color(0xFFBA1A1A);
  static const Color error50 = Color(0xFFDE3730);
  static const Color error60 = Color(0xFFFF5449);
  static const Color error70 = Color(0xFFFF897D);
  static const Color error80 = Color(0xFFFFB4AB);
  static const Color error90 = Color(0xFFFFDAD6);
  static const Color error95 = Color(0xFFFFEDEA);
  static const Color error99 = Color(0xFFFFFBFF);
  static const Color error100 = Color(0xFFFFFFFF);

  // Neutral palette from Figma
  static const Color neutral0 = Color(0xFF000000);
  static const Color neutral10 = Color(0xFF1C1B1C);
  static const Color neutral20 = Color(0xFF313030);
  static const Color neutral30 = Color(0xFF484646);
  static const Color neutral40 = Color(0xFF605E5E);
  static const Color neutral50 = Color(0xFF797676);
  static const Color neutral60 = Color(0xFF939090);
  static const Color neutral70 = Color(0xFFADAAAA);
  static const Color neutral80 = Color(0xFFC9C6C5);
  static const Color neutral90 = Color(0xFFE5E1E1);
  static const Color neutral95 = Color(0xFFF4F0EF);
  static const Color neutral99 = Color(0xFFFFFBFF);
  static const Color neutral100 = Color(0xFFFFFFFF);
}

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: _primarySeedColor,
  brightness: Brightness.light,
).copyWith(
  // Override with specific Figma design system colors
  primary: FigmaColors.primary40,
  onPrimary: const Color(0xFFFFFFFF),
  primaryContainer: FigmaColors.primary90,
  onPrimaryContainer: FigmaColors.primary10,
  
  secondary: FigmaColors.secondary40,
  onSecondary: const Color(0xFFFFFFFF),
  secondaryContainer: FigmaColors.secondary90,
  onSecondaryContainer: FigmaColors.secondary10,
  
  error: FigmaColors.error40,
  onError: const Color(0xFFFFFFFF),
  errorContainer: FigmaColors.error90,
  onErrorContainer: FigmaColors.error10,
  
  surface: const Color(0xFFFEF7FF),
  onSurface: const Color(0xFF1A1B21),
  surfaceContainerHighest: const Color(0xFFE3E2E9),
  
  outline: const Color(0xFF757680),
  outlineVariant: const Color(0xFFC5C6D0),
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: _primarySeedColor,
  brightness: Brightness.dark,
).copyWith(
  // Override with specific Figma design system colors for dark mode
  primary: FigmaColors.primary80,
  onPrimary: FigmaColors.primary20,
  primaryContainer: FigmaColors.primary30,
  onPrimaryContainer: FigmaColors.primary90,
  
  secondary: FigmaColors.secondary80,
  onSecondary: FigmaColors.secondary20,
  secondaryContainer: FigmaColors.secondary30,
  onSecondaryContainer: FigmaColors.secondary90,
  
  error: FigmaColors.error80,
  onError: FigmaColors.error20,
  errorContainer: FigmaColors.error30,
  onErrorContainer: FigmaColors.error90,
  
  surface: const Color(0xFF141218),
  onSurface: const Color(0xFFE6E1E5),
  surfaceContainerHighest: const Color(0xFF36343B),
  
  outline: const Color(0xFF938F99),
  outlineVariant: const Color(0xFF49454F),
);
