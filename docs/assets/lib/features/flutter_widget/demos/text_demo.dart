import 'package:flutter/material.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class TextDemo extends StatefulWidget {
  const TextDemo({super.key});

  @override
  State<TextDemo> createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  String _fontFamily = 'Lato';
  int _maxLines = 3;
  TextOverflow _overflow = TextOverflow.ellipsis;
  TextAlign _textAlign = TextAlign.start;
  double _textScaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoScaffold(
      demos: [
        Section(
          label: 'Text',
          child: Text(
            'Learning Flutter is fun!',
            style: theme.textTheme.titleLarge?.copyWith(
              fontFamily: _fontFamily,
            ),
          ),
        ),
        Section(
          label: 'Long Text',
          child: DefaultTextStyle.merge(
            style: TextStyle(fontFamily: _fontFamily),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
              'sed do eiusmod tempor incididunt ut labore et dolore magna '
              'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
              'ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit '
              'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint '
              'occaecat cupidatat non proident, sunt in culpa qui officia '
              'deserunt mollit anim id est laborum.',
              maxLines: _maxLines,
              overflow: _overflow,
              textAlign: _textAlign,
              textScaleFactor: _textScaleFactor,
            ),
          ),
        ),
        Section(
          label: 'Text.rich',
          child: DefaultTextStyle.merge(
            style: TextStyle(fontFamily: _fontFamily),
            child: Text.rich(
              const TextSpan(
                text: 'Learning ',
                children: [
                  TextSpan(
                    text: 'Flutter ',
                    style: TextStyle(fontSize: 24),
                  ),
                  TextSpan(
                    text: 'is ',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'fun!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textScaleFactor: _textScaleFactor,
            ),
          ),
        ),
      ],
      options: [
        const Text('Font Family'),
        ButtonGroup<String>(
          selected: _fontFamily,
          items: const ['Lato', 'JetBrainsMono'],
          labelBuilder: (item) {
            return Text(item);
          },
          onChanged: (value) {
            setState(() {
              _fontFamily = value;
            });
          },
        ),
        Text('Max Lines: $_maxLines'),
        Slider(
          value: _maxLines.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          label: _maxLines.toString(),
          onChanged: (value) => setState(() => _maxLines = value.toInt()),
        ),
        const Text('Text Overflow'),
        ButtonGroup<TextOverflow>(
          selected: _overflow,
          items: TextOverflow.values,
          labelBuilder: (item) {
            return Text(item.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _overflow = value;
            });
          },
        ),
        const Text('Text Align'),
        ButtonGroup<TextAlign>(
          selected: _textAlign,
          items: TextAlign.values,
          labelBuilder: (item) {
            return Text(item.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _textAlign = value;
            });
          },
        ),
        Text('Text Scale Factor: $_textScaleFactor'),
        Slider(
          value: _textScaleFactor,
          min: 0.5,
          max: 2,
          divisions: 3,
          label: _textScaleFactor.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _textScaleFactor = value;
            });
          },
        ),
      ],
    );
  }
}
