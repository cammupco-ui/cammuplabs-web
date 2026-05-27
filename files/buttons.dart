// ============================================================================
// CAMMUP Design System — Buttons
//
// 두 가지 메인 버튼:
//   - PrimaryButton: 어두운 배경의 CTA (Get in touch)
//   - ChipButton: 알약형 버튼 (Hero의 팝업 버튼들)
// ============================================================================

import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

// ---------------------------------------------------------------------------
// PrimaryButton — 메인 CTA 버튼
// ---------------------------------------------------------------------------
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool large;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppMotion.fast,
        padding: EdgeInsets.symmetric(
          horizontal: large ? 24 : 14,
          vertical: large ? 14 : 11,
        ),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.textMuted
              : AppColors.buttonPrimary,
          borderRadius: AppRadius.circular(AppRadius.lg),
        ),
        child: Text(
          label,
          style: large ? AppText.buttonLarge : AppText.button,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// ChipButton — Hero 섹션의 팝업 버튼 (알약형, 6개 가로 배치용)
// ---------------------------------------------------------------------------
class ChipButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  final bool isHighlighted; // 색이 강조됨 (예: 01번이 핑크색)
  final Color? activeColor;
  final bool mobileSize; // true면 더 작은 폰트

  const ChipButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isActive = false,
    this.isHighlighted = false,
    this.activeColor,
    this.mobileSize = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? AppColors.bubbleDefault;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppMotion.fast,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? effectiveActiveColor
              : AppColors.surfaceTranslucent,
          border: Border.all(
            color: isActive ? effectiveActiveColor : AppColors.border,
          ),
          borderRadius: AppRadius.circular(AppRadius.md),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: (mobileSize ? AppText.chipMobile : AppText.chipDesktop).copyWith(
            color: (isHighlighted || isActive)
                ? AppColors.accent
                : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// TextLinkButton — 카테고리 네비 같은 텍스트 링크
// ---------------------------------------------------------------------------
class TextLinkButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final TextStyle? style;

  const TextLinkButton({
    super.key,
    required this.label,
    required this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(label, style: style ?? AppText.label),
    );
  }
}
