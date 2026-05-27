import 'package:flutter/material.dart';
import '../shared_nav.dart';
import '../responsive.dart';

class VisionPage extends StatefulWidget {
  const VisionPage({super.key});

  @override
  State<VisionPage> createState() => _VisionPageState();
}

class _VisionPageState extends State<VisionPage> {
  bool _isKorean = false;

  @override
  Widget build(BuildContext context) {
    const pink = Color(0xFFFF0051);
    const dark = Color(0xFF211C19);
    const surface = Color(0xFFFFFDFB);
    const sub = Color(0xFF6B6159);

    final roadmap = [
      _RoadmapItem(
        year: '2026',
        stage: 'Stage 1.0',
        color: pink,
        title: 'TalkBingo',
        type: _isKorean ? 'B2C · 소비자' : 'B2C · Consumer',
        status: _isKorean ? '● 출시' : '● LIVE',
        enDesc: 'A game-based chat platform for real conversation. Where empathy completes the line.',
        krDesc: '공감이 빙고를 완성하는 게임 기반 대화 플랫폼.',
      ),
      _RoadmapItem(
        year: '2027',
        stage: 'Stage 2.0',
        color: const Color(0xFF1E2A44),
        title: _isKorean ? 'Debate Platform for Class' : 'Debate Platform for Class',
        type: _isKorean ? 'B2B · 교육' : 'B2B · Education',
        status: _isKorean ? '● 개발 중' : '● In Development',
        enDesc: 'AI-driven debate designed for the classroom.',
        krDesc: '발언하는 법을 가르치는 AI 기반 토론 플랫폼.',
      ),
      _RoadmapItem(
        year: '2028',
        stage: 'Stage 3.0',
        color: const Color(0xFF6B8F71),
        title: _isKorean ? '세대간 AI 중재자' : 'Generational AI Mediator',
        type: _isKorean ? 'B2B / 연구' : 'B2B / Research',
        status: '○ R&D',
        enDesc: 'An AI that translates between generations.',
        krDesc: '세대 간 통역사가 되는 AI.',
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
                    _isKorean ? '비전 & 로드맵' : 'VISION & ROADMAP',
                    style: const TextStyle(fontFamily: 'Alexandria', fontSize: 11, fontWeight: FontWeight.w500, color: pink, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _isKorean ? '우리는 어디로 갑니다.' : "Where we're going.",
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontFamilyFallback: const ['EliceDigitalBaeum'],
                      fontSize: context.fs(56),
                      fontWeight: FontWeight.w400,
                      height: 1.15,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Text(
                      _isKorean
                          ? '3단계 연구·제품 로드맵. 각 단계가 다음 단계의 데이터와 질문 자산이 됩니다.'
                          : 'A three-stage roadmap. Each stage compounds the data and questions for the next.',
                      style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 16, height: 1.7, color: sub),
                    ),
                  ),
                  const SizedBox(height: 56),
                  ...roadmap.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _RoadmapCard(item: item, isKorean: _isKorean),
                      )),
                ],
              ),
            ),
          ),
          SharedNav(isKorean: _isKorean, onToggleLang: () => setState(() => _isKorean = !_isKorean), currentRoute: '/vision'),
        ],
      ),
    );
  }
}

class _RoadmapItem {
  final String year, stage, title, type, status, enDesc, krDesc;
  final Color color;
  const _RoadmapItem({required this.year, required this.stage, required this.color, required this.title, required this.type, required this.status, required this.enDesc, required this.krDesc});
}

class _RoadmapCard extends StatefulWidget {
  final _RoadmapItem item;
  final bool isKorean;
  const _RoadmapCard({required this.item, required this.isKorean});

  @override
  State<_RoadmapCard> createState() => _RoadmapCardState();
}

class _RoadmapCardState extends State<_RoadmapCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final i = widget.item;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDFB),
          border: Border.all(color: _hovered ? i.color : const Color(0xFFEDE5DB), width: _hovered ? 1.5 : 1),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered ? [BoxShadow(color: i.color.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 4))] : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  Text(i.year, style: TextStyle(fontFamily: 'Alexandria', fontSize: 28, fontWeight: FontWeight.w400, color: i.color, height: 1)),
                  const SizedBox(height: 4),
                  Text(i.stage, style: const TextStyle(fontFamily: 'Alexandria', fontSize: 10, color: Color(0xFF9A8E83))),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: i.color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                      child: Text(i.status, style: TextStyle(fontFamily: 'Alexandria', fontSize: 11, fontWeight: FontWeight.w600, color: i.color)),
                    ),
                    const SizedBox(width: 8),
                    Text(i.type, style: const TextStyle(fontFamily: 'Alexandria', fontSize: 11, color: Color(0xFF9A8E83))),
                  ]),
                  const SizedBox(height: 10),
                  Text(i.title, style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF211C19))),
                  const SizedBox(height: 6),
                  Text(
                    widget.isKorean ? i.krDesc : i.enDesc,
                    style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 14, color: Color(0xFF6B6159), height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
