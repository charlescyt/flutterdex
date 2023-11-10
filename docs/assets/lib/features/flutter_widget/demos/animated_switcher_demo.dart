import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  static const options = [100.0, 200.0, 300.0];

  int _index = 0;
  int _count = 0;

  void _animate() {
    setState(() {
      _index = (_index + 1) % options.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'AnimatedSwitcher',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: FlutterLogo(
                    key: ValueKey(_index),
                    size: options[_index],
                  ),
                ),
              ),
            ),
          ),
        ),
        Section(
          label: 'Counter with animation',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _count--;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 0.5),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '$_count',
                  key: ValueKey(_count),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
      options: [
        ElevatedButton(
          onPressed: _animate,
          child: const Text('Animate Switcher'),
        ),
      ],
    );
  }
}
