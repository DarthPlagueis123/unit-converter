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
                    Text('Convert Units Pro provides instant, accurate unit conversions across common categories like length, weight, temperature, area, speed, and digital storage. The tool is optimized for clarity and speed, helping users get results with minimal friction.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Design principles', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('We focus on readable formatting, clear results, and optional formula breakdowns where useful. No sign-in is required, and the tool avoids invasive tracking practices.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Contact & feedback', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('If you have feedback or a request for new units, use the Feedback button in the footer or email feedback@convertunitspro.org. We welcome suggestions and will consider reasonable requests for new categories or features.', style: theme.textTheme.bodyMedium),
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
