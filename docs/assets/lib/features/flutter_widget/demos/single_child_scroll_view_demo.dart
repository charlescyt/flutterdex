import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class SingleChildScrollViewDemo extends StatefulWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  State<SingleChildScrollViewDemo> createState() => _SingleChildScrollViewDemoState();
}

class _SingleChildScrollViewDemoState extends State<SingleChildScrollViewDemo> {
  ScrollPhysics _physics = const BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'SingleChildScrollView',
          child: SizedBox(
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: _physics,
              padding: const EdgeInsets.all(16),
              child: OutlinedBox(
                child: Row(
                  children: [
                    for (var i = 0; i < 20; i++)
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        child: Text('$i'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('ScrollPhysics'),
        ButtonGroup(
          selected: _physics,
          items: const [
            BouncingScrollPhysics(),
            ClampingScrollPhysics(),
          ],
          labelBuilder: (physics) {
            return Text(physics.runtimeType.toString());
          },
          onChanged: (physics) {
            setState(() {
              _physics = physics;
            });
          },
        ),
      ],
    );
  }
}
