// ============================================================================
// CAMMUP Design System — Colors
//
// 색상은 두 단계로 정의:
//   1) Palette: 원시 색상값 (Brown50, Pink500 등 — 직접 쓰지 마세요)
//   2) AppColors: 의미 기반 토큰 (textPrimary, bubbleBg 등 — 이걸 쓰세요)
//
// 새 색상이 필요하면 Palette에 추가하고 AppColors에 시맨틱 이름으로 노출하세요.
// ============================================================================

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Palette — 원시 색상값 (디자이너가 정한 색)
// ---------------------------------------------------------------------------
class _Palette {
  _Palette._();

  // Brand neutrals (배경/텍스트의 베이지 계열)
  static const cream = Color(0xFFFFFDFB); // 메인 배경
  static const creamGlass = Color(0x33FFFDFB); // 반투명 유리 배경 (alpha 0.2)
  static const beige100 = Color(0xFFEDE5DB); // 보더
  static const beige300 = Color(0xFFD9CFC2); // 보더 강조 (예비)

  // Text colors (브라운 계열)
  static const brown900 = Color(0xFF211C19); // 메인 텍스트, CTA 배경
  static const brown600 = Color(0xFF6B6159); // 서브 텍스트
  static const brown400 = Color(0xFF9A8E83); // 비활성 텍스트 (예비)

  // Accent (브랜드 핑크)
  static const pink500 = Color(0xFFFF0051); // 메인 액센트
  static const pink100 = Color(0xFFFFE5EE); // 핑크 배경 (예비)

  // Section colors (말풍선 배경)
  static const sky100 = Color(0xFFDEF0F8); // 01 - The Problem
  // 나머지 섹션 색상은 추후 확장 (현재는 sky100 공통 사용)

  // System colors (예비)
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const error = Color(0xFFE53935);
}

// ---------------------------------------------------------------------------
// AppColors — 시맨틱 토큰 (앱 코드에서는 이걸 사용)
// ---------------------------------------------------------------------------
class AppColors {
  AppColors._();

  // ===== Surface (배경) =====
  static const surface = _Palette.cream;
  static const surfaceGlass = _Palette.creamGlass;
  static const surfaceElevated = _Palette.white;
  static const surfaceTranslucent = Color(0x99FFFFFF); // 흰색 60%, 버튼 배경

  // ===== Text =====
  static const textPrimary = _Palette.brown900;
  static const textSecondary = _Palette.brown600;
  static const textMuted = _Palette.brown400;
  static const textOnDark = _Palette.white;
  static const textAccent = _Palette.pink500;

  // ===== Border =====
  static const border = _Palette.beige100;
  static const borderStrong = _Palette.beige300;

  // ===== Brand =====
  static const accent = _Palette.pink500;
  static const accentSubtle = _Palette.pink100;

  // ===== Interactive (버튼) =====
  static const buttonPrimary = _Palette.brown900;
  static const buttonPrimaryText = _Palette.white;

  // ===== Speech bubble (섹션 팝업) =====
  static const bubbleDefault = _Palette.sky100;

  // ===== System feedback =====
  static const success = _Palette.success;
  static const warning = _Palette.warning;
  static const error = _Palette.error;
}

// ---------------------------------------------------------------------------
// SectionColor — 각 섹션별 컬러 (확장 가능)
// 추후 섹션별로 다른 색을 쓰고 싶을 때 여기에 추가
// ---------------------------------------------------------------------------
class SectionColors {
  SectionColors._();

  // 인덱스(0-5)로 섹션 색상 가져오기
  static Color bubbleFor(int index) {
    // 현재는 모두 sky100, 나중에 섹션별 차별화 시 여기 분기
    return _Palette.sky100;
  }
}
