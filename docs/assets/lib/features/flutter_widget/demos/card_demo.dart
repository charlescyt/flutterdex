import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  Color? _color;
  Color? _shadowColor;
  Color? _surfaceTintColor;
  double _elevation = 1;
  OutlinedBorder? _shape;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Card',
          child: Card(
            color: _color,
            shadowColor: _shadowColor,
            surfaceTintColor: _surfaceTintColor,
            elevation: _elevation,
            shape: _shape,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Card'),
            ),
          ),
        ),
        Section(
          label: 'Card + InkWell',
          child: Card(
            color: _color,
            shadowColor: _shadowColor,
            surfaceTintColor: _surfaceTintColor,
            elevation: _elevation,
            shape: _shape,
            child: InkWell(
              onTap: () {
                showFloatingSnackBar(
                  context: context,
                  message: 'Inkwell Card tapped',
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Card'),
              ),
            ),
          ),
        ),
        Section(
          label: 'Card + ListTile',
          child: Card(
            color: _color,
            shadowColor: _shadowColor,
            surfaceTintColor: _surfaceTintColor,
            elevation: _elevation,
            shape: _shape,
            child: ListTile(
              leading: const FlutterLogo(),
              title: const Text('Title'),
              subtitle: const Text('Subtitle'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  showFloatingSnackBar(
                    context: context,
                    message: 'ListTile Card trailing icon tapped',
                  );
                },
              ),
              onTap: () {
                showFloatingSnackBar(
                  context: context,
                  message: 'ListTile Card tapped',
                );
              },
            ),
          ),
        ),
      ],
      options: [
        const Text('Color'),
        ColorSegmentedButton(
          selected: _color,
          onSelectionChanged: (value) {
            setState(() {
              _color = value;
            });
          },
        ),
        const Text('Shadow Color'),
        ColorSegmentedButton(
          selected: _shadowColor,
          onSelectionChanged: (value) {
            setState(() {
              _shadowColor = value;
            });
          },
        ),
        const Text('Surface Tint Color'),
        ColorSegmentedButton(
          selected: _surfaceTintColor,
          onSelectionChanged: (value) {
            setState(() {
              _surfaceTintColor = value;
            });
          },
        ),
        Text('Elevation: ${_elevation.toStringAsFixed(1)}'),
        Slider(
          value: _elevation,
          min: 0,
          max: 5,
          divisions: 5,
          label: _elevation.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _elevation = value;
            });
          },
        ),
        const Text('Shape'),
        ButtonGroup(
          selected: _shape,
          items: const [
            null,
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            StadiumBorder(),
            BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ],
          labelBuilder: (value) {
            return value == null //
                ? const Text('Default')
                : Text(value.runtimeType.toString());
          },
          onChanged: (value) {
            setState(() {
              _shape = value;
            });
          },
        ),
      ],
    );
  }
}
