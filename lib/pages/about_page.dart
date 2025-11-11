// lib/pages/about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About This Tool')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('About Convert Units Pro', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
            'Convert Units Pro provides instant, accurate unit conversions across common categories like '
            'length, weight, temperature, area, speed, and digital storage. The interface is designed to be '
            'fast, clean, and accessible on any device.',
          ),
          SizedBox(height: 10),
          Text(
            'We focus on clarity: readable formatting, understandable results, and—where helpful—formula breakdowns. '
            'No sign-in is required, and we do not use invasive tracking.',
          ),
        ],
      ),
    );
  }
}
