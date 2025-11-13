// lib/pages/learn_page.dart
import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  static const route = '/learn';
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Learn More')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('How Unit Conversion Works', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    Text(
                      'Unit conversion is the process of expressing the same physical quantity using different units. At its core, conversion applies a mathematical relationship—either a fixed ratio or a formula—to transform a numeric value from one representation to another. Linear conversions (such as length and mass) are handled by multiplying by a constant factor. For instance, converting inches to centimeters uses 1 in = 2.54 cm. Temperature is an example of a non-linear conversion: converting Celsius to Fahrenheit requires both scaling and offset because their zero points differ (°F = °C × 9/5 + 32). Data storage needs special attention due to two competing conventions: decimal prefixes (KB = 1000 bytes) and binary prefixes (KiB = 1024 bytes). Choosing the correct convention prevents large discrepancies, especially when working at scale.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),

                    Text('Principles to remember', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    _bullet(theme, 'Preserve precision: avoid rounding intermediate values; perform rounding only at the final display step.'),
                    _bullet(theme, 'Context matters: select the unit category that matches what you are measuring (e.g., don\'t convert temperature using length units).'),
                    _bullet(theme, 'Document assumptions: note whether you used decimal or binary prefixes for data, and which definition of a unit (if multiple exist).'),
                    const SizedBox(height: 12),

                    Text('Common pitfalls and how to avoid them', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'One common pitfall is accidentally swapping the "from" and "to" units, which produces incorrect results that may look plausible at a glance. Another issue arises when users apply the wrong prefix convention for data sizes: confusing KB and KiB can produce off-by-24% results at the gigabyte scale. Temperature conversions are a frequent source of mistakes because they require adding or subtracting an offset as well as scaling. Finally, chained conversions—converting A to B to C—can accumulate rounding errors if intermediate values are rounded too early.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),

                    Text('Worked examples', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Example 1 — Length: Convert 12.5 inches to centimeters. Multiply 12.5 × 2.54 = 31.75 cm. Keep full precision in the calculation, then format the result as needed (e.g., 31.75 cm or 31.8 cm depending on desired precision).\n\n'
                      'Example 2 — Temperature: Convert 20 °C to °F. Apply formula °F = °C × 9/5 + 32 → 20 × 9/5 + 32 = 68 °F. Note the offset of 32 is essential.\n\n'
                      'Example 3 — Data: Convert 5 GB (decimal) to GiB (binary). 5 GB = 5,000,000,000 bytes; divide by 1,073,741,824 (1024^3) to get approximately 4.6566 GiB. This demonstrates how different prefix conventions lead to different numerical results.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),

                    Text('When to consult external references', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'For legal, regulatory, or laboratory contexts where exact traceability is required, use certified measurement tools and reference data from standards organizations. Our converter is designed for convenience and education; it offers transparent formulas and encourages users to double-check results in mission-critical contexts.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Chain conversions and best practices', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'When performing chain conversions (for example, converting units between systems or via intermediate steps), it\'s best to keep the full numeric precision until the last step. For instance, if you convert meters to inches and then inches to yards, do not round the intermediate inches value prematurely. Instead, compute using double precision and apply formatting only for the final displayed result. This approach reduces cumulative rounding error and preserves meaningful digits.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Rounding strategies', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Choose rounding based on the domain: financial numbers typically use 2 decimal places, while scientific or engineering calculations may require 3–6 significant figures. Use the app\'s formatting options to match the expected precision of your domain. If you are unsure, prefer more precision in intermediate steps and present a rounded, readable value to end users.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text('Further reading & references', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'For deeper information consult standards bodies and references such as the International System of Units (SI), the National Institute of Standards and Technology (NIST), or domain-specific handbooks. These resources provide authoritative definitions, historical notes, and precise constants used by professionals.',
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

Widget _bullet(ThemeData theme, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 18)),
        Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
      ],
    ),
  );
}
