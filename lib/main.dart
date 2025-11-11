// lib/main.dart
// MAIN ENTRY — sets up theme, routes, and the home screen.
//
// Notes:
// - AppBar uses a soft "sky blue".
// - Adds simple routes for About / Learn / Help / Privacy / Terms.
// - No external packages required; pure Flutter.

import 'package:flutter/material.dart';

import 'package:unit_converter/converter.dart';

void main() {
  // Standard Flutter bootstrap.
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // THEME:
    // - Soft, readable blue for AppBar.
    // - Light surface background (we also add a background gradient in the home).
    final skyBlue = const Color(0xFF7EC8F8); // soft blue-sky tone

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Convert Units Pro',
      theme: ThemeData(
        primaryColor: skyBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: skyBlue, brightness: Brightness.light),
        appBarTheme: AppBarTheme(
          backgroundColor: skyBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        useMaterial3: true,
      ),
      // HOME: our converter + new content sections
      home: const ConverterHome(),
      // SIMPLE ROUTES: basic content pages for AdSense "publisher-content"
      routes: {
        AboutPage.route: (_) => const AboutPage(),
        LearnPage.route: (_) => const LearnPage(),
        HelpPage.route: (_) => const HelpPage(),
        PrivacyPage.route: (_) => const PrivacyPage(),
        TermsPage.route: (_) => const TermsPage(),
      },
    );
  }
}
