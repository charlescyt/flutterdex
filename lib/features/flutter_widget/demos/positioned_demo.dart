import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class PositionedDemo extends StatefulWidget {
  const PositionedDemo({super.key});

  @override
  State<PositionedDemo> createState() => _PositionedDemoState();
}

class _PositionedDemoState extends State<PositionedDemo> {
  TextDirection _textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Positioned',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned.fill(
                    child: SizedBox.square(
                      dimension: 250,
                      child: OutlinedBox(
                        child: ColoredBox(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'Positioned.fill',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: _textDirection,
                    end: -50,
                    top: 10,
                    child: const SizedBox(
                      width: 180,
                      height: 100,
                      child: OutlinedBox(
                        child: ColoredBox(
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              'Positioned.directional\n(end: -50, top: 10)',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fromRect(
                    rect: const Rect.fromLTWH(-20, 170, 300, 100),
                    child: const SizedBox.square(
                      dimension: 50,
                      child: OutlinedBox(
                        child: ColoredBox(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Positioned.fromRect\n(rect: Rect.fromLTWH(-20, 170, 200, 100))',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
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
        const Text('Text Direction'),
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
      ],
    );
  }
}
