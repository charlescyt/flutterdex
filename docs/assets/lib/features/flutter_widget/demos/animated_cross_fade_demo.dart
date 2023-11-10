import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({super.key});

  @override
  State<AnimatedCrossFadeDemo> createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _showFirst = true;

  void _animate() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'AnimatedCrossFade',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedCrossFade(
                  duration: const Duration(seconds: 1),
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                  firstChild: const FlutterLogo(size: 150),
                  secondChild: SizedBox.square(
                    dimension: 150,
                    child: ColoredBox(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                  crossFadeState: _showFirst //
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        ElevatedButton(
          onPressed: _animate,
          child: const Text('Animate CrossFade'),
        ),
      ],
    );
  }
}
