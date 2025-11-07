import 'package:flutter/material.dart';

/// Lightweight Privacy Policy you can publish immediately.
/// Edit text as your app evolves (analytics/ads/payment vendors, etc.).
class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now().toLocal().toString().split(' ').first;
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.surface.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Text('Privacy Policy', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(
                      'Last updated: $today\n\n'
                      'This app does not collect personally identifiable information unless you explicitly '
                      'provide it (e.g., via feedback email). We may collect aggregate usage data to improve '
                      'performance and reliability. Third-party services (ads, analytics, payments) may have '
                      'their own privacy policies.\n\n'
                      'If you contact us, we use your information solely to respond to your inquiry.\n\n'
                      'Questions? Use the “Feedback” button in the footer.',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      child: const Text('Back'),
                    ),
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
