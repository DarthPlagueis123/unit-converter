// ===========================================================
// utils/conversion.dart
// - Pure conversion logic + clean, human-readable breakdown
// ===========================================================
import '../data/units.dart';
import 'format.dart'; // use the same number formatting everywhere

double convertLinear({
  required double value,
  required String category,
  required String from,
  required String to,
}) {
  final m = kLinearFactors[category];
  if (m == null) throw ArgumentError('Category "$category" is not linear.');
  final fFrom = m[from], fTo = m[to];
  if (fFrom == null || fTo == null) {
    throw ArgumentError('Unknown unit(s) for $category: from=$from to=$to');
  }
  final baseVal = value * fFrom; // value in base unit
  return baseVal / fTo;          // base to target
}

double convertTemperature({
  required double value,
  required String from,
  required String to,
}) {
  double c;
  switch (from) {
    case 'celsius':     c = value; break;
    case 'fahrenheit':  c = (value - 32) * 5 / 9; break;
    case 'kelvin':      c = value - 273.15; break;
    default: throw ArgumentError('Unknown temperature unit: $from');
  }
  switch (to) {
    case 'celsius':     return c;
    case 'fahrenheit':  return c * 9 / 5 + 32;
    case 'kelvin':      return c + 273.15;
    default: throw ArgumentError('Unknown temperature unit: $to');
  }
}

/// Build a **clean, bullet-style** explanation.
/// Example layout (Length):
/// Linear conversion (via meter)
/// • Step 1 — to base: x × factor(from) = 1 × 1 = 1 meter
/// • Step 2 — to target: base ÷ factor(to) = 1 ÷ 1000 = 0.001 kilometer
/// Direct ratio
/// • y = x × factor(from) ÷ factor(to) = 1 × 1 ÷ 1000 = 0.001 kilometer
String buildFormulaBreakdown({
  required String category,
  required double value,
  required String from,
  required String to,
}) {
  if (category == 'Temperature') {
    // ----- Temperature (pivot through Celsius) -----
    String step1Formula, step2Formula;
    double c;
    switch (from) {
      case 'celsius':
        step1Formula = 'to °C: c = x';
        c = value;
        break;
      case 'fahrenheit':
        step1Formula = 'to °C: c = (x − 32) × 5/9';
        c = (value - 32) * 5 / 9;
        break;
      case 'kelvin':
        step1Formula = 'to °C: c = x − 273.15';
        c = value - 273.15;
        break;
      default:
        step1Formula = 'to °C: c = ?';
        c = double.nan;
    }

    double y;
    switch (to) {
      case 'celsius':
        step2Formula = 'from °C: y = c';
        y = c;
        break;
      case 'fahrenheit':
        step2Formula = 'from °C: y = c × 9/5 + 32';
        y = c * 9 / 5 + 32;
        break;
      case 'kelvin':
        step2Formula = 'from °C: y = c + 273.15';
        y = c + 273.15;
        break;
      default:
        step2Formula = 'from °C: y = ?';
        y = double.nan;
    }

    final vc = formatNumber(c);
    final vy = formatNumber(y);
    final vx = formatNumber(value);

    return [
      'Temperature (pivot via Celsius)',
      '• Step 1 — $step1Formula   (x = $vx ⇒ c = $vc)',
      '• Step 2 — $step2Formula   (c = $vc ⇒ y = $vy $to)',
      'Result',
      '• y = $vy $to',
    ].join('\n');
  }

  // ----- Linear categories via base unit -----
  final m = kLinearFactors[category];
  if (m == null) return 'No breakdown available.';
  final fFrom = m[from]!;
  final fTo = m[to]!;
  // detect base unit (factor == 1)
  String baseUnit = m.entries.first.key;
  for (final e in m.entries) {
    if ((e.value - 1.0).abs() < 1e-12) { baseUnit = e.key; break; }
  }

  final baseVal = value * fFrom;
  final target = baseVal / fTo;

  final vx = formatNumber(value);
  final vFrom = formatNumber(fFrom);
  final vTo = formatNumber(fTo);
  final vBase = formatNumber(baseVal);
  final vTarget = formatNumber(target);

  return [
    'Linear conversion (via $baseUnit)',
    '• Step 1 — to base: x × factor(from) = $vx × $vFrom = $vBase $baseUnit',
    '• Step 2 — to target: base ÷ factor(to) = $vBase ÷ $vTo = $vTarget $to',
    'Direct ratio',
    '• y = x × factor(from) ÷ factor(to) = $vx × $vFrom ÷ $vTo = $vTarget $to',
  ].join('\n');
}
