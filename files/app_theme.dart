// ============================================================================
// CAMMUP Design System — Flutter ThemeData
//
// 사용:
//   MaterialApp(
//     theme: AppTheme.light,
//     home: ...,
//   )
// ============================================================================

import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/typography.dart';
import '../tokens/spacing.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.surface,
        primaryColor: AppColors.accent,

        // 색상 스키마
        colorScheme: const ColorScheme.light(
          primary: AppColors.accent,
          onPrimary: AppColors.textOnDark,
          secondary: AppColors.buttonPrimary,
          onSecondary: AppColors.textOnDark,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          error: AppColors.error,
        ),

        // 기본 폰트
        fontFamily: AppFonts.latin,
        fontFamilyFallback: AppFonts.fallback,

        // 텍스트 테마 — Material 위젯이 기본 사용하는 텍스트 스타일
        textTheme: const TextTheme(
          displayLarge: AppText.displayDesktop,
          displayMedium: AppText.displayTablet,
          displaySmall: AppText.displayMobile,
          headlineLarge: AppText.h1,
          headlineMedium: AppText.h2,
          headlineSmall: AppText.h3,
          titleLarge: AppText.h4,
          bodyLarge: AppText.bodyLarge,
          bodyMedium: AppText.bodyBase,
          bodySmall: AppText.bodySmall,
          labelLarge: AppText.label,
          labelMedium: AppText.labelSmall,
          labelSmall: AppText.caption,
        ),

        // ElevatedButton 기본 스타일 (PrimaryButton과 톤 맞춤)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonPrimary,
            foregroundColor: AppColors.textOnDark,
            textStyle: AppText.button,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            elevation: 0,
          ),
        ),

        // TextButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            textStyle: AppText.label,
          ),
        ),

        // OutlinedButton
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: const BorderSide(color: AppColors.border),
            textStyle: AppText.button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
        ),

        // 머티리얼 다이얼로그/시트 기본 톤
        dialogBackgroundColor: AppColors.surface,
        cardColor: AppColors.surfaceElevated,
        dividerColor: AppColors.border,
      );
}
