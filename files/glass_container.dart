// ============================================================================
// CAMMUP Design System — Glass Container
//
// 배경 영상/3D 위에 유리 효과를 입힌 컨테이너.
// statusbar, 모달, 카드 등 어디서나 재사용.
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color tint;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = AppGlass.blurLight,
    this.tint = AppColors.surfaceGlass,
    this.borderRadius,
    this.padding,
    this.boxShadow,
  });

  /// statusbar용 프리셋 (반투명 + 가벼운 블러)
  const GlassContainer.statusBar({
    super.key,
    required this.child,
    this.padding,
  })  : blur = AppGlass.blurLight,
        tint = AppColors.surfaceGlass,
        borderRadius = null,
        boxShadow = null;

  /// 카드/패널용 프리셋 (라운드 + 그림자)
  GlassContainer.card({
    super.key,
    required this.child,
    this.padding,
    double radius = AppRadius.lg,
  })  : blur = AppGlass.blurLight,
        tint = AppColors.surfaceGlass,
        borderRadius = BorderRadius.circular(radius),
        boxShadow = AppShadow.soft;

  @override
  Widget build(BuildContext context) {
    final clipper = borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius!,
            child: _buildBlur(),
          )
        : ClipRect(child: _buildBlur());

    if (boxShadow != null && boxShadow!.isNotEmpty) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: clipper,
      );
    }
    return clipper;
  }

  Widget _buildBlur() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        color: tint,
        padding: padding,
        child: child,
      ),
    );
  }
}
