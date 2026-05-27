// ============================================================================
// CAMMUP Design System — Typography
//
// 폰트 규칙:
//   - 영어 본문/제목: Alexandria
//   - 한국어 본문/제목: Elice Digitalbaeum
//   - Flutter의 fontFamilyFallback을 활용해 자동 전환
//
// pubspec.yaml 설정 필요:
//   fonts:
//     - family: Alexandria
//       fonts:
//         - asset: assets/fonts/Alexandria-Regular.ttf
//         - asset: assets/fonts/Alexandria-Medium.ttf
//           weight: 500
//         - asset: assets/fonts/Alexandria-SemiBold.ttf
//           weight: 600
//         - asset: assets/fonts/Alexandria-Bold.ttf
//           weight: 700
//     - family: EliceDigitalBaeum
//       fonts:
//         - asset: assets/fonts/EliceDigitalBaeum-Regular.ttf
//         - asset: assets/fonts/EliceDigitalBaeum-Bold.ttf
//           weight: 700
//
// 사용 예:
//   Text('Hello', style: AppText.h1)
//   Text('안녕하세요', style: AppText.h1)  // 같은 스타일, 폰트만 자동 전환
// ============================================================================

import 'package:flutter/material.dart';
import 'colors.dart';

// ---------------------------------------------------------------------------
// 폰트 패밀리 상수
// ---------------------------------------------------------------------------
class AppFonts {
  AppFonts._();

  static const String latin = 'Alexandria';
  static const String korean = 'EliceDigitalBaeum';

  /// 모든 텍스트에 적용할 fallback 체인.
  /// Flutter가 글리프 단위로 첫 폰트 → 없으면 다음 폰트를 시도함.
  /// 영어 텍스트는 Alexandria로, 한글이 섞이면 그 글자만 Elice로 렌더링.
  static const List<String> fallback = [korean, 'sans-serif'];
}

// ---------------------------------------------------------------------------
// AppText — 타입 스케일
//
// 명명 규칙:
//   - display: 가장 큰 히어로 텍스트
//   - h1~h4: 섹션 제목 계층
//   - body: 본문
//   - label: 작은 라벨, 메타 텍스트
//   - button: 버튼 텍스트
// ---------------------------------------------------------------------------
class AppText {
  AppText._();

  // ===== Display (Hero 메인 메시지) =====
  static const TextStyle displayDesktop = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 80,
    fontWeight: FontWeight.w400,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayTablet = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 64,
    fontWeight: FontWeight.w400,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMobile = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.15,
    color: AppColors.textPrimary,
  );

  // ===== Headings =====
  static const TextStyle h1 = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: AppColors.textPrimary,
  );

  // ===== Body =====
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyBase = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: AppColors.textSecondary,
  );

  // ===== Labels (메타, 캡션) =====
  static const TextStyle label = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // ===== Button =====
  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  // ===== Chip (팝업 버튼) =====
  static const TextStyle chipDesktop = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle chipMobile = TextStyle(
    fontFamily: AppFonts.latin,
    fontFamilyFallback: AppFonts.fallback,
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}

// ---------------------------------------------------------------------------
// AppTextHelpers — 텍스트 스타일 변형 헬퍼
// ---------------------------------------------------------------------------
extension AppTextHelpers on TextStyle {
  /// 색상만 바꾼 새 스타일
  TextStyle withColor(Color color) => copyWith(color: color);

  /// 액센트 색상 적용
  TextStyle get accent => copyWith(color: AppColors.accent);

  /// 메인 텍스트 색상 적용
  TextStyle get primary => copyWith(color: AppColors.textPrimary);

  /// 서브 텍스트 색상 적용
  TextStyle get secondary => copyWith(color: AppColors.textSecondary);

  /// 굵게
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// 세미볼드
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  /// 미디엄
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
}
