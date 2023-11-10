import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxValue = true;
  bool? _triStateCheckboxValue;
  bool _isEnabled = true;
  Color? _activeColor;
  Color? _checkColor;
  OutlinedBorder? _shape;

  void _onChange(bool? value) {
    if (value == null) return;
    setState(() {
      _checkboxValue = value;
    });
  }

  void _onTriStateCheckboxChange(bool? value) {
    setState(() {
      _triStateCheckboxValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Checkbox',
          child: Checkbox(
            value: _checkboxValue,
            activeColor: _activeColor,
            checkColor: _checkColor,
            shape: _shape,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'Checkbox (tristate)',
          child: Checkbox(
            tristate: true,
            value: _triStateCheckboxValue,
            activeColor: _activeColor,
            checkColor: _checkColor,
            shape: _shape,
            onChanged: _isEnabled ? _onTriStateCheckboxChange : null,
          ),
        ),
        Section(
          label: 'Checkbox.adaptive',
          child: Checkbox.adaptive(
            value: _checkboxValue,
            activeColor: _activeColor,
            checkColor: _checkColor,
            shape: _shape,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'Checkbox.adaptive (tristate)',
          child: Checkbox.adaptive(
            tristate: true,
            value: _triStateCheckboxValue,
            activeColor: _activeColor,
            checkColor: _checkColor,
            shape: _shape,
            onChanged: _isEnabled ? _onTriStateCheckboxChange : null,
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
        ColorSegmentedButton(
          selected: _activeColor,
          onSelectionChanged: (value) {
            setState(() {
              _activeColor = value;
            });
          },
        ),
        const Text('Check Color'),
        ColorSegmentedButton(
          selected: _checkColor,
          onSelectionChanged: (value) {
            setState(() {
              _checkColor = value;
            });
          },
        ),
        const Text('Shape'),
        ButtonGroup(
          selected: _shape,
          items: const [
            RoundedRectangleBorder(),
            CircleBorder(),
            StarBorder(),
          ],
          labelBuilder: (value) {
            return Text(value.runtimeType.toString());
          },
          onChanged: (value) {
            setState(() {
              _shape = value;
            });
          },
        ),
      ],
    );
  }
}
