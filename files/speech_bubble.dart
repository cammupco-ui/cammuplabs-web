// ============================================================================
// CAMMUP Design System — Speech Bubble
//
// 말풍선 박스 + 꼬리(tail). 섹션 팝업 외에도 툴팁, 안내 메시지 등에 재사용.
// ============================================================================

import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

enum TailDirection { down, up, left, right }

class SpeechBubble extends StatelessWidget {
  final Widget child;
  final Color color;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final TailDirection tailDirection;
  final double tailOffset; // tail이 박스 한쪽 끝에서 떨어진 거리 (px)
  final double tailWidth;
  final double tailHeight;
  final bool showShadow;

  const SpeechBubble({
    super.key,
    required this.child,
    this.color = AppColors.bubbleDefault,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
    this.tailDirection = TailDirection.down,
    this.tailOffset = 0.5, // 0~1 비율 또는 절대값 (1보다 크면 절대 px)
    this.tailWidth = 40,
    this.tailHeight = 24,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppRadius.xxl);

    return CustomPaint(
      painter: _BubblePainter(
        color: color,
        borderRadius: radius,
        tailDirection: tailDirection,
        tailOffset: tailOffset,
        tailWidth: tailWidth,
        tailHeight: tailHeight,
        showShadow: showShadow,
      ),
      child: Padding(
        padding: _paddingWithTail(),
        child: child,
      ),
    );
  }

  /// tail 방향에 따라 박스에 추가 여백을 더해줌
  EdgeInsets _paddingWithTail() {
    final base = padding.resolve(TextDirection.ltr);
    switch (tailDirection) {
      case TailDirection.down:
        return EdgeInsets.fromLTRB(
          base.left,
          base.top,
          base.right,
          base.bottom + tailHeight,
        );
      case TailDirection.up:
        return EdgeInsets.fromLTRB(
          base.left,
          base.top + tailHeight,
          base.right,
          base.bottom,
        );
      case TailDirection.left:
        return EdgeInsets.fromLTRB(
          base.left + tailHeight,
          base.top,
          base.right,
          base.bottom,
        );
      case TailDirection.right:
        return EdgeInsets.fromLTRB(
          base.left,
          base.top,
          base.right + tailHeight,
          base.bottom,
        );
    }
  }
}

class _BubblePainter extends CustomPainter {
  final Color color;
  final BorderRadius borderRadius;
  final TailDirection tailDirection;
  final double tailOffset;
  final double tailWidth;
  final double tailHeight;
  final bool showShadow;

  _BubblePainter({
    required this.color,
    required this.borderRadius,
    required this.tailDirection,
    required this.tailOffset,
    required this.tailWidth,
    required this.tailHeight,
    required this.showShadow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 박스 영역 (tail 공간 제외)
    Rect boxRect;
    switch (tailDirection) {
      case TailDirection.down:
        boxRect = Rect.fromLTWH(0, 0, size.width, size.height - tailHeight);
        break;
      case TailDirection.up:
        boxRect = Rect.fromLTWH(0, tailHeight, size.width, size.height - tailHeight);
        break;
      case TailDirection.left:
        boxRect = Rect.fromLTWH(tailHeight, 0, size.width - tailHeight, size.height);
        break;
      case TailDirection.right:
        boxRect = Rect.fromLTWH(0, 0, size.width - tailHeight, size.height);
        break;
    }

    final boxPath = Path()..addRRect(borderRadius.toRRect(boxRect));
    final tailPath = _buildTailPath(boxRect);

    final fullPath = Path.combine(PathOperation.union, boxPath, tailPath);

    if (showShadow) {
      canvas.drawShadow(fullPath, Colors.black.withOpacity(0.08), 16, false);
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(fullPath, paint);
  }

  Path _buildTailPath(Rect box) {
    final path = Path();

    // tailOffset 해석: <=1.0이면 비율, >1이면 절대 px
    double resolveX() {
      if (tailOffset <= 1.0) {
        return box.left + box.width * tailOffset;
      }
      return tailOffset;
    }

    double resolveY() {
      if (tailOffset <= 1.0) {
        return box.top + box.height * tailOffset;
      }
      return tailOffset;
    }

    switch (tailDirection) {
      case TailDirection.down:
        final cx = resolveX();
        path.moveTo(cx - tailWidth / 2, box.bottom);
        path.lineTo(cx + tailWidth / 2, box.bottom);
        path.lineTo(cx + 4, box.bottom + tailHeight - 2);
        path.quadraticBezierTo(
          cx, box.bottom + tailHeight,
          cx - 4, box.bottom + tailHeight - 2,
        );
        path.close();
        break;
      case TailDirection.up:
        final cx = resolveX();
        path.moveTo(cx - tailWidth / 2, box.top);
        path.lineTo(cx + tailWidth / 2, box.top);
        path.lineTo(cx + 4, box.top - tailHeight + 2);
        path.quadraticBezierTo(
          cx, box.top - tailHeight,
          cx - 4, box.top - tailHeight + 2,
        );
        path.close();
        break;
      case TailDirection.left:
        final cy = resolveY();
        path.moveTo(box.left, cy - tailWidth / 2);
        path.lineTo(box.left, cy + tailWidth / 2);
        path.lineTo(box.left - tailHeight + 2, cy + 4);
        path.quadraticBezierTo(
          box.left - tailHeight, cy,
          box.left - tailHeight + 2, cy - 4,
        );
        path.close();
        break;
      case TailDirection.right:
        final cy = resolveY();
        path.moveTo(box.right, cy - tailWidth / 2);
        path.lineTo(box.right, cy + tailWidth / 2);
        path.lineTo(box.right + tailHeight - 2, cy + 4);
        path.quadraticBezierTo(
          box.right + tailHeight, cy,
          box.right + tailHeight - 2, cy - 4,
        );
        path.close();
        break;
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _BubblePainter old) {
    return color != old.color ||
        tailDirection != old.tailDirection ||
        tailOffset != old.tailOffset ||
        tailWidth != old.tailWidth ||
        tailHeight != old.tailHeight;
  }
}
