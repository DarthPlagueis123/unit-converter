// lib/pages/terms_page.dart
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  static const route = '/terms';
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Terms & Conditions', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
            'This website is provided “as is” without warranties. While we strive for accuracy, conversion results '
            'are provided for general information. By using this site, you agree to use it responsibly and hold the '
            'publisher harmless from any losses arising from use.',
          ),
        ],
      ),
    );
  }
}
