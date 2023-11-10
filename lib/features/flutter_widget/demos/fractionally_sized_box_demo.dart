import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class FractionallySizedBoxDemo extends StatefulWidget {
  const FractionallySizedBoxDemo({super.key});

  @override
  State<FractionallySizedBoxDemo> createState() => _FractionallySizedBoxDemoState();
}

class _FractionallySizedBoxDemoState extends State<FractionallySizedBoxDemo> {
  double _widthFactor = 0.5;
  double _heightFactor = 0.5;
  AlignmentDirectional _alignment = AlignmentDirectional.center;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'FractionallySizedBox',
          child: SizedBox.square(
            dimension: 200,
            child: OutlinedBox(
              child: FractionallySizedBox(
                widthFactor: _widthFactor,
                heightFactor: _heightFactor,
                alignment: _alignment,
                child: ColoredBox(
                  color: theme.colorScheme.primaryContainer,
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('widthFactor: $_widthFactor'),
        Slider(
          value: _widthFactor,
          min: 0,
          max: 1,
          divisions: 10,
          label: _widthFactor.toStringAsFixed(2),
          onChanged: (value) {
            setState(() {
              _widthFactor = value;
            });
          },
        ),
        Text('heightFactor: $_heightFactor'),
        Slider(
          value: _heightFactor,
          min: 0,
          max: 1,
          divisions: 10,
          label: _heightFactor.toStringAsFixed(2),
          onChanged: (value) {
            setState(() {
              _heightFactor = value;
            });
          },
        ),
        const Text('Alignment'),
        AlignmentDirectionalButtonGroup(
          selected: _alignment,
          onChanged: (value) {
            setState(() {
              _alignment = value;
            });
          },
        ),
      ],
    );
  }
}
