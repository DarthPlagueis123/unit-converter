// ===========================================================
// widgets/input_panel.dart
// - Left panel: numeric input + 'From' dropdown
// ===========================================================
import 'package:flutter/material.dart';

class InputPanel extends StatelessWidget {
  final List<String> units;
  final String fromUnit;
  final TextEditingController inputController;
  final ValueChanged<String> onInputChanged;
  final ValueChanged<String> onFromUnitChanged;

  const InputPanel({
    super.key,
    required this.units,
    required this.fromUnit,
    required this.inputController,
    required this.onInputChanged,
    required this.onFromUnitChanged,
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
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              controller: inputController,
              onChanged: onInputChanged,
              decoration: const InputDecoration(
                labelText: 'Value',
                hintText: 'Enter a number (e.g., 12.5)',
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: fromUnit,
              items: units.map((u)=>DropdownMenuItem(value:u,child: Text(u))).toList(),
              onChanged: (u){ if(u!=null) onFromUnitChanged(u); },
              decoration: const InputDecoration(labelText:'From', isDense: true),
            ),
          ],
        );
      },
    );
  }
}
