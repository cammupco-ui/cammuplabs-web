// ============================================================================
// CAMMUP Design System — Responsive Helpers
//
// 사용 예:
//   final padding = context.responsive(
//     mobile: 24.0,
//     tablet: 40.0,
//     desktop: 60.0,
//   );
//
//   if (context.isMobile) { ... }
//
//   Text('Hi', style: context.responsive(
//     mobile: AppText.displayMobile,
//     tablet: AppText.displayTablet,
//     desktop: AppText.displayDesktop,
//   ))
// ============================================================================

import 'package:flutter/material.dart';
import '../tokens/spacing.dart';

enum DeviceType { mobile, tablet, desktop }

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  DeviceType get deviceType {
    final w = screenWidth;
    if (w >= Breakpoints.tablet) return DeviceType.desktop;
    if (w >= Breakpoints.mobile) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isHandheld => !isDesktop; // mobile + tablet

  /// 디바이스별로 다른 값을 고름.
  /// tablet/desktop을 지정하지 않으면 mobile 값을 fallback으로 사용.
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (deviceType) {
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }

  /// 페이지 좌우 여백
  double get pagePadding => responsive(
        mobile: PagePadding.mobile,
        tablet: PagePadding.tablet,
        desktop: PagePadding.desktop,
      );
}

// ---------------------------------------------------------------------------
// ResponsiveBuilder — 디바이스별 다른 위젯
// ---------------------------------------------------------------------------
class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return context.responsive(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
