import 'package:flutter/material.dart';

import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CircularProgressIndicatorDemo extends StatefulWidget {
  const CircularProgressIndicatorDemo({super.key});

  @override
  State<CircularProgressIndicatorDemo> createState() => _CircularProgressIndicatorDemoState();
}

class _CircularProgressIndicatorDemoState extends State<CircularProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;
  Color? _color;
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'CircularProgressIndicator',
          child: CircularProgressIndicator(
            color: _color,
            backgroundColor: _backgroundColor,
          ),
        ),
        Section(
          label: 'CircularProgressIndicator (with value)',
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Text('Progress: ${(_controller.value * 100).toStringAsFixed(2)}%');
                },
              ),
              const SizedBox(height: 8),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: _controller.value,
                      valueColor: _colorAnimation,
                      backgroundColor: theme.dividerColor,
                      strokeWidth: 10,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _controller
                    ..reset()
                    ..forward();
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      ],
      options: [
        const Text('Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _color,
            onSelectionChanged: (value) {
              setState(() {
                _color = value;
              });
            },
          ),
        ),
        const Text('Background Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _backgroundColor,
            onSelectionChanged: (value) {
              setState(() {
                _backgroundColor = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
