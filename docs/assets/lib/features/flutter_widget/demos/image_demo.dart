import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../../../core/widgets/outlined_box.dart';
import '../widgets/section.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({super.key});

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  double _width = 150;
  double _height = 150;
  BoxFit _fit = BoxFit.cover;
  Color? _color;
  BlendMode? _blendMode;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Image.asset',
          child: OutlinedBox(
            child: Image.asset(
              'assets/images/logo.png',
              width: _width,
              height: _height,
              fit: _fit,
              color: _color,
              colorBlendMode: _blendMode,
            ),
          ),
        ),
        Section(
          label: 'Image.network',
          child: OutlinedBox(
            child: Image.network(
              'https://picsum.photos/300',
              width: _width,
              height: _height,
              fit: _fit,
              color: _color,
              colorBlendMode: _blendMode,
            ),
          ),
        ),
      ],
      options: [
        Text('Width: ${_width.toStringAsFixed(0)}'),
        Slider(
          value: _width,
          min: 50,
          max: 200,
          divisions: 3,
          label: _width.toStringAsFixed(0),
          onChanged: (value) {
            setState(() {
              _width = value;
            });
          },
        ),
        Text('Height: ${_height.toStringAsFixed(0)}'),
        Slider(
          value: _height,
          min: 50,
          max: 200,
          divisions: 3,
          label: _width.toStringAsFixed(0),
          onChanged: (value) {
            setState(() {
              _height = value;
            });
          },
        ),
        const Text('Fit'),
        ButtonGroup(
          selected: _fit,
          items: BoxFit.values,
          labelBuilder: (fit) => Text(fit.name.capitalize),
          onChanged: (value) {
            setState(() {
              _fit = value;
            });
          },
        ),
        const Text('Color'),
        ColorSegmentedButton(
          selected: _color,
          onSelectionChanged: (value) {
            setState(() {
              _color = value;
            });
          },
        ),
        const Text('Blend Mode'),
        ButtonGroup(
          selected: _blendMode,
          items: BlendMode.values,
          labelBuilder: (fit) => Text(fit.name.capitalize),
          onChanged: (value) {
            setState(() {
              _blendMode = value;
            });
          },
        ),
      ],
    );
  }
}
