import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../responsive.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Design Tokens
// ─────────────────────────────────────────────────────────────────────────────

class _C {
  static const surface    = Color(0xFFFFFDFB);
  static const dark       = Color(0xFF211C19);
  static const pink       = Color(0xFFFF0051);
  static const navy       = Color(0xFF1E2A44);
  static const sage       = Color(0xFF6B8F71);
  static const textSub    = Color(0xFF6B6159);
  static const textMuted  = Color(0xFF9A8E83);
  static const textBlue   = Color(0xFF1880AC);
  static const border     = Color(0xFFEDE5DB);
  static const borderHvr  = Color(0xFFD9CFC2);
  static const glass      = Color(0xCCFFFDFB);
}

class _Mo {
  static const fast     = Duration(milliseconds: 150);
  static const base     = Duration(milliseconds: 220);
  static const slow     = Duration(milliseconds: 380);
  static const popup    = Duration(milliseconds: 280);
}

// ─────────────────────────────────────────────────────────────────────────────
// Popup data model
// ─────────────────────────────────────────────────────────────────────────────

class PopupContent {
  final String tagEn, tagKr, titleEn, titleKr;
  final Widget Function(bool isKr) bodyBuilder;
  const PopupContent({
    required this.tagEn, required this.tagKr,
    required this.titleEn, required this.titleKr,
    required this.bodyBuilder,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// HOME PAGE
// ─────────────────────────────────────────────────────────────────────────────

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _isKorean = ValueNotifier<bool>(false);
  PopupContent? _activePopup;

  void _openPopup(PopupContent content) =>
      setState(() => _activePopup = content);

  void _closePopup() => setState(() => _activePopup = null);

  @override
  void dispose() {
    _isKorean.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _C.surface,
      body: Stack(
        children: [
          // ── Hero ────────────────────────────────────────────────────────────
          ValueListenableBuilder<bool>(
            valueListenable: _isKorean,
            builder: (_, kr, __) => _HeroBody(
              isKorean: kr,
              onChipTap: _openPopup,
              onNavTap: (route) => Navigator.pushNamed(context, route),
              onGetInTouch: () => Navigator.pushNamed(context, '/contact'),
            ),
          ),

          // ── Nav bar (on top of hero) ─────────────────────────────────────
          ValueListenableBuilder<bool>(
            valueListenable: _isKorean,
            builder: (_, kr, __) => _NavBar(
              isKorean: kr,
              onToggleLang: () => _isKorean.value = !_isKorean.value,
              onNavTap: (route) => Navigator.pushNamed(context, route),
              onGetInTouch: () => Navigator.pushNamed(context, '/contact'),
            ),
          ),

          // ── Popup overlay ────────────────────────────────────────────────
          if (_activePopup != null)
            ValueListenableBuilder<bool>(
              valueListenable: _isKorean,
              builder: (_, kr, __) => _PopupOverlay(
                content: _activePopup!,
                isKorean: kr,
                onClose: _closePopup,
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HERO BODY
// ─────────────────────────────────────────────────────────────────────────────

class _HeroBody extends StatelessWidget {
  final bool isKorean;
  final void Function(PopupContent) onChipTap;
  final void Function(String) onNavTap;
  final VoidCallback onGetInTouch;

  const _HeroBody({
    required this.isKorean,
    required this.onChipTap,
    required this.onNavTap,
    required this.onGetInTouch,
  });

  @override
  Widget build(BuildContext context) {
    final chips = _buildChips(isKorean, onChipTap);
    // 모바일에서 칩 2줄 wrap 처리
    final isMobile = context.isMobile;

    return Container(
      color: _C.surface,
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.px, vertical: 20),
        child: Column(
          children: [
            // Nav spacer
            SizedBox(height: context.navOffset),

            // Main headline
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isKorean ? '질문이 기술이 되는 곳,' : 'A technology',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.display(context).copyWith(color: _C.dark),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isKorean ? '캠업입니다.' : 'for meaningful conversation.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.display(context).copyWith(color: _C.dark),
                    ),
                    SizedBox(height: context.r(mobile: 16.0, tablet: 20.0, desktop: 24.0)),
                    Text(
                      isKorean
                          ? 'We build the technology of questions.'
                          : '진심이 닿는 소통을 설계합니다.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.subHero(context),
                    ),
                  ],
                ),
              ),
            ),

            // Section chips — desktop: 1줄, mobile: 2×3 그리드
            if (isMobile)
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: chips
                    .map((c) => SizedBox(
                          width: (MediaQuery.of(context).size.width - context.px * 2 - 12) / 3,
                          child: c,
                        ))
                    .toList(),
              )
            else
              Row(
                children: chips
                    .map((c) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: c,
                          ),
                        ))
                    .toList(),
              ),

            SizedBox(height: context.r(mobile: 40.0, tablet: 60.0, desktop: 80.0)),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChips(bool kr, void Function(PopupContent) onTap) {
    final items = [
      ('01 / The Problem', '01 / 문제 정의', _popupProblem),
      ('02 / Our Thesis', '02 / 핵심 명제', _popupThesis),
      ('03 / Roadmap', '03 / 로드맵', _popupRoadmap),
      ('04 / Why Now', '04 / 왜 지금인가', _popupWhyNow),
      ('05 / Now Live', '05 / 지금 바로', _popupNowLive),
      ('06 / Contact', '06 / 문의', _popupContact),
    ];
    return items
        .map((item) => _ChipBtn(
              label: kr ? item.$2 : item.$1,
              onTap: () => onTap(item.$3),
            ))
        .toList();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NAV BAR
// ─────────────────────────────────────────────────────────────────────────────

class _NavBar extends StatelessWidget {
  final bool isKorean;
  final VoidCallback onToggleLang;
  final void Function(String) onNavTap;
  final VoidCallback onGetInTouch;

  const _NavBar({
    required this.isKorean,
    required this.onToggleLang,
    required this.onNavTap,
    required this.onGetInTouch,
  });

  @override
  Widget build(BuildContext context) {
    final navHeight = context.r(mobile: 52.0, tablet: 56.0, desktop: 56.0);
    final logoH    = context.r(mobile: 16.0, tablet: 18.0, desktop: 20.0);

    return Positioned(
      top: 0, left: 0, right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: _C.glass,
            padding: EdgeInsets.symmetric(horizontal: context.px, vertical: 10),
            child: SizedBox(
              height: navHeight,
              child: Row(
                children: [
                  // Logo
                  GestureDetector(
                    onTap: () => onNavTap('/'),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SvgPicture.asset('assets/logo.svg', height: logoH),
                    ),
                  ),

                  // 데스크탑: 중앙 메뉴
                  if (context.isDesktop) ...[
                    const Spacer(),
                    _NavLink(label: isKorean ? '회사' : 'Company', onTap: () => onNavTap('/company')),
                    const SizedBox(width: 48),
                    _NavLink(label: isKorean ? '비전' : 'Vision', onTap: () => onNavTap('/vision')),
                    const SizedBox(width: 48),
                    _NavLink(label: isKorean ? '브랜드' : 'Brand', onTap: () => onNavTap('/brand')),
                    const SizedBox(width: 48),
                    _NavLink(label: isKorean ? '문의' : 'Contact', onTap: () => onNavTap('/contact')),
                    const Spacer(),
                  // 태블릿: 메뉴 간격 축소
                  ] else if (context.isTablet) ...[
                    const Spacer(),
                    _NavLink(label: isKorean ? '회사' : 'Company', onTap: () => onNavTap('/company')),
                    const SizedBox(width: 24),
                    _NavLink(label: isKorean ? '비전' : 'Vision', onTap: () => onNavTap('/vision')),
                    const SizedBox(width: 24),
                    _NavLink(label: isKorean ? '브랜드' : 'Brand', onTap: () => onNavTap('/brand')),
                    const SizedBox(width: 24),
                    _NavLink(label: isKorean ? '문의' : 'Contact', onTap: () => onNavTap('/contact')),
                    const Spacer(),
                  // 모바일: 메뉴 숨김
                  ] else
                    const Spacer(),

                  _LangToggle(isKorean: isKorean, onToggle: onToggleLang),
                  const SizedBox(width: 12),
                  _CTAButton(
                    label: context.isMobile
                        ? (isKorean ? '문의' : 'Contact')
                        : (isKorean ? '문의하기' : 'Get in touch'),
                    onTap: onGetInTouch,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// POPUP OVERLAY
// ─────────────────────────────────────────────────────────────────────────────

class _PopupOverlay extends StatefulWidget {
  final PopupContent content;
  final bool isKorean;
  final VoidCallback onClose;

  const _PopupOverlay({
    required this.content,
    required this.isKorean,
    required this.onClose,
  });

  @override
  State<_PopupOverlay> createState() => _PopupOverlayState();
}

class _PopupOverlayState extends State<_PopupOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: _Mo.popup);
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _ctrl.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: GestureDetector(
        onTap: _dismiss,
        child: Container(
          color: Colors.black.withOpacity(0.45),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SlideTransition(
              position: _slide,
              child: GestureDetector(
                // Prevent tap-through to backdrop
                onTap: () {},
                child: _PopupPanel(
                  content: widget.content,
                  isKorean: widget.isKorean,
                  onClose: _dismiss,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PopupPanel extends StatelessWidget {
  final PopupContent content;
  final bool isKorean;
  final VoidCallback onClose;

  const _PopupPanel({
    required this.content,
    required this.isKorean,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final maxW = w > 800 ? 720.0 : w * 0.92;
    final maxH = MediaQuery.of(context).size.height * 0.80;

    return Container(
      width: maxW,
      constraints: BoxConstraints(maxHeight: maxH),
      decoration: BoxDecoration(
        color: _C.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 28, 24, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isKorean ? content.tagKr : content.tagEn,
                        style: const TextStyle(
                          fontFamily: 'Alexandria',
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: _C.pink,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isKorean ? content.titleKr : content.titleEn,
                        style: const TextStyle(
                          fontFamily: 'Alexandria',
                          fontFamilyFallback: ['EliceDigitalBaeum'],
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: _C.dark,
                        ),
                      ),
                    ],
                  ),
                ),
                // Close button
                _CloseBtn(onTap: onClose),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: _C.border, thickness: 1, height: 1),
          // Body (scrollable)
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
              child: content.bodyBuilder(isKorean),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// POPUP CONTENT DEFINITIONS
// ─────────────────────────────────────────────────────────────────────────────

final _popupProblem = PopupContent(
  tagEn: '01 / THE PROBLEM',
  tagKr: '01 / 문제 정의',
  titleEn: 'Conversations are breaking down\nacross generations.',
  titleKr: '세대 간 대화가\n끊어지고 있습니다.',
  bodyBuilder: (kr) => _ProblemBody(isKorean: kr),
);

final _popupThesis = PopupContent(
  tagEn: '02 / OUR THESIS',
  tagKr: '02 / 핵심 명제',
  titleEn: 'Better conversations start\nwith the right question.',
  titleKr: '더 좋은 소통은 더 좋은\n질문에서 시작됩니다.',
  bodyBuilder: (kr) => _ThesisBody(isKorean: kr),
);

final _popupRoadmap = PopupContent(
  tagEn: '03 / ROADMAP',
  tagKr: '03 / 로드맵',
  titleEn: "Where we're going.",
  titleKr: '우리는 어디로 갑니다.',
  bodyBuilder: (kr) => _RoadmapBody(isKorean: kr),
);

final _popupWhyNow = PopupContent(
  tagEn: '04 / WHY NOW',
  tagKr: '04 / 왜 지금인가',
  titleEn: 'The market is ready.',
  titleKr: '시장이 준비됐습니다.',
  bodyBuilder: (kr) => _WhyNowBody(isKorean: kr),
);

final _popupNowLive = PopupContent(
  tagEn: '05 / NOW LIVE',
  tagKr: '05 / 지금 바로',
  titleEn: 'TalkBingo is live.',
  titleKr: 'TalkBingo가 출시됐습니다.',
  bodyBuilder: (kr) => _NowLiveBody(isKorean: kr),
);

final _popupContact = PopupContent(
  tagEn: '06 / CONTACT',
  tagKr: '06 / 문의',
  titleEn: "Let's build the next conversation.",
  titleKr: '다음 대화를 함께 만듭니다.',
  bodyBuilder: (kr) => _ContactBody(isKorean: kr),
);

// ── Popup body widgets ────────────────────────────────────────────────────────

class _ProblemBody extends StatelessWidget {
  final bool isKorean;
  const _ProblemBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('63.2%', isKorean ? "한국인 중 '세대 간 소통이 잘 안 된다'고 응답" : "Koreans say generational communication has broken down", '한국행정연구원, 2022'),
      ('88%',   isKorean ? '세대 갈등이 심각하다고 인식' : 'See generational conflict as serious', '한국갤럽, 2026'),
      ('+16%p', isKorean ? '9년간 소통 단절 인식 증가 (2013→2022)' : 'Increase in perceived disconnection over 9 years', '한국행정연구원'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          isKorean
              ? '한국의 세대 단절은 더 이상 문화적 차이가 아닌, 측정 가능한 사회적 비용입니다.'
              : "Korea's generational divide is no longer just cultural — it's measurable, and it's widening.",
        ),
        const SizedBox(height: 20),
        ...stats.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _StatRow(num: s.$1, label: s.$2, source: s.$3),
            )),
      ],
    );
  }
}

class _ThesisBody extends StatelessWidget {
  final bool isKorean;
  const _ThesisBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final pillars = [
      ('Questions, not messages.', '메시지가 아니라 질문입니다.', 'The right question opens a conversation that any message would close.', '좋은 질문은 어떤 메시지도 열지 못할 대화를 엽니다.'),
      ('Designed, not random.', '우연이 아니라 설계입니다.', 'Great conversations don\'t happen by accident. They are engineered.', '훌륭한 대화는 우연히 이뤄지지 않습니다. 설계됩니다.'),
      ('Tech, not just talk.', '대화가 아니라 기술입니다.', 'CAMMUP builds the layer between people and AI that makes both smarter.', 'CAMMUP은 사람과 AI를 더 현명하게 만드는 레이어를 만듭니다.'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          isKorean
              ? 'CAMMUP은 인간과 AI 상호작용의 질문 설계 영역을 연구하고 개발합니다.'
              : 'CAMMUP researches and builds the question-engineering layer of human-AI interaction.',
        ),
        const SizedBox(height: 24),
        ...pillars.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _PillarRow(
                title: isKorean ? p.$2 : p.$1,
                body: isKorean ? p.$4 : p.$3,
              ),
            )),
      ],
    );
  }
}

class _RoadmapBody extends StatelessWidget {
  final bool isKorean;
  const _RoadmapBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final stages = [
      ('2026', 'Stage 1.0', 'TalkBingo', 'B2C · Consumer', '● LIVE', _C.pink,
          'A game-based chat platform for real conversation. Where empathy completes the line.',
          '공감이 빙고를 완성하는 게임 기반 대화 플랫폼.'),
      ('2027', 'Stage 2.0', 'Debate Platform for Class', 'B2B · Education', '● In Development', _C.navy,
          'AI-driven debate designed for the classroom. Where students learn to speak up.',
          '발언하는 법을 가르치는 AI 기반 토론 플랫폼.'),
      ('2028', 'Stage 3.0', 'Generational AI Mediator', 'B2B / Research', '○ R&D', _C.sage,
          'An AI that translates between generations. The interpreter for the modern family and workplace.',
          '세대 간 통역사가 되는 AI.'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          isKorean
              ? '3단계 연구·제품 로드맵. 각 단계가 다음 단계의 데이터와 질문 자산이 됩니다.'
              : 'A three-stage roadmap. Each stage compounds the data and questions for the next.',
        ),
        const SizedBox(height: 20),
        ...stages.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _RoadmapRow(
                year: s.$1,
                stage: s.$2,
                title: s.$3,
                type: s.$4,
                status: s.$5,
                accent: s.$6,
                desc: isKorean ? s.$8 : s.$7,
              ),
            )),
      ],
    );
  }
}

class _WhyNowBody extends StatelessWidget {
  final bool isKorean;
  const _WhyNowBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('\$25B', isKorean ? '글로벌 SEL 시장 규모 (2033 예상)' : 'Global SEL market by 2033', 'Market Data Forecast, 2025'),
      ('25%', isKorean ? '연평균 성장률 — 가장 빠르게 성장하는 에듀테크' : 'CAGR — fastest-growing edtech segment', 'Market Data Forecast, 2025'),
      ('APAC', isKorean ? '가장 빠르게 성장하는 지역 — 한국 포함' : 'Fastest-growing region — Korea included', 'MarketsandMarkets, 2024'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          isKorean
              ? 'SEL(사회·정서 학습)은 에듀테크에서 가장 빠르게 성장하는 영역이며, 그 중심에는 \'질문\'이 있습니다.'
              : "Social-Emotional Learning is the fastest-growing layer of education technology — and questions are at its core.",
        ),
        const SizedBox(height: 20),
        ...stats.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _StatRow(num: s.$1, label: s.$2, source: s.$3, accent: _C.dark),
            )),
      ],
    );
  }
}

class _NowLiveBody extends StatelessWidget {
  final bool isKorean;
  const _NowLiveBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final features = isKorean
        ? [
            ('게임처럼 즐겁게 시작하는 진짜 대화', '빙고 게임을 기반으로 AI가 생성한 질문으로 대화합니다.'),
            ('공감이 먼저인 규칙', '상대방의 답변에 공감해야만 빙고를 완성할 수 있습니다.'),
            ('나를 발견하는 시간', 'AI 질문에 답하다 보면 스스로 몰랐던 생각과 마음을 정리하게 됩니다.'),
          ]
        : [
            ('Game-based real conversation', 'Bingo gameplay powered by AI-generated questions.'),
            ('Empathy is the rule', 'You can only complete a bingo by genuinely reacting to your partner.'),
            ('Discover yourself', 'Answering AI questions helps you articulate thoughts you didn\'t know you had.'),
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _C.pink.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '● LIVE on iOS & Android',
            style: TextStyle(
              fontFamily: 'Alexandria',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _C.pink,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _bodyText(
          isKorean
              ? 'TalkBingo는 게임처럼 자연스럽게 진짜 대화를 이끌어내는 채팅 플랫폼입니다.'
              : 'TalkBingo is a chat platform that uses gameplay to naturally lead people into real conversations.',
        ),
        const SizedBox(height: 20),
        ...features.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _FeatureRow(title: f.$1, body: f.$2),
            )),
      ],
    );
  }
}

class _ContactBody extends StatelessWidget {
  final bool isKorean;
  const _ContactBody({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      (isKorean ? '투자 문의' : 'For Investors', 'invest@cammup.com', isKorean ? '투자 라운드, 전략적 파트너십' : 'Funding rounds, due diligence, strategic partnerships'),
      (isKorean ? '학교·파트너 문의' : 'For Schools & Partners', 'partners@cammup.com', isKorean ? '파일럿, 교실 도입, SEL 협력' : 'Pilots, classroom deployment, SEL collaboration'),
      (isKorean ? '미디어 문의' : 'For Press', 'press@cammup.com', isKorean ? '인터뷰, 보도 자료, 브랜드 에셋' : 'Interviews, press materials, brand assets'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          isKorean
              ? '투자자, 학교, 그리고 사람들의 소통 방식을 함께 설계할 파트너를 만나고 있습니다.'
              : "We're talking with investors, schools, and partners who want to design the future of how people communicate.",
        ),
        const SizedBox(height: 20),
        ...contacts.map((c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ContactRow(role: c.$1, email: c.$2, desc: c.$3),
            )),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared popup body sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

Widget _bodyText(String text) => Text(
      text,
      style: const TextStyle(
        fontFamily: 'Alexandria',
        fontFamilyFallback: ['EliceDigitalBaeum'],
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: _C.textSub,
      ),
    );

class _StatRow extends StatelessWidget {
  final String num, label, source;
  final Color accent;
  const _StatRow({required this.num, required this.label, required this.source, this.accent = _C.pink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: _C.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text(num, style: TextStyle(
            fontFamily: 'Alexandria',
            fontSize: 42,
            fontWeight: FontWeight.w400,
            color: accent,
            height: 1.0,
          )),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(
                  fontFamily: 'Alexandria',
                  fontFamilyFallback: ['EliceDigitalBaeum'],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _C.dark,
                )),
                const SizedBox(height: 2),
                Text(source, style: const TextStyle(
                  fontFamily: 'Alexandria',
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: _C.textMuted,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PillarRow extends StatelessWidget {
  final String title, body;
  const _PillarRow({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 6, right: 14),
          decoration: const BoxDecoration(color: _C.pink, shape: BoxShape.circle),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(
                fontFamily: 'Alexandria',
                fontFamilyFallback: ['EliceDigitalBaeum'],
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _C.dark,
              )),
              const SizedBox(height: 4),
              Text(body, style: const TextStyle(
                fontFamily: 'Alexandria',
                fontFamilyFallback: ['EliceDigitalBaeum'],
                fontSize: 14,
                color: _C.textSub,
                height: 1.6,
              )),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoadmapRow extends StatelessWidget {
  final String year, stage, title, type, status, desc;
  final Color accent;
  const _RoadmapRow({
    required this.year, required this.stage, required this.title,
    required this.type, required this.status, required this.desc,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: accent, width: 3)),
        color: accent.withOpacity(0.04),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(year, style: TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent,
              )),
              const SizedBox(width: 8),
              Text(stage, style: const TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 11,
                color: _C.textMuted,
              )),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status, style: TextStyle(
                  fontFamily: 'Alexandria',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: accent,
                )),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(
            fontFamily: 'Alexandria',
            fontFamilyFallback: ['EliceDigitalBaeum'],
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _C.dark,
          )),
          const SizedBox(height: 4),
          Text('$type   ·   $desc', style: const TextStyle(
            fontFamily: 'Alexandria',
            fontFamilyFallback: ['EliceDigitalBaeum'],
            fontSize: 13,
            color: _C.textSub,
            height: 1.5,
          )),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String title, body;
  const _FeatureRow({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(
          fontFamily: 'Alexandria',
          fontFamilyFallback: ['EliceDigitalBaeum'],
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: _C.dark,
        )),
        const SizedBox(height: 4),
        Text(body, style: const TextStyle(
          fontFamily: 'Alexandria',
          fontFamilyFallback: ['EliceDigitalBaeum'],
          fontSize: 14,
          color: _C.textSub,
          height: 1.6,
        )),
        const SizedBox(height: 4),
        Divider(color: _C.border, thickness: 1, height: 12),
      ],
    );
  }
}

class _ContactRow extends StatefulWidget {
  final String role, email, desc;
  const _ContactRow({required this.role, required this.email, required this.desc});

  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: _Mo.fast,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: _hovered ? _C.borderHvr : _C.border),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.role, style: const TextStyle(
                    fontFamily: 'Alexandria',
                    fontFamilyFallback: ['EliceDigitalBaeum'],
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _C.dark,
                  )),
                  const SizedBox(height: 2),
                  Text(widget.email, style: const TextStyle(
                    fontFamily: 'Alexandria',
                    fontSize: 13,
                    color: _C.pink,
                  )),
                  const SizedBox(height: 2),
                  Text(widget.desc, style: const TextStyle(
                    fontFamily: 'Alexandria',
                    fontFamilyFallback: ['EliceDigitalBaeum'],
                    fontSize: 12,
                    color: _C.textMuted,
                  )),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: _Mo.fast,
              opacity: _hovered ? 1.0 : 0.0,
              child: const Text('→', style: TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 18,
                color: _C.pink,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared micro-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _CloseBtn extends StatefulWidget {
  final VoidCallback onTap;
  const _CloseBtn({required this.onTap});

  @override
  State<_CloseBtn> createState() => _CloseBtnState();
}

class _CloseBtnState extends State<_CloseBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _Mo.fast,
          width: 32, height: 32,
          decoration: BoxDecoration(
            color: _hovered ? _C.border : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close, size: 18, color: _hovered ? _C.dark : _C.textMuted),
        ),
      ),
    );
  }
}

class _ChipBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _ChipBtn({required this.label, required this.onTap});

  @override
  State<_ChipBtn> createState() => _ChipBtnState();
}

class _ChipBtnState extends State<_ChipBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _Mo.fast,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? Colors.white : const Color(0x99FFFFFF),
            border: Border.all(color: _hovered ? _C.borderHvr : _C.border),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Alexandria',
              fontFamilyFallback: const ['EliceDigitalBaeum'],
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: _hovered ? _C.dark : _C.textSub,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _Mo.fast,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? _C.dark : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Alexandria',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _C.dark,
            ),
          ),
        ),
      ),
    );
  }
}

class _LangToggle extends StatefulWidget {
  final bool isKorean;
  final VoidCallback onToggle;
  const _LangToggle({required this.isKorean, required this.onToggle});

  @override
  State<_LangToggle> createState() => _LangToggleState();
}

class _LangToggleState extends State<_LangToggle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onToggle,
        child: AnimatedOpacity(
          duration: _Mo.fast,
          opacity: _hovered ? 0.65 : 1.0,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _C.dark,
              ),
              children: [
                TextSpan(
                  text: 'EN',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w400 : FontWeight.w700,
                    color: widget.isKorean ? _C.textMuted : _C.dark,
                  ),
                ),
                const TextSpan(text: ' / ', style: TextStyle(color: _C.textMuted)),
                TextSpan(
                  text: 'KR',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w700 : FontWeight.w400,
                    color: widget.isKorean ? _C.dark : _C.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CTAButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _CTAButton({required this.label, required this.onTap});

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _Mo.fast,
          transform: _hovered ? (Matrix4.identity()..scale(1.03)) : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _C.dark,
            borderRadius: BorderRadius.circular(18),
            boxShadow: _hovered
                ? [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 3))]
                : [],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Alexandria',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
