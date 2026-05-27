// ============================================================================
// CAMMUP Design System — Spacing, Radius, Shadow, Motion
// ============================================================================

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Spacing — 8pt 기반 (Figma의 8px 그리드와 맞춤)
// ---------------------------------------------------------------------------
class AppSpacing {
  AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;
  static const double huge = 60; // Hero 좌우 padding (데스크탑)
}

// ---------------------------------------------------------------------------
// Page padding — 브레이크포인트별 페이지 좌우 여백
// ---------------------------------------------------------------------------
class PagePadding {
  PagePadding._();

  static const double mobile = 24; // <768px
  static const double tablet = 40; // 768-1023px
  static const double desktop = 60; // >=1024px
}

// ---------------------------------------------------------------------------
// Radius — 모서리 라운드
// ---------------------------------------------------------------------------
class AppRadius {
  AppRadius._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 14; // 팝업 버튼 (chip)
  static const double lg = 18; // CTA 버튼 (Get in touch)
  static const double xl = 22; // 햄버거 버튼, 드롭다운 메뉴
  static const double xxl = 50; // 말풍선 박스
  static const double pill = 999; // 완전 알약형

  // BorderRadius shortcut
  static BorderRadius circular(double r) => BorderRadius.circular(r);
}

// ---------------------------------------------------------------------------
// Shadows — 영상/3D 배경 위에 떠 있는 느낌의 그림자
// ---------------------------------------------------------------------------
class AppShadow {
  AppShadow._();

  /// 살짝 떠 있는 카드 (예: Chip, Bubble)
  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x0F000000), // 6% 검정
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  /// 더 강조된 떠 있는 느낌 (말풍선, 드롭다운)
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x1A000000), // 10% 검정
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];

  /// 모달/다이얼로그
  static const List<BoxShadow> strong = [
    BoxShadow(
      color: Color(0x26000000), // 15% 검정
      blurRadius: 40,
      offset: Offset(0, 12),
    ),
  ];
}

// ---------------------------------------------------------------------------
// Glass — 유리(frosted glass) 효과 파라미터
// statusbar, 모달 등에 쓰임
// ---------------------------------------------------------------------------
class AppGlass {
  AppGlass._();

  /// statusbar 같은 가벼운 유리
  static const double blurLight = 12;

  /// 모달 같은 강한 유리
  static const double blurStrong = 24;
}

// ---------------------------------------------------------------------------
// Motion — 애니메이션 duration/curve 표준
// ---------------------------------------------------------------------------
class AppMotion {
  AppMotion._();

  // Duration
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration base = Duration(milliseconds: 220);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration deliberate = Duration(milliseconds: 500);

  // Curve
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeOutBack = Curves.easeOutBack; // 살짝 튀는 느낌
  static const Curve emphasized = Cubic(0.2, 0.0, 0, 1.0); // Material 3 emphasized
}

// ---------------------------------------------------------------------------
// Breakpoints — 반응형 분기점
// ---------------------------------------------------------------------------
class Breakpoints {
  Breakpoints._();

  static const double mobile = 768; // 미만 = mobile
  static const double tablet = 1024; // 미만 = tablet, 이상 = desktop
  static const double wide = 1440; // 와이드 데스크탑 (참고용)
}
