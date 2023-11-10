import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class RowDemo extends StatefulWidget {
  const RowDemo({super.key});

  @override
  State<RowDemo> createState() => _RowDemoState();
}

class _RowDemoState extends State<RowDemo> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DemoScaffold(
        demos: [
          Section(
            label: 'Row',
            child: SizedBox.square(
              dimension: 300,
              child: OutlinedBox(
                child: Row(
                  mainAxisAlignment: _mainAxisAlignment,
                  crossAxisAlignment: _crossAxisAlignment,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      width: 50,
                      height: 200,
                      child: const Text('1'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      width: 50,
                      height: 300,
                      child: const Text('2'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: 50,
                      height: 100,
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
      ),
    );
  }
}
