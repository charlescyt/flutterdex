import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class OutlinedButtonDemo extends StatefulWidget {
  const OutlinedButtonDemo({super.key});

  @override
  State<OutlinedButtonDemo> createState() => _OutlinedButtonDemoState();
}

class _OutlinedButtonDemoState extends State<OutlinedButtonDemo> {
  bool _isEnabled = true;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'OutlinedButton pressed',
    );
  }

  void _onLongPress() {
    showFloatingSnackBar(
      context: context,
      message: 'OutlinedButton long pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'OutlinedButton',
          child: OutlinedButton(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('OutlinedButton'),
          ),
        ),
        Section(
          label: 'OutlinedButton.icon',
          child: OutlinedButton.icon(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            label: const Text('OutlinedButton.icon'),
          ),
        ),
        Section(
          label: 'OutlinedButton (customized style)',
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
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
            child: const Text('OutlinedButton'),
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
