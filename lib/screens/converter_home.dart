// ===========================================================
// screens/converter_home.dart
// - Glass-morphism floating card (main content)
// - NEW: Footer added under the card so the page feels complete
// - Fills tall screens (no awkward empty void at bottom)
// ===========================================================
import 'package:flutter/material.dart';
import '../data/units.dart';
import '../utils/conversion.dart';
import '../utils/format.dart';
import '../widgets/input_panel.dart';
import '../widgets/result_panel.dart';
import '../widgets/formula_panel.dart';
import '../widgets/glass_card.dart';
import '../widgets/footer.dart';

class ConverterHome extends StatefulWidget {
  const ConverterHome({super.key});

  @override
  State<ConverterHome> createState() => _ConverterHomeState();
}

class _ConverterHomeState extends State<ConverterHome> {
  // -----------------------------
  // Current category & unit state
  // -----------------------------
  String _category = 'Length';
  late String _fromUnit;
  late String _toUnit;

  // -----------------------------
  // Controllers & derived strings
  // -----------------------------
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _resultController =
      TextEditingController(text: '—');
  String _formulaText = '';

  @override
  void initState() {
    super.initState();
    final units = kUnits[_category]!;
    _fromUnit = units.first;
    _toUnit = units.length > 1 ? units[1] : units.first;
  }

  @override
  void dispose() {
    _inputController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  // -------------------------------------
  // Helpers: category reset / swap / math
  // -------------------------------------
  void _resetUnitsForCategory(String cat) {
    final units = kUnits[cat]!;
    setState(() {
      _category = cat;
      _fromUnit = units.first;
      _toUnit = units.length > 1 ? units[1] : units.first;
      _inputController.text = '';
      _resultController.text = '—';
      _formulaText = '';
    });
  }

  void _swapUnits() {
    setState(() {
      final tmp = _fromUnit;
      _fromUnit = _toUnit;
      _toUnit = tmp;
    });
    _convert();
  }

  void _convert() {
    final raw = _inputController.text.trim();
    if (raw.isEmpty) {
      setState(() {
        _resultController.text = '—';
        _formulaText = '';
      });
      return;
    }
    final value = double.tryParse(raw);
    if (value == null) {
      setState(() {
        _resultController.text = 'Invalid number';
        _formulaText = '';
      });
      return;
    }

    final out = (_category == 'Temperature')
        ? convertTemperature(value: value, from: _fromUnit, to: _toUnit)
        : convertLinear(
            value: value,
            category: _category,
            from: _fromUnit,
            to: _toUnit,
          );

    _resultController.text = formatNumber(out);
    _formulaText = buildFormulaBreakdown(
      category: _category,
      value: value,
      from: _fromUnit,
      to: _toUnit,
    );
    setState(() {});
  }

  // ----------------------------------------------------
  // Context-aware TIP content (varies by current category)
  // ----------------------------------------------------
  String _categoryTip() {
    String? baseOf(String cat) {
      final map = kLinearFactors[cat];
      if (map == null) return null;
      for (final e in map.entries) {
        if ((e.value - 1.0).abs() < 1e-12) return e.key;
      }
      return map.isNotEmpty ? map.keys.first : null;
    }

    switch (_category) {
      case 'Temperature':
        return 'Temperature uses Celsius as pivot: first convert to °C, then from °C to the target unit.';
      case 'Data':
        return 'Data uses binary multiples (KiB, MiB, GiB). 1 KiB = 1024 bytes (not 1000).';
      case 'Speed':
        return 'Speed pivots via meter/second. 1 knot = 1852 m/h; mph uses statute miles.';
      case 'Volume':
        return 'Volume pivots via cubic meter. US customary units (gal, qt, pt, cup, tbsp, tsp) are used.';
      case 'Area':
        return 'Area pivots via square meter. 1 hectare = 10,000 m²; 1 acre ≈ 4046.8564224 m².';
      case 'Angle':
        return 'Angle pivots via radians. 1 turn = 2π radians = 360°; gradian uses 400 grads per turn.';
      case 'Time':
        return 'Time pivots via second. Watch rounding when mixing very large and small units.';
      case 'Weight':
        return 'Weight pivots via kilogram. Pound/ounce here are avoirdupois (US common).';
      case 'Length':
        return 'Length pivots via meter. Inch = 2.54 cm exactly; mile = 1609.344 m.';
      default:
        final base = baseOf(_category);
        if (base != null) return 'This category pivots through $base using simple multipliers.';
        return 'Edit units & factors under data/units.dart.';
    }
  }

  // A subtle translucent tip bar that matches the glass style
  Widget _buildTipBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.30)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.info_outline, size: 18),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _categoryTip(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: We’ll make the whole page (card + footer) at least as tall as the viewport,
    // so the footer sits at the bottom even if content is short.
    final viewportHeight = MediaQuery.of(context).size.height;

    final unitsForCat = kUnits[_category] ?? const <String>[];

    // Panels
    final leftPanel = InputPanel(
      units: unitsForCat,
      fromUnit: _fromUnit,
      inputController: _inputController,
      onInputChanged: (s) => _convert(),
      onFromUnitChanged: (u) {
        setState(() => _fromUnit = u);
        _convert();
      },
    );

    final rightPanel = ResultPanel(
      units: unitsForCat,
      toUnit: _toUnit,
      resultController: _resultController,
      onToUnitChanged: (u) {
        setState(() => _toUnit = u);
        _convert();
      },
    );

    final swapButton = IconButton.filledTonal(
      onPressed: _swapUnits,
      icon: const Icon(Icons.swap_horiz),
      tooltip: 'Swap units',
    );

    // Ad placeholder (fits glass style)
    final adBox = Container(
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.28)),
      ),
      child: const Text('Ad space'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        centerTitle: true,
      ),

      // Anchor content to TOP; put content + footer into a min-height column
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: ConstrainedBox(
              // This ensures the column (card + footer) fills the screen height,
              // so the footer lands at the bottom when content is short.
              constraints: BoxConstraints(minHeight: viewportHeight - kToolbarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ---------------- Main glass card ----------------
                  GlassCard(
                    borderRadius: 22,
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth >= 760;

                        // Category chips
                        final chips = Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: kUnits.keys.map((cat) {
                            final selected = _category == cat;
                            return ChoiceChip(
                              label: Text(cat),
                              selected: selected,
                              onSelected: (_) => _resetUnitsForCategory(cat),
                            );
                          }).toList(),
                        );

                        if (isWide) {
                          // ---- Wide layout ----
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              chips,
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: leftPanel),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: swapButton,
                                  ),
                                  Expanded(child: rightPanel),
                                ],
                              ),
                              const SizedBox(height: 14),
                              FormulaPanel(breakdownText: _formulaText),
                              const SizedBox(height: 14),
                              _buildTipBar(context),
                              const SizedBox(height: 12),
                              adBox,
                            ],
                          );
                        } else {
                          // ---- Compact layout ----
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              chips,
                              const SizedBox(height: 14),
                              leftPanel,
                              const SizedBox(height: 10),
                              Align(alignment: Alignment.centerLeft, child: swapButton),
                              const SizedBox(height: 10),
                              rightPanel,
                              const SizedBox(height: 12),
                              FormulaPanel(breakdownText: _formulaText),
                              const SizedBox(height: 12),
                              _buildTipBar(context),
                              const SizedBox(height: 10),
                              adBox,
                            ],
                          );
                        }
                      },
                    ),
                  ),

                  // ---------------- Footer ----------------
                  const SizedBox(height: 18),
                  SiteFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
