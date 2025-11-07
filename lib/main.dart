import 'package:flutter/material.dart';
import 'screens/converter_home.dart';
import 'pages/docs_placeholder.dart';
import 'pages/privacy_page.dart';
import 'pages/terms_page.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue.shade300, // soft sky blue
          foregroundColor: Colors.white,
          elevation: 3,
          scrolledUnderElevation: 0,
        ),
      ),
      // Routes for internal pages we added
      routes: {
        '/': (_) => const AppBackground(child: ConverterHome()),
        '/docs': (_) => const AppBackground(child: DocsPlaceholderPage()),
        '/privacy': (_) => const AppBackground(child: PrivacyPage()),
        '/terms': (_) => const AppBackground(child: TermsPage()),
      },
      initialRoute: '/',
    );
  }
}

/// Soft sky blue background gradient wrapper
class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.shade50,
            Colors.lightBlue.shade100,
            Colors.lightBlue.shade200,
          ],
        ),
      ),
      child: child,
    );
  }
}
