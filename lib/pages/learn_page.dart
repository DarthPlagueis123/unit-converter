// lib/pages/learn_page.dart
import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  static const route = '/learn';
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn More')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('How Unit Conversion Works', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
            'Unit conversion lets us express the same quantity in different measurement systems. '
            'For example, meters to feet, Celsius to Fahrenheit, or kilograms to pounds. '
            'This tool applies standard conversion factors and equations to compute results precisely.',
          ),
          SizedBox(height: 10),
          Text(
            'Example: Temperature conversions use linear formulas (e.g., °F = °C × 9/5 + 32). '
            'Length and mass conversions typically use fixed ratios (e.g., 1 inch = 2.54 cm).',
          ),
        ],
      ),
    );
  }
}
