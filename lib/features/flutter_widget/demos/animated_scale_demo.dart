import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedScaleDemo extends StatefulWidget {
  const AnimatedScaleDemo({super.key});

  @override
  State<AnimatedScaleDemo> createState() => _AnimatedScaleDemoState();
}

class _AnimatedScaleDemoState extends State<AnimatedScaleDemo> {
  static const options = [1.0, 0.5, 2.0];

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
          label: 'AnimatedScale',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedScale(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  scale: options[_index],
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 150),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Scale: ${options[_index]}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Scale'),
        ),
      ],
    );
  }
}
