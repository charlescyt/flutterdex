import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;
  TextDirection _textDirection = TextDirection.ltr;
  StackFit _stackFit = StackFit.loose;
  Clip _clipBehavior = Clip.hardEdge;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Stack',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Stack(
                alignment: _alignmentDirectional,
                textDirection: _textDirection,
                fit: _stackFit,
                clipBehavior: _clipBehavior,
                children: const [
                  SizedBox.square(
                    dimension: 250,
                    child: OutlinedBox(
                      child: ColoredBox(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox.square(
                    dimension: 150,
                    child: OutlinedBox(
                      child: ColoredBox(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox.square(
                      dimension: 50,
                      child: OutlinedBox(
                        child: ColoredBox(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Center',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: OutlinedBox(
                      child: ColoredBox(
                        color: Colors.purple,
                        child: Text('Positioned (top: 20, left: 20)'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -50,
                    child: SizedBox.square(
                      dimension: 100,
                      child: OutlinedBox(
                        child: ColoredBox(
                          color: Colors.orange,
                          child: Center(
                            child: Text(
                              'Positioned out of bounds',
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
        const Text('Alignment Directional'),
        AlignmentDirectionalButtonGroup(
          selected: _alignmentDirectional,
          onChanged: (value) {
            setState(() {
              _alignmentDirectional = value;
            });
          },
        ),
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
        const Text('Stack Fit'),
        ButtonGroup<StackFit>(
          selected: _stackFit,
          items: StackFit.values,
          labelBuilder: (item) {
            return Text(item.name);
          },
          onChanged: (value) {
            setState(() {
              _stackFit = value;
            });
          },
        ),
        const Text('Clip Behavior'),
        ButtonGroup<Clip>(
          selected: _clipBehavior,
          items: Clip.values,
          labelBuilder: (item) {
            return Text(item.name);
          },
          onChanged: (value) {
            setState(() {
              _clipBehavior = value;
            });
          },
        ),
      ],
    );
  }
}
