import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class ElevatedButtonDemo extends StatefulWidget {
  const ElevatedButtonDemo({super.key});

  @override
  State<ElevatedButtonDemo> createState() => _ElevatedButtonDemoState();
}

class _ElevatedButtonDemoState extends State<ElevatedButtonDemo> {
  bool _isEnabled = true;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'ElevatedButton pressed',
    );
  }

  void _onLongPress() {
    showFloatingSnackBar(
      context: context,
      message: 'ElevatedButton long pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'ElevatedButton',
          child: ElevatedButton(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('ElevatedButton'),
          ),
        ),
        Section(
          label: 'ElevatedButton.icon',
          child: ElevatedButton.icon(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            label: const Text('ElevatedButton.icon'),
          ),
        ),
        Section(
          label: 'ElevatedButton (customized style)',
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              padding: const EdgeInsets.all(24),
              minimumSize: const Size(300, 80),
              foregroundColor: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.onPrimary,
              disabledForegroundColor: theme.colorScheme.primary.withOpacity(0.5),
              disabledBackgroundColor: theme.colorScheme.onPrimary.withOpacity(0.5),
              side: const BorderSide(color: Colors.black, width: 2),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('ElevatedButton'),
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
      ],
    );
  }
}
