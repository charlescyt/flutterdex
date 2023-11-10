import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class AlignDemo extends StatefulWidget {
  const AlignDemo({super.key});

  @override
  State<AlignDemo> createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo> {
  TextDirection _textDirection = TextDirection.rtl;
  Alignment _alignment = Alignment.center;
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.center;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Align (with Alignment)',
          child: SizedBox.square(
            dimension: 180,
            child: OutlinedBox(
              child: Directionality(
                textDirection: _textDirection,
                child: Align(
                  alignment: _alignment,
                  child: const FlutterLogo(size: 60),
                ),
              ),
            ),
          ),
        ),
        Section(
          label: 'Align (with AlignmentDirectional)',
          child: SizedBox.square(
            dimension: 180,
            child: OutlinedBox(
              child: Directionality(
                textDirection: _textDirection,
                child: Align(
                  alignment: _alignmentDirectional,
                  child: const FlutterLogo(size: 60),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('TextDirection'),
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
        const Text('Alignment'),
        AlignmentButtonGroup(
          selected: _alignment,
          onChanged: (value) {
            setState(() {
              _alignment = value;
            });
          },
        ),
        const Text('AlignmentDirectional'),
        AlignmentDirectionalButtonGroup(
          selected: _alignmentDirectional,
          onChanged: (value) {
            setState(() {
              _alignmentDirectional = value;
            });
          },
        ),
      ],
    );
  }
}
