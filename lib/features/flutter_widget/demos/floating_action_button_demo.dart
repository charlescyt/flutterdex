import 'package:flutter/material.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class FloatingActionButtonDemo extends StatefulWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  State<FloatingActionButtonDemo> createState() => _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState extends State<FloatingActionButtonDemo> {
  int _count = 0;
  FloatingActionButtonLocation _floatingActionButtonLocation = FloatingActionButtonLocation.centerFloat;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Count',
          child: Text('$_count'),
        ),
        Section(
          label: 'FloatingActionButton',
          child: FloatingActionButton(
            heroTag: 'FloatingActionButton',
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
        Section(
          label: 'FloatingActionButton.extended',
          child: FloatingActionButton.extended(
            heroTag: 'FloatingActionButton.extended',
            tooltip: 'Add',
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ),
        Section(
          label: 'FloatingActionButton.large',
          child: FloatingActionButton.large(
            heroTag: 'FloatingActionButton.large',
            onPressed: () {
              setState(() {
                _count--;
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Section(
          label: 'FloatingActionButton.small',
          child: FloatingActionButton.small(
            heroTag: 'FloatingActionButton.small',
            onPressed: () {
              setState(() {
                _count--;
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
      ],
      options: [
        const Text('Floating Action Button Location'),
        FloatingActionButtonLocationButtonGroup(
          selected: _floatingActionButtonLocation,
          onChanged: (value) {
            setState(() {
              _floatingActionButtonLocation = value;
            });
          },
        ),
      ],
      floatingActionButton: FloatingActionButton(
        heroTag: 'main_floating_action_button',
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: _floatingActionButtonLocation,
    );
  }
}
