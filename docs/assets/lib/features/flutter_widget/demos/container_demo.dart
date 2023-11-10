import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class ContainerDemo extends StatefulWidget {
  const ContainerDemo({super.key});

  @override
  State<ContainerDemo> createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  Alignment _alignment = Alignment.topLeft;
  EdgeInsets _margin = const EdgeInsets.all(16);
  EdgeInsets _padding = const EdgeInsets.all(16);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'Container',
          child: SizedBox.square(
            dimension: 300,
            child: OutlinedBox(
              child: Center(
                child: Container(
                  alignment: _alignment,
                  margin: _margin,
                  padding: _padding,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: const BorderRadius.all(Radius.circular(48)),
                    ),
                    child: const FlutterLogo(size: 150),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('Alignment'),
        AlignmentButtonGroup(
          selected: _alignment,
          onChanged: (value) {
            setState(() {
              _alignment = value;
            });
          },
        ),
        const Text('Margin'),
        ButtonGroup(
          selected: _margin,
          items: const [
            EdgeInsets.zero,
            EdgeInsets.all(8),
            EdgeInsets.all(16),
            EdgeInsets.all(32),
          ],
          labelBuilder: (value) {
            return Text(value.toString());
          },
          onChanged: (value) {
            setState(() {
              _margin = value;
            });
          },
        ),
        const Text('Padding'),
        ButtonGroup(
          selected: _padding,
          items: const [
            EdgeInsets.zero,
            EdgeInsets.all(8),
            EdgeInsets.all(16),
            EdgeInsets.all(32),
          ],
          labelBuilder: (value) {
            return Text(value.toString());
          },
          onChanged: (value) {
            setState(() {
              _padding = value;
            });
          },
        ),
      ],
    );
  }
}
