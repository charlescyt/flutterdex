import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode1;
  late final FocusNode _focusNode2;
  String _text = '';
  RangeValues _rangeValues = const RangeValues(1, 5);
  TextInputType _keyboardType = TextInputType.text;
  TextInputAction _textInputAction = TextInputAction.done;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'This is a very long text.' * 10);
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'TextField',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Text: $_text'),
              TextField(
                keyboardType: _keyboardType,
                textInputAction: _textInputAction,
                focusNode: _focusNode1,
                textAlign: TextAlign.center,
                magnifierConfiguration: TextMagnifier.adaptiveMagnifierConfiguration,
                decoration: const InputDecoration(
                  icon: Icon(Icons.favorite),
                  iconColor: Colors.red,
                  labelText: 'Label',
                  hintText: 'Hint',
                  prefixText: 'Prefix',
                  prefixIcon: Icon(Icons.flutter_dash),
                  suffixText: 'Suffix',
                  suffixIcon: Icon(Icons.search_outlined),
                ),
                onTapOutside: (_) {
                  if (_focusNode1.hasFocus) {
                    _focusNode1.unfocus();
                    showFloatingSnackBar(
                      context: context,
                      message: 'Tapped outside',
                    );
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _text = value;
                  });
                },
                onSubmitted: (value) {
                  showFloatingSnackBar(
                    context: context,
                    message: 'Submitted: $value',
                  );
                },
              ),
            ],
          ),
        ),
        Section(
          label: 'TextField (with controller)',
          child: Column(
            children: [
              ListenableBuilder(
                listenable: _controller,
                builder: (_, __) {
                  return Text('Text: ${_controller.text}');
                },
              ),
              TextField(
                controller: _controller,
                focusNode: _focusNode2,
                minLines: _rangeValues.start.toInt(),
                maxLines: _rangeValues.end.toInt(),
                decoration: InputDecoration(
                  suffixText: 'Suffix',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _controller.clear,
                  ),
                ),
                onTapOutside: (_) {
                  if (_focusNode2.hasFocus) {
                    _focusNode2.unfocus();
                    showFloatingSnackBar(
                      context: context,
                      message: 'Tapped outside',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
      options: [
        const Text('Keyboard Input Type'),
        ButtonGroup(
          selected: _keyboardType,
          items: const [
            TextInputType.text,
            TextInputType.number,
            TextInputType.url,
          ],
          labelBuilder: (item) {
            return switch (item) {
              TextInputType.text => const Text('Text'),
              TextInputType.number => const Text('Number'),
              TextInputType.url => const Text('Url'),
              _ => const Text('Unknown'),
            };
          },
          onChanged: (value) {
            setState(() {
              _keyboardType = value;
            });
          },
        ),
        const Text('Text Input Action'),
        ButtonGroup(
          selected: _textInputAction,
          items: const [
            TextInputAction.none,
            TextInputAction.done,
            TextInputAction.go,
            TextInputAction.search,
            TextInputAction.next,
            TextInputAction.previous,
          ],
          labelBuilder: (item) => Text(item.name.capitalize),
          onChanged: (value) {
            setState(() {
              _textInputAction = value;
            });
          },
        ),
        Text('Min Lines: ${_rangeValues.start.toInt()}'),
        Text('Max Lines: ${_rangeValues.end.toInt()}'),
        RangeSlider(
          min: 1,
          max: 5,
          values: _rangeValues,
          divisions: 4,
          labels: RangeLabels(
            _rangeValues.start.toString(),
            _rangeValues.end.toString(),
          ),
          onChanged: (value) {
            setState(() {
              _rangeValues = value;
            });
          },
        ),
      ],
    );
  }
}
