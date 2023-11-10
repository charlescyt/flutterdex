import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  static const options = [1.0, 0.5, 0.0];

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
          label: 'AnimatedOpacity',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  opacity: options[_index],
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 150),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Opacity: ${options[_index]}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Opacity'),
        ),
      ],
    );
  }
}
