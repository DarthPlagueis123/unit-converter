// lib/pages/help_page.dart
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const route = '/help';
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & FAQ')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Help & FAQ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('Q: How do I convert values?\n'
               'A: Enter a number, pick the category and units. Results appear instantly.'),
          SizedBox(height: 10),
          Text('Q: Are conversions accurate?\n'
               'A: Yes. We use standard conversion factors and well-known formulas.'),
          SizedBox(height: 10),
          Text('Q: Do I need an account?\n'
               'A: No. The tool is free and does not require sign-in.'),
        ],
      ),
    );
  }
}
