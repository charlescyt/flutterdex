import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class FilledButtonDemo extends StatefulWidget {
  const FilledButtonDemo({super.key});

  @override
  State<FilledButtonDemo> createState() => _FilledButtonDemoState();
}

class _FilledButtonDemoState extends State<FilledButtonDemo> {
  bool _isEnabled = true;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'FilledButton pressed',
    );
  }

  void _onLongPress() {
    showFloatingSnackBar(
      context: context,
      message: 'FilledButton long pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'FilledButton',
          child: FilledButton(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('ElevatedButton'),
          ),
        ),
        Section(
          label: 'FilledButton.icon',
          child: FilledButton.icon(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            label: const Text('ElevatedButton.icon'),
          ),
        ),
        Section(
          label: 'FilledButton.tonal',
          child: FilledButton.tonal(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('ElevatedButton.tonal'),
          ),
        ),
        Section(
          label: 'FilledButton.tonalIcon',
          child: FilledButton.tonalIcon(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            label: const Text('ElevatedButton.tonalIcon'),
          ),
        ),
        Section(
          label: 'FilledButton (customized style)',
          child: FilledButton(
            style: FilledButton.styleFrom(
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
            child: const Text('FilledButton'),
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
