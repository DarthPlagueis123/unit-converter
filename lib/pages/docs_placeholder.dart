import 'package:flutter/material.dart';

/// Simple “Docs” placeholder page so links work today.
/// Replace with real docs later, or route to multiple subpages.
class DocsPlaceholderPage extends StatelessWidget {
  const DocsPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Documentation')),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Docs (Coming Soon)', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(
                      'We’re writing clear docs for formulas, categories, and tips.\n'
                      'Have a request? Use the “Feedback” button in the footer.',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
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
