import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class SizedBoxDemo extends StatefulWidget {
  const SizedBoxDemo({super.key});

  @override
  State<SizedBoxDemo> createState() => _SizedBoxDemoState();
}

class _SizedBoxDemoState extends State<SizedBoxDemo> {
  double _height = 100;
  double _width = 100;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'SizedBox',
          child: SizedBox(
            width: _width,
            height: _height,
            child: OutlinedBox(
              child: ColoredBox(color: theme.colorScheme.primaryContainer),
            ),
          ),
        ),
        Section(
          label: 'SizedBox.expanded',
          child: SizedBox(
            width: 200,
            height: 100,
            child: OutlinedBox(
              child: ColoredBox(
                color: theme.colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox.expand(
                    child: OutlinedBox(
                      child: ColoredBox(
                        color: theme.colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Section(
          label: 'SizedBox.shrink',
          child: SizedBox.square(
            dimension: 100,
            child: OutlinedBox(
              child: ColoredBox(
                color: theme.colorScheme.primaryContainer,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                    ),
                    child: SizedBox.shrink(
                      child: OutlinedBox(
                        child: ColoredBox(color: theme.colorScheme.secondaryContainer),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Section(
          label: 'SizedBox.fromSize',
          child: SizedBox.fromSize(
            size: const Size(80, 60),
            child: OutlinedBox(
              child: ColoredBox(color: theme.colorScheme.primaryContainer),
            ),
          ),
        ),
        Section(
          label: 'SizedBox.square',
          child: SizedBox.square(
            dimension: 100,
            child: OutlinedBox(
              child: ColoredBox(color: theme.colorScheme.primaryContainer),
            ),
          ),
        ),
      ],
      options: [
        Text('Width: $_width'),
        Slider(
          value: _width,
          min: 0,
          max: 200,
          divisions: 10,
          label: _width.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _width = value;
            });
          },
        ),
        Text('Height: $_height'),
        Slider(
          value: _height,
          min: 0,
          max: 200,
          divisions: 10,
          label: _height.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _height = value;
            });
          },
        ),
      ],
    );
  }
}
