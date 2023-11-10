import 'package:flutter/cupertino.dart';

import '../../../core/utils/string_extension.dart';
import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoDatePickerDemo extends StatefulWidget {
  const CupertinoDatePickerDemo({super.key});

  @override
  State<CupertinoDatePickerDemo> createState() => _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  DateTime _dateTime = DateTime.now();
  CupertinoDatePickerMode _mode = CupertinoDatePickerMode.dateAndTime;
  bool _use24hFormat = false;

  Future<void> _showCupertinoDatePicker() async {
    return showCupertinoModalPopup<void>(
      context: context,
      useRootNavigator: false,
      builder: (popupContext) {
        return Container(
          color: CupertinoColors.systemBackground.resolveFrom(popupContext),
          height: 300,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            mode: _mode,
            use24hFormat: _use24hFormat,
            onDateTimeChanged: (value) {
              setState(() {
                _dateTime = value;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoDatePicker',
          child: Column(
            children: [
              Text(_dateTime.toString()),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                onPressed: _showCupertinoDatePicker,
                child: const Text('Show CupertinoDatePicker'),
              ),
            ],
          ),
        ),
      ],
      options: [
        const Text('Mode'),
        ButtonGroup(
          selected: _mode,
          items: CupertinoDatePickerMode.values,
          labelBuilder: (value) {
            return Text(value.name.capitalize);
          },
          onChanged: (value) {
            setState(() {
              _mode = value;
            });
          },
        ),
        const Text('Use 24h format'),
        CupertinoSwitch(
          value: _use24hFormat,
          onChanged: (value) {
            setState(() {
              _use24hFormat = value;
            });
          },
        ),
      ],
    );
  }
}
