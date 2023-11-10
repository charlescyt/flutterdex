import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class TextButtonDemo extends StatefulWidget {
  const TextButtonDemo({super.key});

  @override
  State<TextButtonDemo> createState() => _TextButtonDemoState();
}

class _TextButtonDemoState extends State<TextButtonDemo> {
  bool _isEnabled = true;

  void _onPressed() {
    showFloatingSnackBar(
      context: context,
      message: 'TextButton pressed',
    );
  }

  void _onLongPress() {
    showFloatingSnackBar(
      context: context,
      message: 'TextButton long pressed',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'TextButton',
          child: TextButton(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            child: const Text('TextButton'),
          ),
        ),
        Section(
          label: 'TextButton',
          child: TextButton.icon(
            onPressed: _isEnabled ? _onPressed : null,
            onLongPress: _isEnabled ? _onLongPress : null,
            icon: const Icon(Icons.flutter_dash_outlined),
            label: const Text('TextButton.icon'),
          ),
        ),
        Section(
          label: 'TextButton (customized style)',
          child: TextButton(
            style: TextButton.styleFrom(
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
            child: const Text('TextButton'),
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
