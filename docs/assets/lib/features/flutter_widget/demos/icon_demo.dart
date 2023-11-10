import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({super.key});

  @override
  State<IconDemo> createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  bool _withColor = false;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Icon',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.settings,
                color: _withColor ? Colors.green : null,
                semanticLabel: 'Search',
              ),
              Icon(
                Icons.home,
                color: _withColor ? Colors.blue : null,
                size: 48,
                semanticLabel: 'Home',
              ),
              Icon(
                Icons.favorite,
                color: _withColor ? Colors.red : null,
                size: 72,
                semanticLabel: 'Favorite',
              ),
            ],
          ),
        ),
      ],
      options: [
        const Text('With Color'),
        Switch(
          value: _withColor,
          onChanged: (value) {
            setState(() {
              _withColor = value;
            });
          },
        ),
      ],
    );
  }
}
