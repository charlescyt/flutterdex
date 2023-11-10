import 'package:flutter/material.dart';

import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.5;
  bool _isEnabled = true;
  Color? _activeColor;
  Color? _inactiveColor;
  Color? _thumbColor;

  void _onChange(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Slider',
          child: Slider(
            value: _sliderValue,
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            thumbColor: _thumbColor,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'Slider (with divisions and label)',
          child: Slider(
            value: _sliderValue,
            label: _sliderValue.toStringAsFixed(2),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            thumbColor: _thumbColor,
            divisions: 10,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'Slider.adaptive',
          child: Slider.adaptive(
            value: _sliderValue,
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            thumbColor: _thumbColor,
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
      ],
      options: [
        const Text('Enabled'),
        Switch(
          value: _isEnabled,
          onChanged: (value) {
            setState(() {
              _isEnabled = value;
            });
          },
        ),
        const Text('Active Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _activeColor,
            onSelectionChanged: (value) {
              setState(() {
                _activeColor = value;
              });
            },
          ),
        ),
        const Text('Inactive Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _inactiveColor,
            onSelectionChanged: (value) {
              setState(() {
                _inactiveColor = value;
              });
            },
          ),
        ),
        const Text('Thumb Color'),
        Center(
          child: ColorSegmentedButton(
            selected: _thumbColor,
            onSelectionChanged: (value) {
              setState(() {
                _thumbColor = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
