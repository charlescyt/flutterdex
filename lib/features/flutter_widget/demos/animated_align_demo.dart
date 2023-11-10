import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AnimatedAlignDemo extends StatefulWidget {
  const AnimatedAlignDemo({super.key});

  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  static const alignmentOptions = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  static const alignmentDirectionalOptions = [
    AlignmentDirectional.topStart,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.topEnd,
    AlignmentDirectional.centerStart,
    AlignmentDirectional.center,
    AlignmentDirectional.centerEnd,
    AlignmentDirectional.bottomStart,
    AlignmentDirectional.bottomCenter,
    AlignmentDirectional.bottomEnd,
  ];

  TextDirection _textDirection = TextDirection.rtl;
  int _index = 0;
  bool _isAnimating = false;

  void _animate() {
    setState(() {
      _index = (_index + 1) % alignmentOptions.length;
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
          label: 'AnimatedAlign',
          child: SizedBox.square(
            dimension: 180,
            child: OutlinedBox(
              child: Directionality(
                textDirection: _textDirection,
                child: AnimatedAlign(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  alignment: alignmentOptions[_index],
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 60),
                ),
              ),
            ),
          ),
        ),
        Section(
          label: 'AnimatedAlign',
          child: SizedBox.square(
            dimension: 180,
            child: OutlinedBox(
              child: Directionality(
                textDirection: _textDirection,
                child: AnimatedAlign(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  alignment: alignmentDirectionalOptions[_index],
                  onEnd: _onEnd,
                  child: const FlutterLogo(size: 60),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('TextDirection'),
        ButtonGroup<TextDirection>(
          selected: _textDirection,
          items: TextDirection.values,
          labelBuilder: (item) {
            return Text(item.name);
          },
          onChanged: (value) {
            setState(() {
              _textDirection = value;
            });
          },
        ),
        Text('Alignment: ${alignmentOptions[_index]}'),
        Text('AlignmentDirectional: ${alignmentDirectionalOptions[_index]}'),
        ElevatedButton(
          onPressed: _isAnimating ? null : _animate,
          child: _isAnimating //
              ? const Text('Animating...')
              : const Text('Animate Align'),
        ),
      ],
    );
  }
}
