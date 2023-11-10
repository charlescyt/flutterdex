import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  bool _isEnabled = true;
  bool _emptySelectionAllowed = false;
  bool _showSelectedIcon = true;
  _MobilePlatform? _selectedMobilPlatform = _MobilePlatform.android;
  Set<_Language> _selectedLanguages = {_Language.dart, _Language.swift};

  void _onMobilePlatformSelectionChanged(Set<_MobilePlatform> mobilePlatforms) {
    setState(() {
      _selectedMobilPlatform = mobilePlatforms.isEmpty ? null : mobilePlatforms.first;
    });
  }

  void _onLanguageSelectionChanged(Set<_Language> languages) {
    setState(() {
      _selectedLanguages = languages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'SegmentedButton',
          child: SegmentedButton<_MobilePlatform>(
            selected: _selectedMobilPlatform == null ? {} : {_selectedMobilPlatform!},
            emptySelectionAllowed: _emptySelectionAllowed,
            showSelectedIcon: _showSelectedIcon,
            segments: [
              for (final mobilePlatform in _MobilePlatform.values)
                ButtonSegment(
                  value: mobilePlatform,
                  icon: Icon(mobilePlatform.icon),
                  label: Text(mobilePlatform.label),
                ),
            ],
            onSelectionChanged: _isEnabled ? _onMobilePlatformSelectionChanged : null,
          ),
        ),
        Section(
          label: 'SegmentedButton (multiple selection)',
          child: SegmentedButton<_Language>(
            multiSelectionEnabled: true,
            selected: _selectedLanguages,
            emptySelectionAllowed: _emptySelectionAllowed,
            showSelectedIcon: _showSelectedIcon,
            segments: [
              for (final language in _Language.values)
                ButtonSegment(
                  value: language,
                  label: Text(language.label),
                ),
            ],
            onSelectionChanged: _isEnabled ? _onLanguageSelectionChanged : null,
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
        const Text('Empty Selection Allowed'),
        Switch(
          value: _emptySelectionAllowed,
          onChanged: (value) {
            setState(() {
              _emptySelectionAllowed = value;

              // If empty selection is not allowed and there is no selection, then select the first item.
              if (!value) {
                _selectedMobilPlatform ??= _MobilePlatform.android;

                if (_selectedLanguages.isEmpty) {
                  _selectedLanguages = {_Language.dart};
                }
              }
            });
          },
        ),
        const Text('Show Selected Icon'),
        Switch(
          value: _showSelectedIcon,
          onChanged: (value) {
            setState(() {
              _showSelectedIcon = value;
            });
          },
        ),
      ],
    );
  }
}

enum _MobilePlatform {
  android,
  ios,
  ;

  String get label => switch (this) {
        _MobilePlatform.android => 'Android',
        _MobilePlatform.ios => 'iOS',
      };

  IconData get icon => switch (this) {
        _MobilePlatform.android => Icons.android_outlined,
        _MobilePlatform.ios => Icons.phone_iphone_outlined,
      };
}

enum _Language {
  dart,
  kotlin,
  swift,
  ;

  String get label => name.capitalize;
}
