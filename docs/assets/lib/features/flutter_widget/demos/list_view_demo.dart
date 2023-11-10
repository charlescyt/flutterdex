import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  Axis _scrollDirection = Axis.vertical;
  EdgeInsets _padding = const EdgeInsets.all(8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'ListView',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: ListView(
                scrollDirection: _scrollDirection,
                padding: _padding,
                itemExtent: 80,
                children: [
                  for (var i = 0; i < 10; i++) //
                    _Box(label: '$i'),
                ],
              ),
            ),
          ),
        ),
        Section(
          label: 'ListView.builder',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: ListView.builder(
                scrollDirection: _scrollDirection,
                prototypeItem: const _Box(label: '10000'),
                itemBuilder: (_, index) {
                  return _Box(label: '$index');
                },
              ),
            ),
          ),
        ),
        Section(
          label: 'ListView.separated',
          child: SizedBox(
            height: 150,
            child: OutlinedBox(
              child: ListView.separated(
                scrollDirection: _scrollDirection,
                padding: _padding,
                itemCount: 20,
                separatorBuilder: (_, __) {
                  return _scrollDirection == Axis.horizontal
                      ? VerticalDivider(color: theme.primaryColor)
                      : Divider(color: theme.primaryColor);
                },
                itemBuilder: (_, index) {
                  return _Box(label: '$index');
                },
              ),
            ),
          ),
        ),
      ],
      options: [
        const Text('Scroll Direction'),
        ButtonGroup(
          selected: _scrollDirection,
          items: Axis.values,
          labelBuilder: (value) {
            return Text(value.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _scrollDirection = value;
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
          ],
          labelBuilder: (padding) {
            return Text(padding.toString());
          },
          onChanged: (padding) {
            setState(() {
              _padding = padding;
            });
          },
        ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: theme.colorScheme.primaryContainer,
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
