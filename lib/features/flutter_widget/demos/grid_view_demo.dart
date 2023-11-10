import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  EdgeInsets _padding = const EdgeInsets.all(8);
  double _childAspectRatio = 1;
  double _mainAxisSpacing = 8;
  double _crossAxisSpacing = 8;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'GridView',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: GridView(
                padding: _padding,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  mainAxisSpacing: _mainAxisSpacing,
                  crossAxisSpacing: _crossAxisSpacing,
                  childAspectRatio: _childAspectRatio,
                ),
                children: [
                  for (var i = 0; i < 20; i++) //
                    _Box(label: '$i'),
                ],
              ),
            ),
          ),
        ),
        Section(
          label: 'GridView.count',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: GridView.count(
                crossAxisCount: 5,
                padding: _padding,
                mainAxisSpacing: _mainAxisSpacing,
                crossAxisSpacing: _crossAxisSpacing,
                childAspectRatio: _childAspectRatio,
                children: [
                  for (var i = 0; i < 20; i++) //
                    _Box(label: '$i'),
                ],
              ),
            ),
          ),
        ),
        Section(
          label: 'GridView.builder',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                padding: _padding,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: _Box(label: '$index'),
                  );
                },
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('Padding'),
        ButtonGroup(
          selected: _padding,
          items: const [
            EdgeInsets.zero,
            EdgeInsets.all(8),
            EdgeInsets.all(16),
          ],
          labelBuilder: (padding) {
            return Text(padding.toString());
          },
          onChanged: (padding) {
            setState(() {
              _padding = padding;
            });
          },
        ),
        Text('Main Axis Spacing: ${_mainAxisSpacing.toStringAsFixed(2)}'),
        Slider(
          value: _mainAxisSpacing,
          min: 0,
          max: 32,
          divisions: 8,
          label: _mainAxisSpacing.toStringAsFixed(2),
          onChanged: (value) {
            setState(() {
              _mainAxisSpacing = value;
            });
          },
        ),
        Text('Cross Axis Spacing: ${_crossAxisSpacing.toStringAsFixed(2)}'),
        Slider(
          value: _crossAxisSpacing,
          min: 0,
          max: 32,
          divisions: 8,
          label: _crossAxisSpacing.toStringAsFixed(2),
          onChanged: (value) {
            setState(() {
              _crossAxisSpacing = value;
            });
          },
        ),
        Text('Child Aspect Ratio: ${_childAspectRatio.toStringAsFixed(2)}'),
        Slider(
          value: _childAspectRatio,
          min: 0.5,
          max: 2,
          divisions: 6,
          label: _childAspectRatio.toStringAsFixed(2),
          onChanged: (value) {
            setState(() {
              _childAspectRatio = value;
            });
          },
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: theme.colorScheme.primaryContainer,
      ),
      child: Center(
        child: Text(label),
      ),
    );
  }
}
