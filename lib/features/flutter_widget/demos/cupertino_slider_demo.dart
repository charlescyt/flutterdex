import 'package:flutter/cupertino.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoSliderDemo extends StatefulWidget {
  const CupertinoSliderDemo({super.key});

  @override
  State<CupertinoSliderDemo> createState() => _CupertinoSliderDemoState();
}

class _CupertinoSliderDemoState extends State<CupertinoSliderDemo> {
  double _sliderValue = 0.5;
  bool _isEnabled = true;

  void _onChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoSlider',
          child: CupertinoSlider(
            value: _sliderValue,
            divisions: 5,
            onChanged: _isEnabled ? _onChanged : null,
          ),
        ),
      ],
      options: [
        const Text('Is enabled'),
        CupertinoSwitch(
          value: _isEnabled,
          onChanged: (value) {
            setState(() {
              _isEnabled = value;
            });
          },
        ),
      ],
    );
  }
}
