import 'package:flutter/material.dart';
import '../shared_nav.dart';
import '../responsive.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _isKorean = false;

  @override
  Widget build(BuildContext context) {
    const pink    = Color(0xFFFF0051);
    const dark    = Color(0xFF211C19);
    const surface = Color(0xFFFFFDFB);
    const sub     = Color(0xFF6B6159);
    const border  = Color(0xFFEDE5DB);

    final contacts = [
      _ContactData(
        roleEn: 'For Investors',
        roleKr: '투자 문의',
        email: 'invest@cammup.com',
        descEn: 'Funding rounds, due diligence, strategic partnerships',
        descKr: '투자 라운드, 실사, 전략적 파트너십',
      ),
      _ContactData(
        roleEn: 'For Schools & Partners',
        roleKr: '학교·파트너 문의',
        email: 'partners@cammup.com',
        descEn: 'Pilots, classroom deployment, SEL collaboration',
        descKr: '파일럿, 교실 도입, SEL 협력',
      ),
      _ContactData(
        roleEn: 'For Press',
        roleKr: '미디어 문의',
        email: 'press@cammup.com',
        descEn: 'Interviews, press materials, brand assets',
        descKr: '인터뷰, 보도 자료, 브랜드 에셋',
      ),
    ];

    return Scaffold(
      backgroundColor: surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(context.px, 100, context.px, 80),
              child: context.isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _ContactLeft(isKorean: _isKorean)),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: contacts.map((c) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _ContactCard(data: c, isKorean: _isKorean),
                            )).toList(),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ContactLeft(isKorean: _isKorean),
                        const SizedBox(height: 40),
                        ...contacts.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _ContactCard(data: c, isKorean: _isKorean),
                        )),
                      ],
                    ),
            ),
          ),

          SharedNav(isKorean: _isKorean, onToggleLang: () => setState(() => _isKorean = !_isKorean), currentRoute: '/contact'),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CONTACT',
          style: TextStyle(fontFamily: 'Alexandria', fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFFFF0051), letterSpacing: 1.5),
        ),
        const SizedBox(height: 20),
        Text(
          isKorean ? '다음 대화를\n함께 만듭니다.' : "Let's build the\nnext conversation.",
          style: TextStyle(
            fontFamily: 'Alexandria',
            fontFamilyFallback: const ['EliceDigitalBaeum'],
            fontSize: context.fs(48),
            fontWeight: FontWeight.w400,
            height: 1.15,
            color: const Color(0xFF211C19),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          isKorean
              ? '투자자, 학교, 그리고 사람들의 소통 방식을\n함께 설계할 파트너를 만나고 있습니다.'
              : "We're talking with investors, schools, and partners\nwho want to design the future of how people communicate.",
          style: TextStyle(
            fontFamily: 'Alexandria',
            fontFamilyFallback: const ['EliceDigitalBaeum'],
            fontSize: context.r(mobile: 14.0, tablet: 15.0, desktop: 16.0),
            height: 1.75,
            color: const Color(0xFF6B6159),
          ),
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
          border: Border.all(color: _hovered ? const Color(0xFFD9CFC2) : const Color(0xFFEDE5DB)),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _hovered ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 16, offset: const Offset(0, 4))] : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isKorean ? widget.data.roleKr : widget.data.roleEn,
                    style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF211C19)),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.data.email, style: const TextStyle(fontFamily: 'Alexandria', fontSize: 14, color: Color(0xFFFF0051))),
                  const SizedBox(height: 4),
                  Text(
                    widget.isKorean ? widget.data.descKr : widget.data.descEn,
                    style: const TextStyle(fontFamily: 'Alexandria', fontFamilyFallback: ['EliceDigitalBaeum'], fontSize: 12, color: Color(0xFF9A8E83)),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: _hovered ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () async {
                  setState(() => _copied = true);
                  await Future.delayed(const Duration(seconds: 2));
                  if (mounted) setState(() => _copied = false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFDFB),
                    border: Border.all(color: const Color(0xFFEDE5DB)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _copied ? (widget.isKorean ? '✓ 복사됨' : '✓ Copied') : (widget.isKorean ? '이메일 복사' : 'Copy email'),
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 11,
                      color: _copied ? const Color(0xFFFF0051) : const Color(0xFF6B6159),
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
