import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'responsive.dart';

const _dark   = Color(0xFF211C19);
const _border = Color(0xFFEDE5DB);
const _muted  = Color(0xFF9A8E83);
const _glass  = Color(0xCCFFFDFB);

/// 페이지 공통 상단 네비게이션 바
class SharedNav extends StatelessWidget {
  final bool isKorean;
  final VoidCallback onToggleLang;
  final String currentRoute;

  const SharedNav({
    super.key,
    required this.isKorean,
    required this.onToggleLang,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    final links = [
      (isKorean ? '회사' : 'Company', '/company'),
      (isKorean ? '비전' : 'Vision',   '/vision'),
      (isKorean ? '브랜드' : 'Brand',  '/brand'),
      (isKorean ? '문의' : 'Contact',  '/contact'),
    ];

    return Positioned(
      top: 0, left: 0, right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: _glass,
            padding: EdgeInsets.symmetric(
              horizontal: context.px,
              vertical: 10,
            ),
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  // Logo → home
                  GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SvgPicture.asset('assets/logo.svg', height: 20),
                    ),
                  ),

                  if (isDesktop) ...[
                    const Spacer(),
                    ...links.map((l) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: NavPageLink(
                        label: l.$1,
                        route: l.$2,
                        isActive: currentRoute == l.$2,
                      ),
                    )),
                    const Spacer(),
                  ] else
                    const Spacer(),

                  NavBackBtn(isKorean: isKorean),
                  const SizedBox(width: 8),
                  NavLangBtn(isKorean: isKorean, onToggle: onToggleLang),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavPageLink extends StatefulWidget {
  final String label, route;
  final bool isActive;
  const NavPageLink({super.key, required this.label, required this.route, required this.isActive});

  @override
  State<NavPageLink> createState() => _NavPageLinkState();
}

class _NavPageLinkState extends State<NavPageLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: (widget.isActive || _hovered) ? _dark : Colors.transparent,
                width: widget.isActive ? 2 : 1.5,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Alexandria',
              fontFamilyFallback: const ['EliceDigitalBaeum'],
              fontSize: 14,
              fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
              color: _dark,
            ),
          ),
        ),
      ),
    );
  }
}

class NavBackBtn extends StatefulWidget {
  final bool isKorean;
  const NavBackBtn({super.key, required this.isKorean});

  @override
  State<NavBackBtn> createState() => _NavBackBtnState();
}

class _NavBackBtnState extends State<NavBackBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: _hovered ? _dark : _border),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            widget.isKorean ? '← 홈' : '← Home',
            style: const TextStyle(
              fontFamily: 'Alexandria',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _dark,
            ),
          ),
        ),
      ),
    );
  }
}

class NavLangBtn extends StatefulWidget {
  final bool isKorean;
  final VoidCallback onToggle;
  const NavLangBtn({super.key, required this.isKorean, required this.onToggle});

  @override
  State<NavLangBtn> createState() => _NavLangBtnState();
}

class _NavLangBtnState extends State<NavLangBtn> {
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
          opacity: _hovered ? 0.65 : 1.0,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'Alexandria', fontSize: 12, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: 'EN',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w400 : FontWeight.w700,
                    color: widget.isKorean ? _muted : _dark,
                  ),
                ),
                const TextSpan(text: ' / ', style: TextStyle(color: _muted)),
                TextSpan(
                  text: 'KR',
                  style: TextStyle(
                    fontWeight: widget.isKorean ? FontWeight.w700 : FontWeight.w400,
                    color: widget.isKorean ? _dark : _muted,
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
