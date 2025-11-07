// ===========================================================
// widgets/result_panel.dart
// - Right panel: read-only result + 'To' dropdown
// ===========================================================
import 'package:flutter/material.dart';

class ResultPanel extends StatelessWidget {
  final List<String> units;
  final String toUnit;
  final TextEditingController resultController;
  final ValueChanged<String> onToUnitChanged;

  const ResultPanel({
    super.key,
    required this.units,
    required this.toUnit,
    required this.resultController,
    required this.onToUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: resultController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Result',
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: toUnit,
              items: units.map((u)=>DropdownMenuItem(value:u,child: Text(u))).toList(),
              onChanged: (u){ if(u!=null) onToUnitChanged(u); },
              decoration: const InputDecoration(labelText:'To', isDense: true),
            ),
          ],
        );
      },
    );
  }
}
