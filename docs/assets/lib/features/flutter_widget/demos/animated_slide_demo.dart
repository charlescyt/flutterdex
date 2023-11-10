import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedSlideDemo extends StatefulWidget {
  const AnimatedSlideDemo({super.key});

  @override
  State<AnimatedSlideDemo> createState() => _AnimatedSlideDemoState();
}

class _AnimatedSlideDemoState extends State<AnimatedSlideDemo> {
  static const options = [
    Offset.zero,
    Offset(0.1, 0.1),
    Offset(-0.3, -0.3),
    Offset(0, 0.5),
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
          label: 'AnimatedSlide',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedSlide(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  offset: options[_index],
                  onEnd: _onEnd,
                  child: SizedBox.square(
                    dimension: 150,
                    child: ColoredBox(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Offset: ${options[_index]}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Slide'),
        ),
      ],
    );
  }
}
