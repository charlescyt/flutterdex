import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class DropdownButtonDemo extends StatefulWidget {
  const DropdownButtonDemo({super.key});

  @override
  State<DropdownButtonDemo> createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<DropdownButtonDemo> {
  ThemeMode? _themeMode;
  bool _isEnabled = true;
  bool _isExpanded = false;
  bool _useCustomIcon = false;
  bool _useCustomUnderline = false;
  Alignment _alignment = Alignment.center;

  void _onChange(ThemeMode? value) {
    setState(() {
      _themeMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'DropdownButton',
          child: DropdownButton<ThemeMode>(
            value: _themeMode,
            isExpanded: _isExpanded,
            icon: _useCustomIcon ? const Icon(Icons.arrow_downward_outlined) : null,
            hint: const Text('Select theme mode'),
            alignment: _alignment,
            underline: _useCustomUnderline
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                : null,
            items: [
              for (final themeMode in ThemeMode.values)
                DropdownMenuItem(
                  value: themeMode,
                  child: Text(themeMode.name.capitalize),
                ),
            ],
            onChanged: _isEnabled ? _onChange : null,
          ),
        ),
        Section(
          label: 'DropdownButton (without underline)',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ThemeMode>(
              value: _themeMode,
              isExpanded: _isExpanded,
              icon: _useCustomIcon ? const Icon(Icons.arrow_downward_outlined) : null,
              hint: const Text('Select theme mode'),
              alignment: _alignment,
              items: [
                for (final themeMode in ThemeMode.values)
                  DropdownMenuItem(
                    value: themeMode,
                    child: Text(themeMode.name.capitalize),
                  ),
              ],
              onChanged: _isEnabled ? _onChange : null,
            ),
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
        const Text('Is Expanded'),
        Switch(
          value: _isExpanded,
          onChanged: (value) {
            setState(() {
              _isExpanded = value;
            });
          },
        ),
        const Text('Use Custom Icon'),
        Switch(
          value: _useCustomIcon,
          onChanged: (value) {
            setState(() {
              _useCustomIcon = value;
            });
          },
        ),
        const Text('Use Custom Underline'),
        Switch(
          value: _useCustomUnderline,
          onChanged: (value) {
            setState(() {
              _useCustomUnderline = value;
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
