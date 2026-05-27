// ============================================================================
// CAMMUP Design System — 사용 예제
//
// 이 파일은 디자인 시스템의 모든 토큰/컴포넌트를 어떻게 함께 쓰는지
// 보여주는 참고용 페이지입니다. 그대로 가져다 써도 되고,
// 새 페이지를 만들 때 패턴을 참고하세요.
// ============================================================================

import 'package:flutter/material.dart';
import '../lib/cammup_ds.dart';

class ExampleLandingPage extends StatelessWidget {
  final Widget? backgroundLayer;

  const ExampleLandingPage({super.key, this.backgroundLayer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // 1) 배경 (영상/3D)
          if (backgroundLayer != null) Positioned.fill(child: backgroundLayer!),

          // 2) Hero 콘텐츠
          const Positioned.fill(child: _Hero()),

          // 3) 유리 statusbar (위에 떠 있음)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _StatusBar(),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Status Bar — 유리 효과 + 반응형 분기
// ---------------------------------------------------------------------------
class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    return GlassContainer.statusBar(
      padding: EdgeInsets.symmetric(
        horizontal: context.pagePadding,
        vertical: AppSpacing.lg,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 로고
            Text(
              'CAMMUP',
              style: AppText.h4.bold,
            ),
            // 데스크탑: 가운데 카테고리
            if (context.isDesktop)
              Row(
                children: ['Company', 'Vision', 'Brand', 'Contact']
                    .map((c) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.xxl),
                          child: TextLinkButton(label: c, onTap: () {}),
                        ))
                    .toList(),
              ),
            // 오른쪽
            Row(
              children: [
                TextLinkButton(
                  label: 'EN / KR',
                  onTap: () {},
                  style: AppText.labelSmall,
                ),
                SizedBox(width: AppSpacing.sm),
                if (context.isDesktop)
                  PrimaryButton(label: 'Get in touch', onTap: () {})
                else
                  const SizedBox.shrink(), // 햄버거는 별도 컴포넌트로
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Hero
// ---------------------------------------------------------------------------
class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    // 반응형 텍스트 스타일 분기
    final displayStyle = context.responsive(
      mobile: AppText.displayMobile,
      tablet: AppText.displayTablet,
      desktop: AppText.displayDesktop,
    );

    final subStyle = context.responsive(
      mobile: AppText.bodyBase.secondary,
      tablet: AppText.bodyMedium.secondary,
      desktop: AppText.bodyLarge.accent, // 데스크탑만 핑크
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.pagePadding,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        children: [
          // statusbar 스페이서
          const SizedBox(height: 77),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('A technology',
                      textAlign: TextAlign.center, style: displayStyle),
                  const SizedBox(height: 10),
                  Text('for meaningful conversation.',
                      textAlign: TextAlign.center, style: displayStyle),
                  SizedBox(height: AppSpacing.xl),
                  Text('진심이 닿는 소통을 설계합니다.',
                      textAlign: TextAlign.center, style: subStyle),
                ],
              ),
            ),
          ),
          // 팝업 버튼 6개
          Row(
            children: List.generate(6, (i) {
              const labels = [
                '01 / The Problem',
                '02 / Our Thesis',
                '03 / Roadmap',
                '04 / Why Now',
                '05 / Now Live',
                '06 / Contact',
              ];
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                  child: ChipButton(
                    label: labels[i],
                    onTap: () {},
                    isHighlighted: i == 0,
                    mobileSize: context.isMobile,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
