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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'This Help center provides practical guidance for using the Unit Converter effectively. Below you will find answers to common questions, explanations of precision and formatting options, and troubleshooting tips to ensure you get reliable results. We also include context for specialized unit groups like data storage and temperature so you can understand the underlying math.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),

                    ExpansionTile(
                      title: const Text('How do I convert values?'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Enter the numeric value you want to convert into the input field, then select the category that best matches what you are measuring (for example, Length, Mass, Temperature, Speed, or Data). Choose the "From" unit (the unit of your input) and the "To" unit (the unit you want as output). The result updates instantly. If you need to perform repeated conversions, use the same category and adjust borders/formatting as needed for readability.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Are conversions accurate?'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'We rely on established conversion factors and published formulas. For many categories (length, mass, volume) conversion factors are exact by definition. For other domains (such as physical constants or approximations), there may be multiple conventions; the tool indicates which convention is used where relevant. For mission-critical work (engineering tolerances, laboratory measurements, legal weights), treat this tool as a helpful reference and validate values against certified instruments or standards.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Do I need an account?'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No account is required. The site is designed for quick, anonymous conversions. If you choose to provide feedback or request features, you may optionally include contact details, but this is not necessary to use the conversion tool itself.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Why do results sometimes show many decimals?'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'To preserve numerical accuracy we compute with high precision and only format the final result for display. This can result in long decimal expansions for certain conversions; use the formatting controls to reduce decimals for presentation or reporting. Remember that extra decimals are often harmless and can be informative when comparing small differences.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('What does "Categories" mean?'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Categories group units that measure the same type of quantity (e.g., Length, Mass, Temperature, Speed, Data). Picking the correct category ensures the conversion uses appropriate formulas and unit definitions. For example, temperature conversions require different math than length conversions, and data storage needs a decision about decimal vs binary prefixes.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Troubleshooting common problems'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'If values don\'t match expected results, verify that you selected the right category, that the units are not swapped, and that you used the right prefix conventions (KB vs KiB). If you still see an issue, try entering the numeric value without separators (e.g., 1234 not 1,234) or report the case via Feedback so we can investigate.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: const Text('Data units: KB vs KiB explained'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Data storage units have two related but different conventions. Decimal prefixes (KB, MB, GB) commonly mean multiples of 1000 (KB = 1000 bytes). Binary prefixes (KiB, MiB, GiB) use multiples of 1024 (KiB = 1024 bytes). Historically the use of KB for 1024 bytes was common, but modern practice distinguishes the two. When converting storage sizes, select the convention that matches the context: storage manufacturers typically use decimal prefixes, while many operating systems report binary-prefixed sizes.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Temperature conversions details'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Temperature conversions require attention because scales have different zero points and scaling factors. Celsius and Kelvin differ only by an additive constant (0 °C = 273.15 K). Fahrenheit uses both scaling and offset relative to Celsius: °F = °C × 9/5 + 32. Always apply the full formula rather than trying to convert via intermediate rounded steps to avoid small errors.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Precision & rounding guidance'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Choose rounding based on domain needs. For daily or consumer tasks, 1–2 decimal places are usually sufficient. For scientific or engineering tasks you may need several significant figures. Avoid rounding intermediate results—keep full precision until the final formatting step. The app allows you to control decimal places to match your reporting requirements.',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),

                    ExpansionTile(
                      title: const Text('Practical use cases and tips'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'For cooking, prefer rounding to 1 decimal place for volume measurements and specify units (cups, ml). For travel, use kilometers or miles consistently and include conversion notes if sharing. For development, when estimating storage or bandwidth, clearly state whether you used decimal or binary prefixes, and prefer SI prefixes for large values to keep numbers readable.',
                            style: theme.textTheme.bodyMedium,
                          ),
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
