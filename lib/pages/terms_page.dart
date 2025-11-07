import 'package:flutter/material.dart';

/// Lightweight Terms of Use to publish now.
/// Update as you add paid features, accounts, rate limits, etc.
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Terms of Use')),
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
                    Text('Terms of Use', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(
                      'By using this app, you agree to use it at your own risk. While we strive for accuracy in '
                      'conversions and formulas, no warranty is provided. You agree not to abuse the service or '
                      'attempt to harm the app or its users. All content is provided “as is.”\n\n'
                      'We may update these terms at any time; continued use indicates acceptance of changes.\n\n'
                      'For questions or concerns, contact us via the “Feedback” button in the footer.',
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
