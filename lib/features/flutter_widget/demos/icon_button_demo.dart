import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class IconButtonDemo extends StatefulWidget {
  const IconButtonDemo({super.key});

  @override
  State<IconButtonDemo> createState() => _IconButtonDemoState();
}

class _IconButtonDemoState extends State<IconButtonDemo> {
  bool _isEnabled = true;
  double _iconSize = 24;
  bool _isSelected = false;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'IconButton pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'IconButton',
          child: IconButton(
            iconSize: _iconSize,
            isSelected: _isSelected,
            onPressed: _isEnabled ? _onPressed : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            selectedIcon: const Icon(Icons.check_outlined),
          ),
        ),
        Section(
          label: 'IconButton.filled',
          child: IconButton.filled(
            iconSize: _iconSize,
            isSelected: _isSelected,
            onPressed: _isEnabled ? _onPressed : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            selectedIcon: const Icon(Icons.check_outlined),
          ),
        ),
        Section(
          label: 'IconButton.filledTonal',
          child: IconButton.filledTonal(
            iconSize: _iconSize,
            isSelected: _isSelected,
            onPressed: _isEnabled ? _onPressed : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            selectedIcon: const Icon(Icons.check_outlined),
          ),
        ),
        Section(
          label: 'IconButton.outlined',
          child: IconButton.outlined(
            iconSize: _iconSize,
            isSelected: _isSelected,
            onPressed: _isEnabled ? _onPressed : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            selectedIcon: const Icon(Icons.check_outlined),
          ),
        ),
      ],
      options: [
        const Text('Is enabled'),
        Switch(
          value: _isEnabled,
          onChanged: (value) {
            setState(() {
              _isEnabled = value;
            });
          },
        ),
        Text('Icon Size: $_iconSize'),
        Slider(
          value: _iconSize,
          min: 16,
          max: 48,
          divisions: 4,
          label: _iconSize.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _iconSize = value;
            });
          },
        ),
        const Text('Is selected'),
        Switch(
          value: _isSelected,
          onChanged: (value) {
            setState(() {
              _isSelected = value;
            });
          },
        ),
      ],
    );
  }
}
