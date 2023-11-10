import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class SpacerDemo extends StatefulWidget {
  const SpacerDemo({super.key});

  @override
  State<SpacerDemo> createState() => _SpacerDemoState();
}

class _SpacerDemoState extends State<SpacerDemo> {
  int _leftSpacerFlex = 1;
  int _rightSpacerFlex = 1;
  int _redBoxFlex = 3;
  int _greenBoxFlex = 2;
  int _blueBoxFlex = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Spacer',
          child: SizedBox(
            height: 100,
            child: OutlinedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: _redBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        'E\nFlex: $_redBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(flex: _leftSpacerFlex),
                  Expanded(
                    flex: _greenBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text(
                        'E\nFlex: $_greenBoxFlex',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(flex: _rightSpacerFlex),
                  Expanded(
                    flex: _blueBoxFlex,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'E\nFlex: $_blueBoxFlex',
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
        Text('Left Spacer Flex: $_leftSpacerFlex'),
        Slider(
          value: _leftSpacerFlex.toDouble(),
          min: 1,
          max: 3,
          divisions: 2,
          label: _leftSpacerFlex.toString(),
          onChanged: (value) {
            setState(() {
              _leftSpacerFlex = value.toInt();
            });
          },
        ),
        Text('Right Spacer Flex: $_rightSpacerFlex'),
        Slider(
          value: _rightSpacerFlex.toDouble(),
          min: 1,
          max: 3,
          divisions: 2,
          label: _leftSpacerFlex.toString(),
          onChanged: (value) {
            setState(() {
              _rightSpacerFlex = value.toInt();
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
        Text('Blue Flex: $_blueBoxFlex'),
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
