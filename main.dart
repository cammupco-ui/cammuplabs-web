import 'package:flutter/material.dart';
import 'landing_page.dart';

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
      home: const LandingPage(),
    );
  }
}
