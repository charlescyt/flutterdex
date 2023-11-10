import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  const AnimatedPaddingDemo({super.key});

  @override
  State<AnimatedPaddingDemo> createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  static const options = [
    EdgeInsets.zero,
    EdgeInsets.all(16),
    EdgeInsets.all(32),
    EdgeInsets.all(64),
  ];

  int _index = 0;
  bool _isAnimating = false;

  void _animate() {
    setState(() {
      _index = (_index + 1) % options.length;
      _isAnimating = true;
    });
  }

  void _onEnd() {
    setState(() {
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'AnimatedPadding',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: AnimatedPadding(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                padding: options[_index],
                onEnd: _onEnd,
                child: ColoredBox(
                  color: theme.colorScheme.primaryContainer,
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Padding: ${options[_index]}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Padding'),
        ),
      ],
    );
  }
}
