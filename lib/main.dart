import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/company_page.dart';
import 'pages/vision_page.dart';
import 'pages/brand_page.dart';
import 'pages/contact_page.dart';
import 'responsive.dart';

void main() {
  runApp(const CammupApp());
}

class CammupApp extends StatelessWidget {
  const CammupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAMMUP — A technology for meaningful conversation.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Alexandria',
        colorScheme: const ColorScheme.light(
          surface: Color(0xFFFFFDFB),
          primary: Color(0xFF211C19),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFDFB),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      // 전역 반응형 래퍼: 최소 320px, 최대 1440px 중앙 정렬
      builder: (context, child) => PageWrapper(
        color: const Color(0xFFFFFDFB),
        child: child ?? const SizedBox.shrink(),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/company': (_) => const CompanyPage(),
        '/vision': (_) => const VisionPage(),
        '/brand': (_) => const BrandPage(),
        '/contact': (_) => const ContactPage(),
      },
    );
  }
}
