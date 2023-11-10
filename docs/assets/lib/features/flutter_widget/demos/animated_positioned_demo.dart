import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  const AnimatedPositionedDemo({super.key});

  @override
  State<AnimatedPositionedDemo> createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  static const options = [
    ((top: 0.0, left: 0.0)),
    ((top: 0.0, left: 150.0)),
    ((top: 150.0, left: 150.0)),
    ((top: 150.0, left: 0.0)),
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
    return DemoScaffold(
      demos: [
        Section(
          label: 'AnimatedPositioned',
          child: Stack(
            children: [
              const SizedBox.square(
                dimension: 300,
                child: OutlinedBox(),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                top: options[_index].top,
                left: options[_index].left,
                onEnd: _onEnd,
                child: const FlutterLogo(size: 150),
              ),
            ],
          ),
        ),
      ],
      options: [
        Text('Top: ${options[_index].top}'),
        Text('Left: ${options[_index].left}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Position'),
        ),
      ],
    );
  }
}
