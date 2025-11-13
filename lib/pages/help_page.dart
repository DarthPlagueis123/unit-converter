// lib/pages/help_page.dart
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const route = '/help';
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Help & FAQ')),
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
                    Text('Help & FAQ', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    ExpansionTile(
                      title: const Text('How do I convert values?'),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Enter a number, pick the category and units. Results appear instantly.'),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Are conversions accurate?'),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('We use standard conversion factors and well-known formulas. For critical uses, verify with a trusted reference.'),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Do I need an account?'),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('No. The tool is free and does not require sign-in.'),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Why do results sometimes show many decimals?'),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('We preserve precision by default. Use the formatting controls to round results for display or reporting.'),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('What does "Categories" mean?'),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Categories group units by related measurements, such as Length, Mass, Temperature, Speed, and Data. Pick the right category before choosing units.'),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
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
