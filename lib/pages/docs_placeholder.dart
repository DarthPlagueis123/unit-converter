import 'package:flutter/material.dart';

/// Tips & Tricks page used for the /docs route.
/// This page contains actionable tips that increase publisher-content value
/// for users and helps with ad approvals (avoid empty or low-value screens).
class DocsPlaceholderPage extends StatelessWidget {
  static const route = '/docs';

  const DocsPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Tips & Tricks')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tips & Tricks for Accurate Unit Conversion', style: theme.textTheme.headlineSmall),
                        const SizedBox(height: 12),
                        Text(
                          'Practical advice to improve accuracy, avoid mistakes, and present results clearly. These tips help users get the most out of the converter and provide meaningful publisher content for each page.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Two-column style on wide screens: use Wrap and small cards for each section
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _sectionCard(theme, 'Quick Tips', [
                      'Always include the correct magnitude (e.g., 1,000 instead of 1e3 for readability).',
                      'For temperature conversions use the correct formula; Celsius↔Fahrenheit needs an offset.',
                      'Prefer SI prefixes (k, M, G) for very large numbers to reduce visual clutter.',
                    ]),

                    _sectionCard(theme, 'Formatting & Display', [
                      'Set decimal places for the desired precision; round only for display, not internal computation.',
                      'Toggle thousands separators for clarity without changing the value.',
                      'Always display units with values when sharing results.',
                    ]),

                    _sectionCard(theme, 'Category-specific Notes', [
                      'Length: 1 inch = 2.54 cm. Watch out for nautical miles (1 nmi = 1.852 km).',
                      'Data: KB (decimal) = 1000 bytes, KiB (binary) = 1024 bytes.',
                      'Speed: mph ↔ km/h uses factor 1.609344; knots use 1.852 km/h.',
                    ]),

                    _sectionCard(theme, 'Best Practices', [
                      'Avoid early rounding; keep precision until the final presentation step.',
                      'Cross-check critical conversions with authoritative sources.',
                      'Document assumptions (prefix conventions, unit definitions) for repeatable results.',
                    ]),
                  ],
                ),

                const SizedBox(height: 18),

                Card(
                  elevation: 0,
                  color: theme.colorScheme.surface.withOpacity(0.06),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Troubleshooting & Notes', style: theme.textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text('If results look incorrect, verify you did not swap "from" and "to" units, check locale number formats, and ensure you selected the correct category.', style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        Text('For highly sensitive use cases (engineering, finance), validate values with external references before relying on them.', style: theme.textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),
                Center(
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _sectionCard(ThemeData theme, String title, List<String> bullets) {
  return SizedBox(
    width: 460,
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            for (final b in bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(child: Text(b, style: theme.textTheme.bodyMedium)),
                  ],
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
