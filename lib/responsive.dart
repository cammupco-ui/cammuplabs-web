// ============================================================================
// CAMMUP — Responsive Layout System
//
// 브레이크포인트:
//   mobile  : 0  ~ 599px
//   tablet  : 600 ~ 1023px
//   desktop : 1024px ~  (컨텐츠 최대 1440px, 중앙 정렬)
//
// 사용:
//   context.isMobile / context.isTablet / context.isDesktop
//   context.r(mobile: 20, tablet: 40, desktop: 60)
//   context.px          → 페이지 좌우 여백
//   context.fs(80)      → 화면 크기에 비례한 폰트 사이즈 (desktop 기준)
// ============================================================================

import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// 상수
// ─────────────────────────────────────────────────────────────────────────────

const double kMobile  = 600;
const double kTablet  = 1024;
const double kMaxContent = 1440; // 데스크탑 최대 컨텐츠 너비
const double kMinWidth   = 320;  // 최소 지원 너비

// ─────────────────────────────────────────────────────────────────────────────
// BuildContext 확장
// ─────────────────────────────────────────────────────────────────────────────

extension Responsive on BuildContext {
  double get sw => MediaQuery.of(this).size.width;
  double get sh => MediaQuery.of(this).size.height;

  bool get isMobile  => sw < kMobile;
  bool get isTablet  => sw >= kMobile && sw < kTablet;
  bool get isDesktop => sw >= kTablet;

  /// 디바이스별 값 분기
  T r<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet)  return tablet  ?? mobile;
    return mobile;
  }

  /// 페이지 좌우 여백
  double get px => r(mobile: 20.0, tablet: 40.0, desktop: 60.0);

  /// 데스크탑 기준 폰트 사이즈를 화면 비율로 축소
  /// desktop 기준값을 넣으면 모바일/태블릿에서 자동 스케일
  double fs(double desktopSize) {
    if (isDesktop) return desktopSize;
    if (isTablet)  return desktopSize * 0.72;
    return           desktopSize * 0.50;
  }

  /// 네비바 높이 포함 상단 여백
  double get navOffset => 76.0;
}

// ─────────────────────────────────────────────────────────────────────────────
// 전역 페이지 래퍼
//
// 모든 Scaffold body를 이걸로 감싸면:
//  - 초소형 화면: 가로 스크롤 (최소 320px 보장)
//  - 와이드 화면: 컨텐츠 중앙 정렬 (최대 1440px)
// ─────────────────────────────────────────────────────────────────────────────

class PageWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;

  const PageWrapper({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    // 초소형: 가로 스크롤로 최소 너비 보장
    if (w < kMinWidth) {
      return Container(
        color: color,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(width: kMinWidth, child: child),
        ),
      );
    }

    // 와이드: 중앙 정렬 + 최대 너비
    return Container(
      color: color,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxContent),
          child: child,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 반응형 텍스트 스타일 헬퍼
// ─────────────────────────────────────────────────────────────────────────────

class AppTextStyle {
  static const _latin = 'Alexandria';
  static const _fallback = ['EliceDigitalBaeum', 'sans-serif'];

  static TextStyle display(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.fs(80),
        fontWeight: FontWeight.w400,
        height: 1.1,
        color: const Color(0xFF211C19),
      );

  static TextStyle h1(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.fs(48),
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: const Color(0xFF211C19),
      );

  static TextStyle h2(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.fs(36),
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: const Color(0xFF211C19),
      );

  static TextStyle body(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.r(mobile: 14.0, tablet: 15.0, desktop: 16.0),
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: const Color(0xFF6B6159),
      );

  static TextStyle subHero(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.r(mobile: 14.0, tablet: 17.0, desktop: 22.0),
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1880AC),
      );

  static TextStyle label(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.r(mobile: 12.0, tablet: 13.0, desktop: 14.0),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF211C19),
      );

  static TextStyle chip(BuildContext ctx) => TextStyle(
        fontFamily: _latin,
        fontFamilyFallback: _fallback,
        fontSize: ctx.r(mobile: 9.0, tablet: 10.0, desktop: 10.0),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF6B6159),
      );
}
