import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  int _count = 0;
  bool _isLabelVisible = true;
  Alignment _alignment = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Badge (with count: $_count)',
          child: Badge.count(
            isLabelVisible: _isLabelVisible,
            alignment: _alignment,
            count: _count,
            child: const Icon(
              Icons.notifications_outlined,
              size: 48,
            ),
          ),
        ),
        Section(
          label: 'Badge (with label)',
          child: Badge(
            isLabelVisible: _isLabelVisible,
            alignment: _alignment,
            label: const Text('New'),
            child: const Icon(
              Icons.image_outlined,
              size: 48,
            ),
          ),
        ),
        Section(
          label: 'Badge (with dot)',
          child: Badge(
            isLabelVisible: _isLabelVisible,
            alignment: _alignment,
            child: const Icon(
              Icons.message_outlined,
              size: 48,
            ),
          ),
        ),
      ],
      options: [
        const Text('Count'),
        Slider(
          value: _count.toDouble(),
          min: 0,
          max: 1000,
          divisions: 20,
          label: _count.toString(),
          onChanged: (value) {
            setState(() {
              _count = value.toInt();
            });
          },
        ),
        const Text('Is label visible'),
        Switch(
          value: _isLabelVisible,
          onChanged: (value) {
            setState(() {
              _isLabelVisible = value;
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
      ],
    );
  }
}
