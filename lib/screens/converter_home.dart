// lib/converter_home.dart
//
// Uses your shared conversion/format utilities and widgets that you export
// through the barrel `converter.dart`. No local formatter here.
//
// Barrel should export:
// - widgets: InputPanel, ResultPanel, FormulaPanel, GlassCard, SiteFooter
// - utils: convertLinear, convertTemperature, buildFormulaBreakdown, formatNumber
// - data:  kLinearFactors (Map<String, Map<String,double>>)
//
// If your barrel doesn't re-export one of the above yet, either add it there
// or import the file directly.

import 'package:flutter/material.dart';
import 'package:unit_converter/converter.dart';

class ConverterHome extends StatefulWidget {
  const ConverterHome({super.key});

  @override
  State<ConverterHome> createState() => _ConverterHomeState();
}

class _ConverterHomeState extends State<ConverterHome> {
  // ----- Scroll support for "Start converting" button -----
  final _scrollController = ScrollController();
  final _converterKey = GlobalKey();

  // ----- Category / units state -----
  // We derive categories from kLinearFactors keys and add Temperature explicitly.
  late final List<String> _categories =
      (kLinearFactors.keys.toList()..sort()) + const ['Temperature'];

  // Active category (default to first linear category if present)
  late String _category =
      (kLinearFactors.isNotEmpty ? kLinearFactors.keys.first : 'Length');

  // Units for the active category
  List<String> _units = const [];

  // Selected units
  String _fromUnit = '';
  String _toUnit = '';

  // Text controllers for input/result fields
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  // Formula breakdown text for FormulaPanel
  String _breakdownText = '';

  @override
  void initState() {
    super.initState();
    _refreshUnitsForCategory(_category);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _inputController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  // ----------------- Helpers -----------------

  void _scrollToConverter() {
    final ctx = _converterKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  void _refreshUnitsForCategory(String category) {
    List<String> units;
    if (category == 'Temperature') {
      units = const ['celsius', 'fahrenheit', 'kelvin'];
    } else {
      units = (kLinearFactors[category]?.keys.toList() ?? <String>[]);
      if (units.isEmpty) {
        // Minimal fallback to avoid crashes if a category is empty/missing.
        units = const ['unitA', 'unitB'];
      }
    }
    units.sort();

    setState(() {
      _category = category;
      _units = units;
      _fromUnit = units.first;
      _toUnit = units.length > 1 ? units[1] : units.first;
      _resultController.text = '';
      _breakdownText = '';
    });

    _recompute(); // compute if input already present
  }

  void _recompute() {
    final inputRaw = _inputController.text.trim();

    if (inputRaw.isEmpty) {
      _resultController.text = '';
      setState(() => _breakdownText = '');
      return;
    }

    final x = double.tryParse(inputRaw);
    if (x == null) {
      _resultController.text = '';
      setState(() => _breakdownText = 'Input is not a valid number.');
      return;
    }

    double y;
    try {
      if (_category == 'Temperature') {
        y = convertTemperature(value: x, from: _fromUnit, to: _toUnit);
      } else {
        y = convertLinear(
          value: x,
          category: _category,
          from: _fromUnit,
          to: _toUnit,
        );
      }

      _resultController.text = formatNumber(y);
      _breakdownText = buildFormulaBreakdown(
        category: _category,
        value: x,
        from: _fromUnit,
        to: _toUnit,
      );
    } catch (e) {
      _resultController.text = '';
      _breakdownText = 'Conversion error: $e';
    }

    setState(() {});
  }

  // ----------------- UI sections -----------------

  Widget _buildHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 18),
        Icon(Icons.swap_horiz, size: 64, color: Colors.blueAccent.withOpacity(0.85)),
        const SizedBox(height: 12),
        Text(
          'Fast, Accurate Unit Conversion',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: Colors.black.withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Convert length, weight, temperature, speed, area, data, and more — instantly.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _scrollToConverter,
          icon: const Icon(Icons.tune),
          label: const Text('Start converting'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _buildIntro() {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About this tool',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              'Unit Converter is built to deliver fast, accurate conversions with clarity and transparency. '
              'Whether you\'re converting lengths for a DIY project, checking food measurements in the kitchen, '
              'or working with data storage units, this tool gives clear, explainable results. We prioritize privacy — no account is required and core computations are handled client-side when possible. ',
            ),
            SizedBox(height: 8),
            Text(
              'How to get the best results: enter the numeric value you want to convert, select the correct category (for example, Length, Mass, Temperature, or Data), and choose the source and target units. Use the formatting controls to set the number of decimal places and toggle thousands separators for readability. For temperature conversions, remember the formulas require offsets (for example, °F = °C × 9/5 + 32). For data units, be aware of decimal vs. binary prefixes — KB (decimal) means 1000 bytes while KiB (binary) means 1024 bytes.',
            ),
            SizedBox(height: 8),
            Text(
              'Practical scenarios: engineers should keep significant digits until the final step to avoid rounding errors; travelers converting miles to kilometers should note whether distances are nautical or statute; and developers dealing with storage should pick the correct prefix convention. This homepage includes quick tips and links to deeper documentation and examples so you can learn why results look the way they do.',
            ),
            SizedBox(height: 8),
            Text(
              'We created this site to be useful across devices. If you rely on a particular conversion frequently, consider bookmarking the page or using the install/PWA capabilities of modern browsers. For questions or feature requests, use the Feedback button in the footer — we read every message and use them to improve the tool.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyUse() {
    return GlassCard(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Why use this converter?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Text('• Fast, accurate calculations with clear formatting'),
            Text('• Clean interface with glass-morphism styling'),
            Text('• Supports all major unit categories'),
            Text('• Works offline in many browsers (installed as a PWA)'),
            Text('• No account or tracking needed'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCards() {
    const items = [
      _Feature(
        icon: Icons.straighten,
        title: '10+ Categories',
        desc: 'Length, weight, temperature, speed, area, data, and more.',
      ),
      _Feature(
        icon: Icons.bolt,
        title: 'Instant Results',
        desc: 'Calculations update as you type — no extra clicks.',
      ),
      _Feature(
        icon: Icons.shield,
        title: 'Privacy First',
        desc: 'No login, no cookies, no tracking scripts.',
      ),
      _Feature(
        icon: Icons.devices,
        title: 'Works Everywhere',
        desc: 'Responsive on desktop, tablet, and mobile.',
      ),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items.map((f) {
        return SizedBox(
          width: 320,
          child: GlassCard(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _FeatureTile(feature: f),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategoryPicker() {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          children: [
            const Text('Category:', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            Flexible(
              child: DropdownButtonFormField<String>(
                value: _category,
                items: _categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (c) {
                  if (c != null) _refreshUnitsForCategory(c);
                },
                isDense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConverterArea() {
    return GlassCard(
      key: _converterKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Unit Converter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),

            // LEFT: input text + "From" dropdown
            InputPanel(
              units: _units,
              fromUnit: _fromUnit,
              inputController: _inputController,
              onInputChanged: (_) => _recompute(),
              onFromUnitChanged: (u) {
                setState(() => _fromUnit = u);
                _recompute();
              },
            ),
            const SizedBox(height: 12),

            // RIGHT: result (read-only) + "To" dropdown
            ResultPanel(
              units: _units,
              toUnit: _toUnit,
              resultController: _resultController,
              onToUnitChanged: (u) {
                setState(() => _toUnit = u);
                _recompute();
              },
            ),
            const SizedBox(height: 12),

            // FORMULA: breakdown of the math
            FormulaPanel(breakdownText: _breakdownText),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() => SiteFooter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convert Units Pro')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF6FF), Color(0xFFF7FBFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHero(),
                  _buildIntro(),
                  const SizedBox(height: 16),
                  _buildWhyUse(),
                  const SizedBox(height: 16),
                  _buildFeatureCards(),
                  const SizedBox(height: 22),
                  _buildCategoryPicker(),
                  const SizedBox(height: 14),
                  _buildConverterArea(),
                  const SizedBox(height: 16),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---- Small feature model + tile ----
class _Feature {
  final IconData icon;
  final String title;
  final String desc;
  const _Feature({required this.icon, required this.title, required this.desc});
}

class _FeatureTile extends StatelessWidget {
  final _Feature feature;
  const _FeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(feature.icon, size: 30, color: Colors.blueAccent),
        const SizedBox(height: 10),
        Text(feature.title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(feature.desc),
      ],
    );
  }
}
