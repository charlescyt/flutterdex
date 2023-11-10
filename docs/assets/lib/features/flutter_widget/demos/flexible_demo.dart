import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({super.key});

  @override
  State<FlexibleDemo> createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  double _purpleBoxWidth = 50;
  int _redBoxFlex = 3;
  int _greenBoxFlex = 2;
  int _blueBoxFlex = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Flexible',
          child: SizedBox(
            width: 300,
            height: 100,
            child: OutlinedBox(
              child: Row(
                children: [
                  Flexible(
                    flex: _redBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        'F\nFlex: $_redBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: _greenBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        'F\nFlex: $_greenBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: _blueBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'F\nFlex: $_blueBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Section(
          label: 'Flexible (with fixed width)',
          child: SizedBox(
            width: 300,
            height: 100,
            child: OutlinedBox(
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      width: _purpleBoxWidth,
                      child: Text(
                        'Width: $_purpleBoxWidth',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: _greenBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        'F\nFlex: $_greenBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: _blueBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'F\nFlex: $_blueBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      options: [
        Text('Purple Box Width: $_purpleBoxWidth'),
        Slider(
          value: _purpleBoxWidth,
          min: 25,
          max: 200,
          divisions: 7,
          label: _purpleBoxWidth.toString(),
          onChanged: (value) {
            setState(() {
              _purpleBoxWidth = value;
            });
          },
        ),
        Text('Red Box Flex: $_redBoxFlex'),
        Slider(
          value: _redBoxFlex.toDouble(),
          min: 1,
          max: 3,
          divisions: 2,
          label: _redBoxFlex.toString(),
          onChanged: (value) {
            setState(() {
              _redBoxFlex = value.toInt();
            });
          },
        ),
        Text('Green Box Flex: $_greenBoxFlex'),
        Slider(
          value: _greenBoxFlex.toDouble(),
          min: 1,
          max: 3,
          divisions: 2,
          label: _greenBoxFlex.toString(),
          onChanged: (value) {
            setState(() {
              _greenBoxFlex = value.toInt();
            });
          },
        ),
        Text('Blue Box Flex: $_blueBoxFlex'),
        Slider(
          value: _blueBoxFlex.toDouble(),
          min: 1,
          max: 3,
          divisions: 2,
          label: _blueBoxFlex.toString(),
          onChanged: (value) {
            setState(() {
              _blueBoxFlex = value.toInt();
            });
          },
        ),
      ],
    );
  }
}
