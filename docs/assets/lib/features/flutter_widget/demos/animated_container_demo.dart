import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  static const options = [
    ((
      alignment: Alignment.topLeft,
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    )),
    ((
      alignment: Alignment.center,
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    )),
    ((
      alignment: Alignment.bottomRight,
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
    )),
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
          label: 'AnimatedContainer',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  alignment: options[_index].alignment,
                  width: options[_index].width,
                  height: options[_index].height,
                  decoration: options[_index].decoration,
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 75),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Alignment: ${options[_index].alignment}'),
        Text('Width: ${options[_index].width}'),
        Text('Height: ${options[_index].height}'),
        Text('Decoration: ${options[_index].decoration}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Container'),
        ),
      ],
    );
  }
}
