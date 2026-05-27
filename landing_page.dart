// ============================================================================
// CAMMUP Company Website — Landing Page (Full Interactions)
//
// 구조:
//   - PageView (vertical) 로 7섹션 스냅 스크롤
//   - ValueNotifier<int> 로 현재 섹션 트래킹 (전체 rebuild 없이)
//   - ValueNotifier<bool> 로 EN/KR 언어 토글
//   - 오른쪽 nav dots (클릭 시 해당 섹션으로 이동)
//   - MouseRegion + AnimatedContainer 호버 효과
//   - AnimationController 섹션 진입 페이드 인
//
// 사용:
//   MaterialApp(
//     theme: ThemeData(fontFamily: 'Alexandria'),
//     home: const LandingPage(),
//   )
// ============================================================================

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// ─────────────────────────────────────────────────────────────────────────────
// Design Tokens (인라인 — 별도 패키지 불필요)
// ─────────────────────────────────────────────────────────────────────────────

class _C {
  // Backgrounds
  static const surface = Color(0xFFFFFDFB);
  static const dark = Color(0xFF211C19);
  static const glassWhite = Color(0x33FFFDFB);

  // Text
  static const textPrimary = Color(0xFF211C19);
  static const textSecondary = Color(0xFF6B6159);
  static const textMuted = Color(0xFF9A8E83);
  static const textOnDark = Color(0xFFFFFFFF);

  // Accent
  static const pink = Color(0xFFFF0051);
  static const pinkSubtle = Color(0xFFFFE5EE);
  static const navy = Color(0xFF1E2A44);

  // Border
  static const border = Color(0xFFEDE5DB);
  static const borderStrong = Color(0xFFD9CFC2);

  // Stat card background (dark sections)
  static const cardDark = Color(0xFF2E2620);
}

class _T {
  static const _latin = 'Alexandria';
  static const _fallback = ['EliceDigitalBaeum', 'sans-serif'];

  static const displayDesktop = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 80, fontWeight: FontWeight.w400, height: 1.1,
    color: _C.textPrimary,
  );
  static const displayTablet = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 56, fontWeight: FontWeight.w400, height: 1.1,
    color: _C.textPrimary,
  );
  static const displayMobile = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 36, fontWeight: FontWeight.w400, height: 1.15,
    color: _C.textPrimary,
  );
  static const h1 = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 48, fontWeight: FontWeight.w600, height: 1.15,
    color: _C.textPrimary,
  );
  static const h2 = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 36, fontWeight: FontWeight.w600, height: 1.2,
    color: _C.textPrimary,
  );
  static const h3 = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 28, fontWeight: FontWeight.w600, height: 1.2,
    color: _C.textPrimary,
  );
  static const bodyLarge = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 22, fontWeight: FontWeight.w400, height: 1.5,
    color: _C.textPrimary,
  );
  static const body = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 16, fontWeight: FontWeight.w400, height: 1.6,
    color: _C.textPrimary,
  );
  static const label = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 14, fontWeight: FontWeight.w500, height: 1.4,
    color: _C.textPrimary,
  );
  static const labelSmall = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 12, fontWeight: FontWeight.w500, height: 1.4,
    color: _C.textSecondary,
  );
  static const chip = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 10, fontWeight: FontWeight.w500, height: 1.4,
    color: _C.textSecondary,
  );
  static const button = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 12, fontWeight: FontWeight.w500, height: 1.0,
    color: _C.textOnDark,
  );
  static const stat = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 96, fontWeight: FontWeight.w400, height: 1.0,
    color: _C.textPrimary,
  );
  static const statDark = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 80, fontWeight: FontWeight.w400, height: 1.0,
    color: _C.textOnDark,
  );
  static const sectionTag = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 11, fontWeight: FontWeight.w500, height: 1.0,
    color: _C.pink, letterSpacing: 1.5,
  );
  static const timeline = TextStyle(
    fontFamily: _latin, fontFamilyFallback: _fallback,
    fontSize: 13, fontWeight: FontWeight.w400, height: 1.6,
    color: _C.textSecondary,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Section definitions
// ─────────────────────────────────────────────────────────────────────────────

class _Section {
  final String id;
  final String labelEn;
  final String labelKr;
  final bool isDark;
  const _Section(this.id, this.labelEn, this.labelKr, {this.isDark = false});
}

const _sections = [
  _Section('hero',     'Hero',         '홈',             isDark: false),
  _Section('problem',  'The Problem',  '문제 정의',       isDark: false),
  _Section('thesis',   'Our Thesis',   '핵심 명제',       isDark: true),
  _Section('roadmap',  'Roadmap',      '로드맵',          isDark: false),
  _Section('products', 'Products',     '제품',            isDark: false),
  _Section('whynow',   'Why Now',      '왜 지금인가',      isDark: true),
  _Section('contact',  'Contact',      '문의',            isDark: false),
];

// ─────────────────────────────────────────────────────────────────────────────
// Main Page
// ─────────────────────────────────────────────────────────────────────────────

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final PageController _pageCtrl;
  final _currentSection = ValueNotifier<int>(0);
  final _isKorean = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController();
    _pageCtrl.addListener(() {
      final page = _pageCtrl.page?.round() ?? 0;
      if (_currentSection.value != page) {
        _currentSection.value = page;
      }
    });
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    _currentSection.dispose();
    _isKorean.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    _pageCtrl.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _C.surface,
      body: Stack(
        children: [
          // ── 7 sections (snap-scroll) ───────────────────────────────────────
          PageView.builder(
            controller: _pageCtrl,
            scrollDirection: Axis.vertical,
            itemCount: _sections.length,
            itemBuilder: (ctx, i) => _SectionPage(
              index: i,
              isKorean: _isKorean,
              onNavTap: _goTo,
            ),
          ),

          // ── Sticky Nav ────────────────────────────────────────────────────
          ValueListenableBuilder<int>(
            valueListenable: _currentSection,
            builder: (_, sectionIdx, __) => _StickyNav(
              currentSection: sectionIdx,
              isKorean: _isKorean,
              onNavTap: _goTo,
            ),
          ),

          // ── Section Dots (right edge) ─────────────────────────────────────
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: ValueListenableBuilder<int>(
                valueListenable: _currentSection,
                builder: (_, current, __) => _NavDots(
                  current: current,
                  onTap: _goTo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sticky Navigation Bar
// ─────────────────────────────────────────────────────────────────────────────

class _StickyNav extends StatelessWidget {
  final int currentSection;
  final ValueNotifier<bool> isKorean;
  final ValueCallback onNavTap;

  const _StickyNav({
    required this.currentSection,
    required this.isKorean,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = _sections[currentSection].isDark;
    final textColor = isDark ? _C.textOnDark : _C.textPrimary;
    final glassColor = isDark
        ? const Color(0x33211C19)
        : _C.glassWhite;

    return Positioned(
      top: 0, left: 0, right: 0,
      child: _GlassBar(
        color: glassColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => onNavTap(0),
                  child: Text(
                    'CAMMUP',
                    style: _T.h3.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),

                // Center nav links
                const Spacer(),
                _NavLink(label: 'Company', color: textColor, onTap: () => onNavTap(0)),
                const SizedBox(width: 48),
                _NavLink(label: 'Vision', color: textColor, onTap: () => onNavTap(2)),
                const SizedBox(width: 48),
                _NavLink(label: 'Brand', color: textColor, onTap: () => onNavTap(4)),
                const SizedBox(width: 48),
                _NavLink(label: 'Contact', color: textColor, onTap: () => onNavTap(6)),
                const Spacer(),

                // Right: EN/KR + CTA
                ValueListenableBuilder<bool>(
                  valueListenable: isKorean,
                  builder: (_, kr, __) => _LangToggle(
                    isKorean: kr,
                    color: textColor,
                    onToggle: () => isKorean.value = !isKorean.value,
                  ),
                ),
                const SizedBox(width: 16),
                _CTAButton(
                  label: 'Get in touch',
                  isDark: isDark,
                  onTap: () => onNavTap(6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nav Link with underline hover
// ─────────────────────────────────────────────────────────────────────────────

class _NavLink extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.color, required this.onTap});

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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? widget.color : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: _T.label.copyWith(color: widget.color),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// EN / KR Language Toggle
// ─────────────────────────────────────────────────────────────────────────────

class _LangToggle extends StatefulWidget {
  final bool isKorean;
  final Color color;
  final VoidCallback onToggle;
  const _LangToggle({required this.isKorean, required this.color, required this.onToggle});

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
          duration: const Duration(milliseconds: 150),
          opacity: _hovered ? 0.7 : 1.0,
          child: RichText(
            text: TextSpan(
              style: _T.labelSmall.copyWith(color: widget.color),
              children: [
                TextSpan(
                  text: 'EN',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w400 : FontWeight.w700,
                    color: widget.isKorean ? widget.color.withOpacity(0.5) : widget.color,
                  ),
                ),
                const TextSpan(text: ' / '),
                TextSpan(
                  text: 'KR',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w700 : FontWeight.w400,
                    color: widget.isKorean ? widget.color : widget.color.withOpacity(0.5),
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

// ─────────────────────────────────────────────────────────────────────────────
// CTA Button with hover
// ─────────────────────────────────────────────────────────────────────────────

class _CTAButton extends StatefulWidget {
  final String label;
  final bool isDark;
  final VoidCallback onTap;
  const _CTAButton({required this.label, required this.isDark, required this.onTap});

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.isDark ? _C.textOnDark : _C.textPrimary;
    final fg = widget.isDark ? _C.textPrimary : _C.textOnDark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: _hovered
              ? (Matrix4.identity()..scale(1.03))
              : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(18),
            boxShadow: _hovered
                ? [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 3))]
                : [],
          ),
          child: Text(label, style: _T.button.copyWith(color: fg)),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Dots (right-side indicator)
// ─────────────────────────────────────────────────────────────────────────────

class _NavDots extends StatelessWidget {
  final int current;
  final ValueCallback onTap;
  const _NavDots({required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_sections.length, (i) {
        final isActive = i == current;
        return GestureDetector(
          onTap: () => onTap(i),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isActive ? 6 : 4,
                height: isActive ? 6 : 4,
                decoration: BoxDecoration(
                  color: isActive ? _C.pink : _C.textMuted.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Page wrapper (fade-in animation on enter)
// ─────────────────────────────────────────────────────────────────────────────

class _SectionPage extends StatefulWidget {
  final int index;
  final ValueNotifier<bool> isKorean;
  final ValueCallback onNavTap;

  const _SectionPage({
    required this.index,
    required this.isKorean,
    required this.onNavTap,
  });

  @override
  State<_SectionPage> createState() => _SectionPageState();
}

class _SectionPageState extends State<_SectionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: ValueListenableBuilder<bool>(
          valueListenable: widget.isKorean,
          builder: (_, kr, __) => _buildSection(context, kr),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, bool kr) {
    switch (widget.index) {
      case 0: return _HeroSection(isKorean: kr, onNavTap: widget.onNavTap);
      case 1: return _ProblemSection(isKorean: kr);
      case 2: return _ThesisSection(isKorean: kr);
      case 3: return _RoadmapSection(isKorean: kr, onNavTap: widget.onNavTap);
      case 4: return _ProductsSection(isKorean: kr);
      case 5: return _WhyNowSection(isKorean: kr);
      case 6: return _ContactSection(isKorean: kr);
      default: return const SizedBox.shrink();
    }
  }
}

typedef ValueCallback = void Function(int);

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 01 — HERO
// ─────────────────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  final bool isKorean;
  final ValueCallback onNavTap;

  const _HeroSection({required this.isKorean, required this.onNavTap});

  static const _chipLabels = [
    ('01 / The Problem', '01 / 문제 정의'),
    ('02 / Our Thesis',  '02 / 핵심 명제'),
    ('03 / Roadmap',     '03 / 로드맵'),
    ('04 / Why Now',     '04 / 왜 지금인가'),
    ('05 / Now Live',    '05 / 지금 바로'),
    ('06 / Contact',     '06 / 문의'),
  ];

  static const _chipSections = [1, 2, 3, 5, 4, 6];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;
    final displayStyle = isDesktop ? _T.displayDesktop : _T.displayTablet;

    return Container(
      color: _C.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60 : 24, vertical: 20),
        child: Column(
          children: [
            // spacer for nav bar
            const SizedBox(height: 77),

            // Main headline
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isKorean ? '질문이 기술이 되는 곳,' : 'A technology',
                      textAlign: TextAlign.center,
                      style: displayStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isKorean ? '캠업입니다.' : 'for meaningful conversation.',
                      textAlign: TextAlign.center,
                      style: displayStyle,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      isKorean
                          ? 'We build the technology of questions.'
                          : '진심이 닿는 소통을 설계합니다.',
                      textAlign: TextAlign.center,
                      style: _T.bodyLarge.copyWith(
                        color: const Color(0xFF1880AC),
                        fontSize: isDesktop ? 22 : 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Section nav chips
            Row(
              children: List.generate(_chipLabels.length, (i) {
                final (en, kr) = _chipLabels[i];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _ChipBtn(
                      label: isKorean ? kr : en,
                      onTap: () => onNavTap(_chipSections[i]),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 02 — THE PROBLEM
// ─────────────────────────────────────────────────────────────────────────────

class _ProblemSection extends StatelessWidget {
  final bool isKorean;
  const _ProblemSection({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      color: _C.surface,
      child: Padding(
        padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 40),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 4, child: _ProblemLeft(isKorean: isKorean)),
                  const SizedBox(width: 60),
                  Expanded(flex: 6, child: _ProblemStats(isKorean: isKorean)),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProblemLeft(isKorean: isKorean),
                    const SizedBox(height: 40),
                    _ProblemStats(isKorean: isKorean),
                  ],
                ),
              ),
      ),
    );
  }
}

class _ProblemLeft extends StatelessWidget {
  final bool isKorean;
  const _ProblemLeft({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isKorean ? '01 / 문제 정의' : '01 / THE PROBLEM',
          style: _T.sectionTag,
        ),
        const SizedBox(height: 24),
        Text(
          isKorean
              ? '세대 간 대화가\n끊어지고 있습니다.'
              : 'Conversations are breaking down\nacross generations.',
          style: _T.h1.copyWith(fontSize: 40, height: 1.2),
        ),
        const SizedBox(height: 16),
        Text(
          isKorean
              ? '한국의 세대 단절은 더 이상 문화적 차이가\n아닌, 측정 가능한 사회적 비용입니다.'
              : "Korea's generational divide is no longer just\ncultural — it's measurable, and it's widening.",
          style: _T.body.copyWith(color: _C.textSecondary, height: 1.7),
        ),
      ],
    );
  }
}

class _ProblemStats extends StatelessWidget {
  final bool isKorean;
  const _ProblemStats({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatData(
        num: '63.2%',
        en: 'say generational communication\nhas broken down',
        kr: "한국인 중 '세대 간 소통이 잘 안 된다'고 응답",
        source: '한국행정연구원, 2022',
      ),
      _StatData(
        num: '88%',
        en: 'see generational conflict\nas serious',
        kr: '세대 갈등이 심각하다고 인식',
        source: '한국갤럽, 2026',
      ),
      _StatData(
        num: '+16%p',
        en: 'increase in perceived disconnection\nin 9 years',
        kr: '9년간 소통 단절 인식 증가 (2013→2022)',
        source: '한국행정연구원',
        accent: true,
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stats
          .map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _StatCard(data: s, isKorean: isKorean),
              ))
          .toList(),
    );
  }
}

class _StatData {
  final String num, en, kr, source;
  final bool accent;
  const _StatData({
    required this.num,
    required this.en,
    required this.kr,
    required this.source,
    this.accent = false,
  });
}

class _StatCard extends StatefulWidget {
  final _StatData data;
  final bool isKorean;
  const _StatCard({required this.data, required this.isKorean});

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _C.surface,
          border: Border.all(
            color: _hovered ? _C.borderStrong : _C.border,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered
              ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.data.num,
              style: _T.stat.copyWith(
                color: widget.data.accent ? _C.pink : _C.textPrimary,
                fontSize: 64,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isKorean ? widget.data.kr : widget.data.en,
                    style: _T.body.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data.source,
                    style: _T.labelSmall.copyWith(
                      fontStyle: FontStyle.italic,
                      color: _C.textMuted,
                    ),
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

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 03 — OUR THESIS (dark)
// ─────────────────────────────────────────────────────────────────────────────

class _ThesisSection extends StatelessWidget {
  final bool isKorean;
  const _ThesisSection({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    const pillars = [
      ('Questions, not messages.', '메시지가 아니라 질문입니다.'),
      ('Designed, not random.', '우연이 아니라 설계입니다.'),
      ('Tech, not just talk.', '대화가 아니라 기술입니다.'),
    ];

    return Container(
      color: _C.dark,
      child: Padding(
        padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isKorean ? '02 / 핵심 명제' : '02 / OUR THESIS',
              style: _T.sectionTag,
            ),
            const SizedBox(height: 40),
            Text(
              isKorean
                  ? '더 좋은 소통은 더 좋은\n질문에서 시작됩니다.'
                  : 'Better conversations start\nwith the right question.',
              textAlign: TextAlign.center,
              style: _T.displayDesktop.copyWith(
                color: _C.textOnDark,
                fontSize: isDesktop ? 64 : 40,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isKorean
                  ? 'Better conversations start with the right question.'
                  : '더 좋은 소통은 더 좋은 질문에서 시작됩니다.',
              textAlign: TextAlign.center,
              style: _T.bodyLarge.copyWith(
                color: _C.textOnDark.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 64),

            // Three pillars
            isDesktop
                ? Row(
                    children: pillars
                        .map((p) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: _PillarCard(
                                  en: p.$1,
                                  kr: p.$2,
                                  isKorean: isKorean,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Column(
                    children: pillars
                        .map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _PillarCard(en: p.$1, kr: p.$2, isKorean: isKorean),
                            ))
                        .toList(),
                  ),

            const SizedBox(height: 48),
            Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                isKorean
                    ? 'CAMMUP은 인간과 AI 상호작용의 "질문 설계" 영역을\n연구하고 개발합니다. 우리는 채팅 앱이 아닌, 그 안의 질문을 만듭니다.'
                    : 'CAMMUP researches and builds the question-engineering layer\nof human-AI interaction. We don\'t build chat apps. We build the questions inside them.',
                textAlign: TextAlign.center,
                style: _T.body.copyWith(color: _C.textOnDark.withOpacity(0.6), height: 1.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PillarCard extends StatefulWidget {
  final String en, kr;
  final bool isKorean;
  const _PillarCard({required this.en, required this.kr, required this.isKorean});

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? const Color(0xFF2E2620) : const Color(0xFF1A1612),
          border: Border.all(
            color: _hovered ? _C.pink.withOpacity(0.4) : Colors.white.withOpacity(0.08),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _C.pink, width: 1.5),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.isKorean ? widget.kr : widget.en,
              style: _T.h3.copyWith(color: _C.textOnDark, fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              widget.isKorean ? widget.en : widget.kr,
              style: _T.body.copyWith(color: _C.textOnDark.withOpacity(0.4), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 04 — ROADMAP
// ─────────────────────────────────────────────────────────────────────────────

class _RoadmapSection extends StatelessWidget {
  final bool isKorean;
  final ValueCallback onNavTap;
  const _RoadmapSection({required this.isKorean, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      color: _C.surface,
      child: Padding(
        padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isKorean ? '03 / 로드맵' : '03 / ROADMAP',
              style: _T.sectionTag,
            ),
            const SizedBox(height: 24),
            Text(
              isKorean ? '우리는 어디로 갑니다.' : "Where we're going.",
              style: _T.h1.copyWith(fontSize: 48),
            ),
            const SizedBox(height: 8),
            Text(
              isKorean
                  ? '3단계 연구·제품 로드맵. 각 단계가 다음 단계의 데이터와 질문 자산이 됩니다.'
                  : 'A three-stage roadmap. Each stage compounds the data and questions for the next.',
              style: _T.body.copyWith(color: _C.textSecondary),
            ),
            const SizedBox(height: 48),

            // Timeline
            Expanded(
              child: isDesktop
                  ? _HorizontalTimeline(isKorean: isKorean, onNavTap: onNavTap)
                  : _VerticalTimeline(isKorean: isKorean, onNavTap: onNavTap),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoadmapStageData {
  final String year, title, type, status;
  final String descEn, descKr;
  final Color accent;
  final String cta;
  final bool isLive;
  const _RoadmapStageData({
    required this.year, required this.title, required this.type,
    required this.status, required this.descEn, required this.descKr,
    required this.accent, required this.cta, this.isLive = false,
  });
}

const _roadmapData = [
  _RoadmapStageData(
    year: '2026', title: 'TalkBingo', type: 'B2C', status: '● LIVE',
    descEn: 'A game-based chat platform for real conversation. Where empathy completes the line.',
    descKr: '공감이 빙고를 완성하는 게임 기반 대화 플랫폼.',
    accent: _C.pink, cta: 'Visit page →', isLive: true,
  ),
  _RoadmapStageData(
    year: '2027', title: 'Debate Platform for Class', type: 'B2B · Education', status: '● IN DEV',
    descEn: 'AI-driven debate, designed for the classroom.',
    descKr: '발언하는 법을 가르치는 AI 토론 플랫폼.',
    accent: _C.navy, cta: 'Preview →',
  ),
  _RoadmapStageData(
    year: '2028', title: 'Generational AI Mediator', type: 'B2B / Research', status: '○ R&D',
    descEn: 'An AI that translates between generations.',
    descKr: '세대 간 통역사가 되는 AI.',
    accent: const Color(0xFF6B8F71), cta: 'Learn more →',
  ),
];

class _HorizontalTimeline extends StatelessWidget {
  final bool isKorean;
  final ValueCallback onNavTap;
  const _HorizontalTimeline({required this.isKorean, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Year labels + line + dots
        SizedBox(
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Horizontal line
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(height: 1, color: _C.borderStrong),
                ),
              ),
              // Dots + labels
              Row(
                children: List.generate(_roadmapData.length, (i) {
                  final d = _roadmapData[i];
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(d.year, style: _T.label.copyWith(color: d.accent, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        Container(
                          width: 12, height: 12,
                          decoration: BoxDecoration(
                            color: d.isLive ? d.accent : _C.surface,
                            border: Border.all(color: d.accent, width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Stage cards
        Expanded(
          child: Row(
            children: _roadmapData.asMap().entries.map((e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _StageCard(data: e.value, isKorean: isKorean),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class _VerticalTimeline extends StatelessWidget {
  final bool isKorean;
  final ValueCallback onNavTap;
  const _VerticalTimeline({required this.isKorean, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _roadmapData.map((d) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _StageCard(data: d, isKorean: isKorean),
        )).toList(),
      ),
    );
  }
}

class _StageCard extends StatefulWidget {
  final _RoadmapStageData data;
  final bool isKorean;
  const _StageCard({required this.data, required this.isKorean});

  @override
  State<_StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<_StageCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _C.surface,
          border: Border.all(
            color: _hovered ? d.accent : _C.border,
            width: _hovered ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered
              ? [BoxShadow(color: d.accent.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: d.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(d.status, style: _T.labelSmall.copyWith(color: d.accent)),
                ),
                const Spacer(),
                Text(d.type, style: _T.labelSmall),
              ],
            ),
            const SizedBox(height: 16),
            Text(d.title, style: _T.h3.copyWith(fontSize: 24)),
            const SizedBox(height: 8),
            Text(
              widget.isKorean ? d.descKr : d.descEn,
              style: _T.body.copyWith(color: _C.textSecondary, fontSize: 14),
            ),
            const SizedBox(height: 16),
            _TextCTA(label: d.cta, color: d.accent),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 05 — PRODUCTS
// ─────────────────────────────────────────────────────────────────────────────

class _ProductsSection extends StatelessWidget {
  final bool isKorean;
  const _ProductsSection({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return Container(
      color: _C.surface,
      child: Padding(
        padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isKorean ? '04 / 제품' : '04 / PRODUCTS',
              style: _T.sectionTag,
            ),
            const SizedBox(height: 16),
            Text(
              isKorean ? '지금까지 만든 것.' : "What we've built so far.",
              style: _T.h1.copyWith(fontSize: 48),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _ProductCard(
                      accentColor: _C.pinkSubtle,
                      accentTextColor: _C.pink,
                      title: 'TalkBingo',
                      status: '● Live · B2C',
                      taglineEn: 'Game-based communication.\nEmpathy is the rule that completes the line.',
                      taglineKr: '공감으로 완성되는 게임 기반 대화.',
                      tags: isKorean
                          ? ['AI 질문 생성', '공감 기반 게임플레이', 'iOS · Android']
                          : ['AI-generated questions', 'Empathy-driven gameplay', 'iOS · Android'],
                      cta: isKorean ? '방문하기 →' : 'Visit page →',
                      isKorean: isKorean,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _ProductCard(
                      accentColor: _C.navy,
                      accentTextColor: Colors.white,
                      title: 'Debate Platform for Class',
                      status: '○ In development · B2B',
                      taglineEn: 'Where students learn by speaking, not by being told.',
                      taglineKr: '강요가 아닌, 발언으로 배우는 교실.',
                      tags: isKorean
                          ? ['AI 토론 주제', '턴 기반 진행', 'SEL 통합']
                          : ['AI debate prompts', 'Turn-based flow', 'SEL-integrated'],
                      cta: isKorean ? '미리 보기 →' : 'Preview →',
                      isKorean: isKorean,
                      ctaOutline: true,
                    ),
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

class _ProductCard extends StatefulWidget {
  final Color accentColor, accentTextColor;
  final String title, status, taglineEn, taglineKr, cta;
  final List<String> tags;
  final bool isKorean, ctaOutline;

  const _ProductCard({
    required this.accentColor,
    required this.accentTextColor,
    required this.title,
    required this.status,
    required this.taglineEn,
    required this.taglineKr,
    required this.tags,
    required this.cta,
    required this.isKorean,
    this.ctaOutline = false,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border.all(color: _hovered ? _C.borderStrong : _C.border),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered
              ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Row(
            children: [
              // Left accent panel
              Container(
                width: isDesktop ? 240 : 100,
                color: widget.accentColor,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: _T.h3.copyWith(
                        color: widget.accentTextColor,
                        fontSize: isDesktop ? 24 : 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.status,
                        style: _T.labelSmall.copyWith(
                          color: widget.accentTextColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Right content
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isKorean ? widget.taglineKr : widget.taglineEn,
                        style: _T.h3.copyWith(fontSize: 20, height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8, runSpacing: 8,
                        children: widget.tags.map((t) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _C.surface,
                            border: Border.all(color: _C.border),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(t, style: _T.labelSmall),
                        )).toList(),
                      ),
                      const SizedBox(height: 16),
                      widget.ctaOutline
                          ? _OutlineBtn(label: widget.cta, color: _C.navy)
                          : _FilledBtn(label: widget.cta),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 06 — WHY NOW (dark)
// ─────────────────────────────────────────────────────────────────────────────

class _WhyNowSection extends StatelessWidget {
  final bool isKorean;
  const _WhyNowSection({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    const stats = [
      _WhyData(
        num: '\$25B',
        en: 'Global SEL market by 2033',
        kr: '글로벌 SEL 시장 규모 (2033 예상)',
        source: 'Market Data Forecast, 2025',
      ),
      _WhyData(
        num: '25%',
        en: 'CAGR — fastest-growing edtech segment',
        kr: '연평균 성장률 — 가장 빠르게 성장하는 에듀테크',
        source: 'Market Data Forecast, 2025',
      ),
      _WhyData(
        num: 'APAC',
        en: 'Fastest-growing region — Korea included',
        kr: '가장 빠르게 성장하는 지역 — 한국 포함',
        source: 'MarketsandMarkets, 2024',
      ),
    ];

    return Container(
      color: _C.dark,
      child: Padding(
        padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isKorean ? '05 / 왜 지금인가' : '05 / WHY NOW',
              style: _T.sectionTag,
            ),
            const SizedBox(height: 32),
            Text(
              isKorean ? '시장이 준비됐습니다.' : 'The market is ready.',
              style: _T.h1.copyWith(color: _C.textOnDark, fontSize: isDesktop ? 56 : 36),
            ),
            const SizedBox(height: 48),
            isDesktop
                ? Row(
                    children: stats.map((s) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _WhyCard(data: s, isKorean: isKorean),
                      ),
                    )).toList(),
                  )
                : Column(
                    children: stats.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _WhyCard(data: s, isKorean: isKorean),
                    )).toList(),
                  ),
            const SizedBox(height: 40),
            Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                isKorean
                    ? 'SEL(사회·정서 학습)은 에듀테크에서 가장 빠르게 성장하는 영역이며,\n그 중심에는 \'질문\'이 있습니다.'
                    : 'Social-Emotional Learning is the fastest-growing layer of education technology\n— and questions are at its core.',
                textAlign: TextAlign.center,
                style: _T.body.copyWith(
                  color: _C.pink, fontStyle: FontStyle.italic, height: 1.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WhyData {
  final String num, en, kr, source;
  const _WhyData({required this.num, required this.en, required this.kr, required this.source});
}

class _WhyCard extends StatefulWidget {
  final _WhyData data;
  final bool isKorean;
  const _WhyCard({required this.data, required this.isKorean});

  @override
  State<_WhyCard> createState() => _WhyCardState();
}

class _WhyCardState extends State<_WhyCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          border: Border.all(
            color: _hovered ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(4),
          color: _hovered ? const Color(0xFF2E2620) : Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.num,
              style: _T.statDark.copyWith(fontSize: 72, color: _C.textOnDark),
            ),
            const SizedBox(height: 12),
            Text(
              widget.isKorean ? widget.data.kr : widget.data.en,
              style: _T.body.copyWith(color: _C.textOnDark, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              widget.data.source,
              style: _T.labelSmall.copyWith(
                color: _C.textOnDark.withOpacity(0.4),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION 07 — CONTACT
// ─────────────────────────────────────────────────────────────────────────────

class _ContactSection extends StatelessWidget {
  final bool isKorean;
  const _ContactSection({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 1024;

    const contacts = [
      _ContactData(
        roleEn: 'For Investors', roleKr: '투자 문의',
        email: 'invest@cammup.com',
        descEn: 'Funding rounds, due diligence, strategic partnerships',
        descKr: '투자 라운드, 실사, 전략적 파트너십',
      ),
      _ContactData(
        roleEn: 'For Schools & Partners', roleKr: '학교·파트너 문의',
        email: 'partners@cammup.com',
        descEn: 'Pilots, classroom deployment, SEL collaboration',
        descKr: '파일럿, 교실 도입, SEL 협력',
      ),
      _ContactData(
        roleEn: 'For Press', roleKr: '미디어 문의',
        email: 'press@cammup.com',
        descEn: 'Interviews, press materials, brand assets',
        descKr: '인터뷰, 보도 자료, 브랜드 에셋',
      ),
    ];

    return Container(
      color: _C.surface,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(isDesktop ? 60 : 24, 100, isDesktop ? 60 : 24, 40),
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 5, child: _ContactLeft(isKorean: isKorean)),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: contacts.map((c) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _ContactCard(data: c, isKorean: isKorean),
                            )).toList(),
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ContactLeft(isKorean: isKorean),
                          const SizedBox(height: 40),
                          ...contacts.map((c) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _ContactCard(data: c, isKorean: isKorean),
                          )),
                        ],
                      ),
                    ),
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: _C.border)),
            ),
            child: Row(
              children: [
                Text('CAMMUP', style: _T.label.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(width: 12),
                Text('Human Interaction Platform', style: _T.labelSmall),
                const Spacer(),
                Text('© 2026 CAMMUPLABS, Inc.', style: _T.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactLeft extends StatelessWidget {
  final bool isKorean;
  const _ContactLeft({required this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isKorean ? '06 / 문의' : '06 / CONTACT',
          style: _T.sectionTag,
        ),
        const SizedBox(height: 24),
        Text(
          isKorean ? '다음 대화를\n함께 만듭니다.' : "Let's build the\nnext conversation.",
          style: _T.h1.copyWith(fontSize: 48, height: 1.15),
        ),
        const SizedBox(height: 16),
        Text(
          isKorean
              ? '투자자, 학교, 그리고 사람들의 소통 방식을\n함께 설계할 파트너를 만나고 있습니다.'
              : "We're talking with investors, schools, and partners\nwho want to design the future of how people communicate.",
          style: _T.body.copyWith(color: _C.textSecondary, height: 1.7),
        ),
      ],
    );
  }
}

class _ContactData {
  final String roleEn, roleKr, email, descEn, descKr;
  const _ContactData({
    required this.roleEn, required this.roleKr, required this.email,
    required this.descEn, required this.descKr,
  });
}

class _ContactCard extends StatefulWidget {
  final _ContactData data;
  final bool isKorean;
  const _ContactCard({required this.data, required this.isKorean});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _hovered ? _C.borderStrong : _C.border,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered
              ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 4))]
              : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isKorean ? widget.data.roleKr : widget.data.roleEn,
                    style: _T.label.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data.email,
                    style: _T.body.copyWith(color: _C.pink, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.isKorean ? widget.data.descKr : widget.data.descEn,
                    style: _T.labelSmall.copyWith(color: _C.textMuted),
                  ),
                ],
              ),
            ),
            // Copy email button (visible on hover)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: _hovered ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () async {
                  // In Flutter web: use Clipboard.setData
                  setState(() => _copied = true);
                  await Future.delayed(const Duration(seconds: 2));
                  if (mounted) setState(() => _copied = false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _C.surface,
                    border: Border.all(color: _C.border),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _copied ? '✓ Copied' : 'Copy email',
                    style: _T.labelSmall.copyWith(
                      color: _copied ? _C.pink : _C.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared reusable micro-components
// ─────────────────────────────────────────────────────────────────────────────

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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFFFFFFFF)
                : const Color(0x99FFFFFF),
            border: Border.all(color: _hovered ? _C.borderStrong : _C.border),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: _T.chip.copyWith(
              color: _hovered ? _C.textPrimary : _C.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _TextCTA extends StatefulWidget {
  final String label;
  final Color color;
  const _TextCTA({required this.label, required this.color});

  @override
  State<_TextCTA> createState() => _TextCTAState();
}

class _TextCTAState extends State<_TextCTA> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: _hovered
            ? (Matrix4.identity()..translate(4.0, 0.0))
            : Matrix4.identity(),
        child: Text(
          widget.label,
          style: _T.label.copyWith(
            color: widget.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _FilledBtn extends StatefulWidget {
  final String label;
  const _FilledBtn({required this.label});

  @override
  State<_FilledBtn> createState() => _FilledBtnState();
}

class _FilledBtnState extends State<_FilledBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: _hovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _C.textPrimary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(widget.label, style: _T.button),
        ),
      ),
    );
  }
}

class _OutlineBtn extends StatefulWidget {
  final String label;
  final Color color;
  const _OutlineBtn({required this.label, required this.color});

  @override
  State<_OutlineBtn> createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<_OutlineBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered ? widget.color.withOpacity(0.08) : Colors.transparent,
          border: Border.all(color: widget.color),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          widget.label,
          style: _T.button.copyWith(color: widget.color),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Glass nav bar backdrop
// ─────────────────────────────────────────────────────────────────────────────

class _GlassBar extends StatelessWidget {
  final Widget child;
  final Color color;
  const _GlassBar({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(color: color, child: child),
      ),
    );
  }
}
