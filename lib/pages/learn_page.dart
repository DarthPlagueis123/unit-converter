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
                      'Unit conversion is the process of expressing the same physical quantity using different units. At its core, conversion applies a mathematical relationship—either a fixed ratio or a formula—to transform a numeric value from one unit to another. Simple linear conversions (like length or mass) use multiplication by a constant factor (for example, 1 inch = 2.54 cm). Other conversions, such as temperature, require both scaling and offset (°F = °C × 9/5 + 32) because zero points differ. Data storage uses either decimal (KB = 1000 bytes) or binary (KiB = 1024 bytes) prefixes; choosing the right convention is essential to avoid large discrepancies.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    Text('Key ideas', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    _bullet(theme, 'Significant digits: keep precision until final rounding to reduce accumulated errors.'),
                    _bullet(theme, 'Units and context: pick units appropriate for the task (e.g., use meters for engineering, miles for travel).'),
                    _bullet(theme, 'Prefixes: use SI prefixes for readability on very large or small numbers.'),
                    const SizedBox(height: 12),
                    Text('Examples & formulas', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Temperature: °F = °C × 9/5 + 32. Data: 1 MiB = 1024 × 1024 bytes (binary). Length: 1 in = 2.54 cm.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('When to double-check', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('In critical contexts (lab measurements, legal weights, financial conversions), always verify numbers and document assumptions. Unit conversions are powerful but rely on correct conventions and sufficient precision.', style: theme.textTheme.bodyMedium),
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
