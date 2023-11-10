import 'package:flutter/cupertino.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoButtonDemo extends StatefulWidget {
  const CupertinoButtonDemo({super.key});

  @override
  State<CupertinoButtonDemo> createState() => _CupertinoButtonDemoState();
}

class _CupertinoButtonDemoState extends State<CupertinoButtonDemo> {
  bool _isEnabled = true;
  EdgeInsets? _padding;
  double _pressedOpacity = 0.4;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'CupertinoButton pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoButton',
          child: CupertinoButton(
            padding: _padding,
            pressedOpacity: _pressedOpacity,
            onPressed: _isEnabled ? _onPressed : null,
            child: const Text('CupertinoButton'),
          ),
        ),
        Section(
          label: 'CupertinoButton.filled',
          child: CupertinoButton.filled(
            padding: _padding,
            pressedOpacity: _pressedOpacity,
            onPressed: _isEnabled ? _onPressed : null,
            child: const Text('CupertinoButton.filled'),
          ),
        ),
      ],
      options: [
        const Text('Is enabled'),
        CupertinoSwitch(
          value: _isEnabled,
          onChanged: (value) {
            setState(() {
              _isEnabled = value;
            });
          },
        ),
        const Text('Padding'),
        ButtonGroup(
          selected: _padding,
          items: const [
            null,
            EdgeInsets.zero,
            EdgeInsets.all(8),
            EdgeInsets.all(16),
          ],
          labelBuilder: (value) {
            return value == null //
                ? const Text('Default')
                : Text(value.toString());
          },
          onChanged: (value) {
            setState(() {
              _padding = value;
            });
          },
        ),
        Text('Pressed opacity: ${_pressedOpacity.toStringAsFixed(1)}'),
        CupertinoSlider(
          value: _pressedOpacity,
          min: 0,
          max: 1,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              _pressedOpacity = value;
            });
          },
        ),
      ],
    );
  }
}
