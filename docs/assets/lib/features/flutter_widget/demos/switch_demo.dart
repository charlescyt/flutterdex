import 'package:flutter/material.dart';

import '../../../core/utils/material_state_set_extension.dart';
import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchValue = true;
  bool _isEnabled = true;
  Color? _activeColor;
  Color? _activeTrackColor;
  Color? _inactiveTrackColor;
  Color? _inactiveThumbColor;

  void _onChange(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Switch',
          child: Switch(
            value: _switchValue,
            activeColor: _activeColor,
            activeTrackColor: _activeTrackColor,
            inactiveTrackColor: _inactiveTrackColor,
            inactiveThumbColor: _inactiveThumbColor,
            thumbIcon: MaterialStateProperty.resolveWith(
              (states) => states.isSelected //
                  ? const Icon(Icons.check_outlined)
                  : const Icon(Icons.close_outlined),
            ),
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'Switch.adaptive',
          child: Switch.adaptive(
            value: _switchValue,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
      ],
      options: [
        const Text('Enabled'),
        Switch(
          value: _isEnabled,
          onChanged: (value) {
            setState(() {
              _isEnabled = value;
            });
          },
        ),
        const Text('Active Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _activeColor,
            onSelectionChanged: (value) {
              setState(() {
                _activeColor = value;
              });
            },
          ),
        ),
        const Text('Active Track Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _activeTrackColor,
            onSelectionChanged: (value) {
              setState(() {
                _activeTrackColor = value;
              });
            },
          ),
        ),
        const Text('Inactive Track Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _inactiveTrackColor,
            onSelectionChanged: (value) {
              setState(() {
                _inactiveTrackColor = value;
              });
            },
          ),
        ),
        const Text('Inactive Thumb Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _inactiveThumbColor,
            onSelectionChanged: (value) {
              setState(() {
                _inactiveThumbColor = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
