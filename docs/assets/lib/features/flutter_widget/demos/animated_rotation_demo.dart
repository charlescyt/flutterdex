import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedRotationDemo extends StatefulWidget {
  const AnimatedRotationDemo({super.key});

  @override
  State<AnimatedRotationDemo> createState() => _AnimatedRotationDemoState();
}

class _AnimatedRotationDemoState extends State<AnimatedRotationDemo> {
  double _turns = 0;
  bool _isAnimating = false;

  void _animate() {
    setState(() {
      _turns += 0.25;
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
          label: 'AnimatedRotation',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedRotation(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  turns: _turns,
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 150),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Turns: $_turns'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Rotation'),
        ),
      ],
    );
  }
}
