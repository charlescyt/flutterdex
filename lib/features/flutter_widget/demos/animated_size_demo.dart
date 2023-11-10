import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedSizeDemo extends StatefulWidget {
  const AnimatedSizeDemo({super.key});

  @override
  State<AnimatedSizeDemo> createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo> {
  static const size = <double>[150, 200, 250, 300];

  int _index = 0;

  void _animate() {
    setState(() {
      _index = (_index + 1) % size.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'AnimatedSize',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedSize(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: FlutterLogo(size: size[_index]),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Size: ${size[_index]}'),
        ElevatedButton(
          onPressed: _animate,
          child: const Text('Animate Size'),
        ),
      ],
    );
  }
}
