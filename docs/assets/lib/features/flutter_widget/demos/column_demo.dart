import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class ColumnDemo extends StatefulWidget {
  const ColumnDemo({super.key});

  @override
  State<ColumnDemo> createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Column',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Column(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    width: 200,
                    height: 50,
                    child: const Text('1'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    width: 300,
                    height: 50,
                    child: const Text('2'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: 100,
                    height: 50,
                    child: const Text('3'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('Main Axis Alignment'),
        ButtonGroup(
          selected: _mainAxisAlignment,
          items: MainAxisAlignment.values,
          labelBuilder: (value) {
            return Text(value.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _mainAxisAlignment = value;
            });
          },
        ),
        const Text('Cross Axis Alignment'),
        ButtonGroup(
          selected: _crossAxisAlignment,
          items: const [
            CrossAxisAlignment.start,
            CrossAxisAlignment.center,
            CrossAxisAlignment.end,
          ],
          labelBuilder: (value) {
            return Text(value.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _crossAxisAlignment = value;
            });
          },
        ),
      ],
    );
  }
}
