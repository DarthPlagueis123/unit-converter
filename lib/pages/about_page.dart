// lib/pages/about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('About This Tool')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Convert Units Pro', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    Text(
                      'Convert Units Pro provides instant, accurate unit conversions across common categories such as length, mass, temperature, speed, area, and digital storage. The application is designed to be straightforward: paste or type a number, select the relevant category, choose source and destination units, and see a precise result immediately. The interface is intentionally minimal so users can complete conversions quickly without unnecessary clutter.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Design principles', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'We focus on clarity, reliability, and privacy. Clarity means formatting results in a readable way (thousands separators, sensible decimal precision) and showing helpful context such as unit names and formula breakdowns when useful. Reliability means using well-known conversion factors and established formulas, and making it clear when an approximation or a prefix convention (decimal vs binary) applies. Privacy means keeping the core conversion functionality client-side where possible, and avoiding mandatory user accounts or invasive tracking.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('How conversions work', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Linear conversions apply a single multiplicative factor. For example, converting meters to feet multiplies by 3.28084. Temperature conversions are different: converting Celsius to Fahrenheit requires scaling and offset because their zero points differ (°F = °C × 9/5 + 32). Data storage units often require careful attention: KB (decimal) is 1000 bytes, while KiB (binary) is 1024 bytes. The app documents these distinctions and provides clear labels so you know which system is being used.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Who should use this tool', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'This tool is useful for students, hobbyists, developers, and professionals who need quick unit conversions without signing up for an account. It is not intended as a replacement for domain-specific calculators or certified measurement tools used in formal engineering, medical, or legal contexts. For those critical contexts, always validate results with appropriate instrumentation or standards.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Accessibility & device support', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'The interface uses responsive layouts and large tap targets for mobile. We also provide keyboard-accessible controls and ensure color contrast is sufficient for general readability. If you encounter an accessibility issue, please report it using the Feedback button so we can prioritize improvements.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Contact & feedback', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'We welcome feedback, requests for new units, and reports of incorrect factors. Use the Feedback button in the footer or email feedback@convertunitspro.org. We carefully review incoming requests and prioritize fixes that help the most users.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    Text('History & roadmap', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Convert Units Pro began as a simple utility to help with everyday conversions and rapidly evolved into a polished tool used by learners and professionals. Our roadmap includes adding more domain-specific categories, improved formula explanations, an offline mode with saved favorites, and enhanced accessibility features. We also plan to publish deeper documentation and tutorials that explain the math behind each category of conversions.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Examples & use cases', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Common uses include converting recipe measurements for international cookbooks, resizing materials in home improvement projects, and translating technical specifications between metric and imperial systems. Developers and system administrators use the data unit conversions when estimating storage or bandwidth costs. Each example highlights a need for clarity about units, rounding, and the proper choice of prefixes or scales.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Quality & verification', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'We periodically validate conversion factors and formulas against authoritative sources and publications. If you discover a discrepancy, please report it; we prioritize fixes and document corrections. For particularly sensitive domains, we recommend cross-referencing published standards or tools certified for that purpose.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Licensing & contributions', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'This project is maintained by a small team and contributors. Conversion factors and utility code are provided for free use under the project license. If you\'d like to contribute, fork the repository and open a pull request with your suggested improvements. We review contributions for accuracy and alignment with the project\'s design goals.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Technical approach', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'The app keeps logic modular: conversion rules and unit data are stored in isolated modules, formatting is centralized so display is consistent, and the UI is composed of small, testable widgets. This approach simplifies maintenance and makes it easier to add new categories or change formatting behavior in a single place.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Final notes', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Thank you for using Convert Units Pro. We hope this tool saves you time and reduces friction when working across different unit systems. If you rely on specific features or need improved documentation, please let us know via Feedback.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    Center(child: FilledButton(onPressed: () => Navigator.of(context).maybePop(), child: const Text('Back'))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
