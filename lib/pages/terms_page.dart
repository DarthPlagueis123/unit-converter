// lib/pages/terms_page.dart
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  static const route = '/terms';
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms & Conditions', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    Text('By using this website you agree to these terms. The Unit Converter is provided for informational purposes only and is offered "as is" without warranties. While we aim for accuracy, conversion results may vary depending on rounding and conventions used (for example, decimal vs binary prefixes).', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Limitations of liability', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('The publisher is not liable for direct or indirect damages arising from use of the site or reliance on conversions. For critical applications (engineering, clinical, financial), verify values with authoritative resources.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Content updates & notices', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('We may update conversion factors, formulas, and content periodically. Continued use constitutes acceptance of such changes; if you disagree, discontinue use and contact feedback@convertunitspro.org.', style: theme.textTheme.bodyMedium),
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
