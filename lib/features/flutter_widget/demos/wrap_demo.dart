import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({super.key});

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  Axis _direction = Axis.horizontal;
  double _spacing = 8;
  double _runSpacing = 8;
  WrapAlignment _alignment = WrapAlignment.start;
  WrapAlignment _runAlignment = WrapAlignment.start;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'Wrap',
          child: SizedBox(
            width: 300,
            height: 100,
            child: OutlinedBox(
              child: Wrap(
                direction: _direction,
                spacing: _spacing,
                runSpacing: _runSpacing,
                alignment: _alignment,
                runAlignment: _runAlignment,
                children: [
                  for (final wrapAlignment in WrapAlignment.values)
                    ColoredBox(
                      color: theme.colorScheme.primaryContainer,
                      child: Text(wrapAlignment.name.capitalize),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('Direction'),
        Center(
          child: SegmentedButton<Axis>(
            selected: {_direction},
            segments: [
              for (final axis in Axis.values)
                ButtonSegment(
                  value: axis,
                  label: Text(axis.name.capitalize),
                ),
            ],
            onSelectionChanged: (value) {
              setState(() {
                _direction = value.first;
              });
            },
          ),
        ),
        Text('Spacing: ${_spacing.toStringAsFixed(1)}'),
        Slider(
          value: _spacing,
          min: 0,
          max: 16,
          divisions: 4,
          label: _spacing.toString(),
          onChanged: (value) {
            setState(() {
              _spacing = value;
            });
          },
        ),
        Text('Run Spacing: ${_runSpacing.toStringAsFixed(1)}'),
        Slider(
          value: _runSpacing,
          min: 0,
          max: 16,
          divisions: 4,
          label: _runSpacing.toString(),
          onChanged: (value) {
            setState(() {
              _runSpacing = value;
            });
          },
        ),
        const Text('Alignment'),
        ButtonGroup(
          selected: _alignment,
          items: WrapAlignment.values,
          labelBuilder: (item) {
            return Text(item.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _alignment = value;
            });
          },
        ),
        const Text('Run Alignment'),
        ButtonGroup(
          selected: _runAlignment,
          items: WrapAlignment.values,
          labelBuilder: (item) {
            return Text(item.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _runAlignment = value;
            });
          },
        ),
      ],
    );
  }
}
