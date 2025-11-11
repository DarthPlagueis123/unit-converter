// lib/pages/privacy_page.dart
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  static const route = '/privacy';
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Privacy Policy', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
            'We respect your privacy. This tool does not require an account and does not collect personal data. '
            'If advertising is enabled after approval, standard ad network policies apply. '
            'For questions, contact: feedback@convertunitspro.org.',
          ),
        ],
      ),
    );
  }
}
