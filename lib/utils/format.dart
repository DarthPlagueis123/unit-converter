// ===========================================================
// utils/format.dart
// - Number formatting utility
// ===========================================================
String formatNumber(double x) {
  if (x != 0.0 && (x.abs() >= 1e4 || x.abs() < 1e-3)) {
    return x.toStringAsExponential(6);
  }
  final raw = x.toStringAsFixed(10);
  final trimmedZeros = raw.replaceAllMapped(RegExp(r'(\.\d*?[1-9])0+$'), (m)=>m.group(1)!);
  return trimmedZeros.replaceAll(RegExp(r'\.0+$'), '');
}
