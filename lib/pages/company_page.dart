import 'package:flutter/material.dart';
import '../shared_nav.dart';
import '../responsive.dart';

const _dark    = Color(0xFF211C19);
const _surface = Color(0xFFFFFDFB);
const _pink    = Color(0xFFFF0051);
const _sub     = Color(0xFF6B6159);
const _border  = Color(0xFFEDE5DB);
const _muted   = Color(0xFF9A8E83);
const _glass   = Color(0xCCFFFDFB);

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  bool _isKorean = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(context.px, 100, context.px, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section tag
                  Text(
                    _isKorean ? 'COMPANY' : 'COMPANY',
                    style: const TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 11, fontWeight: FontWeight.w500,
                      color: _pink, letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _isKorean ? 'CAMMUPLABS는\n질문을 연구합니다.' : "CAMMUPLABS\nresearches questions.",
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontFamilyFallback: const ['EliceDigitalBaeum'],
                      fontSize: context.fs(56),
                      fontWeight: FontWeight.w400,
                      height: 1.15,
                      color: _dark,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      _isKorean
                          ? 'CAMMUP은 "Come Up with idea"에서 이미 그 아이디어가 실현되었다는 의미를 담고 있습니다. 새로운 아이디어는 질문을 만들고, 그 질문이 떠오르는 순간, 그것은 이미 시작된 가능성입니다.'
                          : 'CAMMUP means "Come Up" — where the idea has already arrived. New ideas birth questions, and the moment a question surfaces, it is already a possibility in motion.',
                      style: const TextStyle(
                        fontFamily: 'Alexandria',
                        fontFamilyFallback: ['EliceDigitalBaeum'],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.75,
                        color: _sub,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Divider(color: _border, thickness: 1),
                  const SizedBox(height: 48),

                  // Mission / Vision
                  context.isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _InfoBlock(
                              label: _isKorean ? '미션' : 'MISSION',
                              title: _isKorean ? '사람들의 진정한 소통을 돕는다.' : 'Help people communicate with genuine depth.',
                              body: _isKorean
                                  ? '단절된 대화를 잇고, 서로의 진심을 확인하는 기술을 만듭니다.'
                                  : 'We build technology that reconnects conversations and lets sincerity travel between people.',
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _InfoBlock(
                              label: _isKorean ? '비전' : 'VISION',
                              title: _isKorean ? '질문이 기술이 되는 세상.' : 'A world where questions are technology.',
                              body: _isKorean
                                  ? '사람들이 서로를 궁금해하고, 기분 좋게 대화할 수 있는 세상을 만듭니다.'
                                  : 'A world where people are curious about each other, and conversation feels effortless and real.',
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _InfoBlock(
                              label: _isKorean ? '미션' : 'MISSION',
                              title: _isKorean ? '사람들의 진정한 소통을 돕는다.' : 'Help people communicate with genuine depth.',
                              body: _isKorean ? '단절된 대화를 잇고, 서로의 진심을 확인하는 기술을 만듭니다.' : 'We build technology that reconnects conversations and lets sincerity travel between people.',
                            ),
                            const SizedBox(height: 32),
                            _InfoBlock(
                              label: _isKorean ? '비전' : 'VISION',
                              title: _isKorean ? '질문이 기술이 되는 세상.' : 'A world where questions are technology.',
                              body: _isKorean ? '사람들이 서로를 궁금해하고, 기분 좋게 대화할 수 있는 세상을 만듭니다.' : 'A world where people are curious about each other, and conversation feels effortless and real.',
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),

          SharedNav(
            isKorean: _isKorean,
            onToggleLang: () => setState(() => _isKorean = !_isKorean),
            currentRoute: '/company',
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label, title, body;
  const _InfoBlock({required this.label, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(
          fontFamily: 'Alexandria',
          fontSize: 10, fontWeight: FontWeight.w500,
          color: _pink, letterSpacing: 1.5,
        )),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(
          fontFamily: 'Alexandria',
          fontFamilyFallback: ['EliceDigitalBaeum'],
          fontSize: 24, fontWeight: FontWeight.w600,
          height: 1.3, color: _dark,
        )),
        const SizedBox(height: 10),
        Text(body, style: const TextStyle(
          fontFamily: 'Alexandria',
          fontFamilyFallback: ['EliceDigitalBaeum'],
          fontSize: 15, height: 1.7, color: _sub,
        )),
      ],
    );
  }
}

