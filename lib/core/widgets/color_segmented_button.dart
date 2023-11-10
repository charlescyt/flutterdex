import 'package:flutter/material.dart';

import '../utils/material_state_set_extension.dart';

class ColorSegmentedButton extends StatelessWidget {
  const ColorSegmentedButton({
    super.key,
    required this.selected,
    required this.onSelectionChanged,
  });

  final Color? selected;
  final ValueChanged<Color?> onSelectionChanged;

  static const colorOptions = [
    (label: 'Default', value: null),
    (label: 'Red', value: Colors.red),
    (label: 'Green', value: Colors.green),
    (label: 'Blue', value: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Color?>(
      showSelectedIcon: false,
      selected: {selected},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.isSelected ? selected : null;
        }),
      ),
      segments: [
        for (final option in colorOptions)
          ButtonSegment<Color?>(
            value: option.value,
            label: Text(option.label),
          ),
      ],
      onSelectionChanged: (value) => onSelectionChanged(value.first),
    );
  }
}
