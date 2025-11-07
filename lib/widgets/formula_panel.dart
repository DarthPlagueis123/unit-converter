// ===========================================================
// widgets/formula_panel.dart
// - Neat, readable formula breakdown with bullets & headers
// ===========================================================
import 'package:flutter/material.dart';

class FormulaPanel extends StatelessWidget {
  final String breakdownText;
  const FormulaPanel({super.key, required this.breakdownText});

  @override
  Widget build(BuildContext context) {
    if (breakdownText.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    final lines = breakdownText.split('\n');

    Widget _line(String s) {
      // Header lines (no bullet): "Linear conversion (...)", "Temperature ...", "Direct ratio", "Result"
      final isHeader = s.trim().isNotEmpty &&
          (s.startsWith('Linear conversion') ||
           s.startsWith('Temperature') ||
           s.trim() == 'Direct ratio' ||
           s.trim() == 'Result');

      if (isHeader) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: Text(
            s,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      }

      // Bullet lines start with "• "
      final isBullet = s.trimLeft().startsWith('• ');
      final text = isBullet ? s.trimLeft().substring(2) : s;

      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 2, 8, 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('• '),
            Expanded(
              child: SelectableText(
                text,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      );
    }

    return Card(
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: const Icon(Icons.functions),
        title: const Text('Formula breakdown'),
        childrenPadding: const EdgeInsets.only(bottom: 12),
        children: [
          // tight vertical spacing
          ...lines.map(_line),
        ],
      ),
    );
  }
}
