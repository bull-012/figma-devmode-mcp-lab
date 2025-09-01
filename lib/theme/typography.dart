import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle _baseTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
    Color? color,
  }) {
    return GoogleFonts.notoSansJp(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // Title styles
  static TextStyle titleXL({Color? color}) => _baseTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 1.6,
        color: color ?? const Color(0xFF2F3036),
      );

  static TextStyle titleL({Color? color}) => _baseTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 0.8,
        color: color ?? const Color(0xFF2F3036),
      );

  static TextStyle titleM({Color? color}) => _baseTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 0.7,
        color: color ?? const Color(0xFF2F3036),
      );

  static TextStyle titleS({Color? color}) => _baseTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.5,
        letterSpacing: 0.6,
        color: color ?? const Color(0xFF2F3036),
      );

  // Body styles - Regular
  static TextStyle bodyLRegular({Color? color}) => _baseTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodyMRegular({Color? color}) => _baseTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodySRegular({Color? color}) => _baseTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodyXSRegular({Color? color}) => _baseTextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color ?? const Color(0xFF2F3036),
      );

  // Body styles - Bold
  static TextStyle bodyLBold({Color? color}) => _baseTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodyMBold({Color? color}) => _baseTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodySBold({Color? color}) => _baseTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.6,
        color: color ?? const Color(0xFF757680),
      );

  static TextStyle bodyXSBold({Color? color}) => _baseTextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        height: 1.6,
        color: color ?? const Color(0xFF2F3036),
      );
}

// TextTheme extension for Material Design integration
extension AppTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

// Custom TextTheme configuration
TextTheme createTextTheme() {
  return TextTheme(
    // Display styles (equivalent to Title XL)
    displayLarge: AppTypography.titleXL(),
    displayMedium: AppTypography.titleXL(),
    displaySmall: AppTypography.titleXL(),
    
    // Headline styles (Title variants)
    headlineLarge: AppTypography.titleXL(),
    headlineMedium: AppTypography.titleL(),
    headlineSmall: AppTypography.titleM(),
    
    // Title styles
    titleLarge: AppTypography.titleL(),
    titleMedium: AppTypography.titleM(),
    titleSmall: AppTypography.titleS(),
    
    // Body styles
    bodyLarge: AppTypography.bodyLRegular(),
    bodyMedium: AppTypography.bodyMRegular(),
    bodySmall: AppTypography.bodySRegular(),
    
    // Label styles
    labelLarge: AppTypography.bodyLBold(),
    labelMedium: AppTypography.bodyMBold(),
    labelSmall: AppTypography.bodySBold(),
  );
}