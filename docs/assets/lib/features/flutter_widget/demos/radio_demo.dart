import 'package:flutter/material.dart';

import '../../../core/theme/theme_mode_extension.dart';
import '../../../core/widgets/color_segmented_button.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isEnabled = true;
  Color? _activeColor;

  void _onThemeModeChanged(ThemeMode? themeMode) {
    if (themeMode != null) {
      setState(() {
        _themeMode = themeMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'Radio',
          child: Column(
            children: [
              for (final themeMode in ThemeMode.values)
                Row(
                  children: [
                    Expanded(child: Text(themeMode.label)),
                    Radio<ThemeMode>(
                      value: themeMode,
                      groupValue: _themeMode,
                      activeColor: _activeColor,
                      onChanged: _isEnabled ? _onThemeModeChanged : null,
                    ),
                  ],
                ),
            ],
          ),
        ),
        Section(
          label: 'Radio.adaptive',
          child: Column(
            children: [
              for (final themeMode in ThemeMode.values)
                Row(
                  children: [
                    Expanded(child: Text(themeMode.label)),
                    Radio<ThemeMode>.adaptive(
                      value: themeMode,
                      groupValue: _themeMode,
                      activeColor: _activeColor,
                      onChanged: _isEnabled ? _onThemeModeChanged : null,
                    ),
                  ],
                ),
            ],
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
      ],
    );
  }
}
