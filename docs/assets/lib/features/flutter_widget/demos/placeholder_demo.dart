import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class PlaceholderDemo extends StatefulWidget {
  const PlaceholderDemo({super.key});

  @override
  State<PlaceholderDemo> createState() => _PlaceholderDemoState();
}

class _PlaceholderDemoState extends State<PlaceholderDemo> {
  double _bluePlaceholderFallbackHeight = 400;
  double _strokeWidth = 2;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Placeholder',
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                Placeholder(
                  color: Colors.blue,
                  strokeWidth: _strokeWidth,
                  fallbackHeight: _bluePlaceholderFallbackHeight,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Placeholder(
                          color: Colors.red,
                          strokeWidth: _strokeWidth,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Placeholder(
                          color: Colors.green,
                          strokeWidth: _strokeWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      options: [
        Text('Blue Placeholder fallback height: ${_bluePlaceholderFallbackHeight.toStringAsFixed(0)}'),
        Slider(
          value: _bluePlaceholderFallbackHeight,
          min: 100,
          max: 400,
          divisions: 3,
          label: _bluePlaceholderFallbackHeight.toStringAsFixed(0),
          onChanged: (value) {
            setState(() {
              _bluePlaceholderFallbackHeight = value;
            });
          },
        ),
        Text('Stroke width: ${_strokeWidth.toStringAsFixed(1)}'),
        Slider(
          value: _strokeWidth,
          min: 1,
          max: 10,
          divisions: 9,
          label: _strokeWidth.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _strokeWidth = value;
            });
          },
        ),
      ],
    );
  }
}
