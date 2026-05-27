import 'package:flutter/material.dart';
import '../shared_nav.dart';
import '../responsive.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({super.key});

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  bool _isKorean = false;

  @override
  Widget build(BuildContext context) {
    const pink  = Color(0xFFFF0051);
    const dark  = Color(0xFF211C19);
    const navy  = Color(0xFF1E2A44);
    const surface = Color(0xFFFFFDFB);
    const sub   = Color(0xFF6B6159);
    const border = Color(0xFFEDE5DB);

    final products = [
      _ProductData(
        name: 'TalkBingo',
        accentBg: const Color(0xFFFFE5EE),
        accentText: pink,
        type: 'B2C',
        statusEn: '● Live',
        statusKr: '● 출시',
        taglineEn: 'Game-based communication.\nEmpathy is the rule that completes the line.',
        taglineKr: '공감으로 완성되는 게임 기반 대화.',
        featuresEn: ['AI-generated questions', 'Empathy-driven gameplay', 'iOS · Android'],
        featuresKr: ['AI 질문 생성', '공감 기반 게임플레이', 'iOS · Android'],
        ctaEn: 'Visit page →',
        ctaKr: '방문하기 →',
      ),
      _ProductData(
        name: 'Debate Platform\nfor Class',
        accentBg: navy,
        accentText: Colors.white,
        type: 'B2B',
        statusEn: '○ In development',
        statusKr: '○ 개발 중',
        taglineEn: 'Where students learn by speaking,\nnot by being told.',
        taglineKr: '강요가 아닌, 발언으로 배우는 교실.',
        featuresEn: ['AI debate prompts', 'Turn-based flow', 'SEL-integrated'],
        featuresKr: ['AI 토론 주제', '턴 기반 진행', 'SEL 통합'],
        ctaEn: 'Preview →',
        ctaKr: '미리 보기 →',
        ctaOutline: true,
      ),
    ];

    return Scaffold(
      backgroundColor: surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(context.px, 100, context.px, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isKorean ? '브랜드 & 제품' : 'BRAND & PRODUCTS',
                    style: const TextStyle(fontFamily: 'Alexandria', fontSize: 11, fontWeight: FontWeight.w500, color: pink, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _isKorean ? '지금까지 만든 것.' : "What we've built so far.",
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontFamilyFallback: const ['EliceDigitalBaeum'],
                      fontSize: context.fs(56),
                      fontWeight: FontWeight.w400,
                      height: 1.15,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 48),
                  ...products.map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ProductCard(data: p, isKorean: _isKorean),
                      )),
                ],
              ),
            ),
          ),
          SharedNav(isKorean: _isKorean, onToggleLang: () => setState(() => _isKorean = !_isKorean), currentRoute: '/brand'),
        ],
      ),
    );
  }
}

class _ProductData {
  final String name, type, statusEn, statusKr, taglineEn, taglineKr, ctaEn, ctaKr;
  final Color accentBg, accentText;
  final List<String> featuresEn, featuresKr;
  final bool ctaOutline;
  const _ProductData({
    required this.name, required this.accentBg, required this.accentText,
    required this.type, required this.statusEn, required this.statusKr,
    required this.taglineEn, required this.taglineKr,
    required this.featuresEn, required this.featuresKr,
    required this.ctaEn, required this.ctaKr,
    this.ctaOutline = false,
  });
}

class _ProductCard extends StatefulWidget {
  final _ProductData data;
  final bool isKorean;
  const _ProductCard({required this.data, required this.isKorean});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final isDesktop = context.isDesktop;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isDesktop ? 200 : null,
        decoration: BoxDecoration(
          border: Border.all(color: _hovered ? const Color(0xFFD9CFC2) : const Color(0xFFEDE5DB)),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))] : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: isDesktop
              ? Row(children: [
                  _AccentPanel(data: d, isKorean: widget.isKorean),
                  Expanded(child: _ContentPanel(data: d, isKorean: widget.isKorean)),
                ])
              : Column(children: [
                  _AccentPanel(data: d, isKorean: widget.isKorean, horizontal: true),
                  _ContentPanel(data: d, isKorean: widget.isKorean),
                ]),
        ),
      ),
    );
  }
}

class _AccentPanel extends StatelessWidget {
  final _ProductData data;
  final bool isKorean, horizontal;
  const _AccentPanel({required this.data, required this.isKorean, this.horizontal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontal ? double.infinity : 220,
      height: horizontal ? 80 : null,
      color: data.accentBg,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: TextStyle(
              fontFamily: 'Alexandria',
              fontFamilyFallback: const ['EliceDigitalBaeum'],
              fontSize: horizontal ? 16 : 22,
              fontWeight: FontWeight.w700,
              color: data.accentText,
            ),
          ),
          if (!horizontal) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isKorean ? data.statusKr : data.statusEn,
                style: TextStyle(fontFamily: 'Alexandria', fontSize: 10, fontWeight: FontWeight.w600, color: data.accentText),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ContentPanel extends StatelessWidget {
  final _ProductData data;
  final bool isKorean;
  const _ContentPanel({required this.data, required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final features = isKorean ? data.featuresKr : data.featuresEn;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isKorean ? data.taglineKr : data.taglineEn,
            style: const TextStyle(
              fontFamily: 'Alexandria',
              fontFamilyFallback: ['EliceDigitalBaeum'],
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.4,
              color: Color(0xFF211C19),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: features.map((f) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFDFB),
                border: Border.all(color: const Color(0xFFEDE5DB)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(f, style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 11, color: Color(0xFF6B6159))),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
