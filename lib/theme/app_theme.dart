import 'package:flutter/material.dart';

import 'typography.dart';

class AppTheme {
  // Color scheme based on Figma design
  static const ColorScheme colorScheme = ColorScheme.light(
    primary: Color(0xFF1976D2),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF757680),
    onSecondary: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFAFA),
    onSurface: Color(0xFF1A1B21),
    surfaceContainerHighest: Color(0xFFE0E0E0),
    outline: Color(0xFF757680),
    outlineVariant: Color(0xFFC5C6D0),
    inverseSurface: Color(0xFF2F3036),
    onInverseSurface: Color(0xFFFFFFFF),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
  );

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: createTextTheme(),

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        titleTextStyle: AppTypography.titleL(color: colorScheme.onSurface),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: AppTypography.bodyMBold(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTypography.bodyMBold(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTypography.bodyMBold(),
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        labelStyle: AppTypography.bodyMRegular(color: colorScheme.onSurface),
        hintStyle: AppTypography.bodyMRegular(color: colorScheme.outline),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        labelStyle: AppTypography.bodySRegular(color: colorScheme.onSurface),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        titleTextStyle: AppTypography.bodyLRegular(
          color: colorScheme.onSurface,
        ),
        subtitleTextStyle: AppTypography.bodyMRegular(
          color: colorScheme.outline,
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
    );
  }

  // Dark theme can be added here if needed
  static ThemeData darkTheme() {
    // TODO: Implement dark theme when designs are available
    return lightTheme();
  }
}
