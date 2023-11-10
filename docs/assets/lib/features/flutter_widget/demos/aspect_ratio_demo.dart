import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AspectRatioDemo extends StatefulWidget {
  const AspectRatioDemo({super.key});

  @override
  State<AspectRatioDemo> createState() => _AspectRatioDemoState();
}

class _AspectRatioDemoState extends State<AspectRatioDemo> {
  double _aspectRatio = 0.25;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'AspectRatio',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: AspectRatio(
                  aspectRatio: _aspectRatio,
                  child: Placeholder(
                    child: ColoredBox(
                      color: theme.colorScheme.primaryContainer,
                      child: const Center(
                        child: Text(
                          'Aspect Ratio',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Aspect Ratio: ${_aspectRatio.toStringAsFixed(2)}'),
        Slider(
          value: _aspectRatio,
          min: 0.25,
          max: 2,
          divisions: 7,
          label: _aspectRatio.toStringAsFixed(2),
          onChanged: (value) {
            setState(() => _aspectRatio = value);
          },
        ),
      ],
    );
  }
}
