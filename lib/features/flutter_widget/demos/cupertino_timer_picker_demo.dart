import 'package:flutter/cupertino.dart';

import '../../../core/widgets/button_group.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoTimerPickerDemo extends StatefulWidget {
  const CupertinoTimerPickerDemo({super.key});

  @override
  State<CupertinoTimerPickerDemo> createState() => _CupertinoTimerPickerDemoState();
}

class _CupertinoTimerPickerDemoState extends State<CupertinoTimerPickerDemo> {
  Duration _duration = Duration.zero;
  CupertinoTimerPickerMode _mode = CupertinoTimerPickerMode.hms;

  Future<void> _showCupertinoTimerPicker() async {
    return showCupertinoModalPopup<void>(
      context: context,
      useRootNavigator: false,
      builder: (popupContext) {
        return Container(
          color: CupertinoColors.systemBackground.resolveFrom(popupContext),
          height: 300,
          child: CupertinoTimerPicker(
            initialTimerDuration: _duration,
            mode: _mode,
            onTimerDurationChanged: (value) {
              setState(() {
                _duration = value;
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
          label: 'CupertinoTimerPicker',
          child: Column(
            children: [
              Text(_duration.toString()),
              const SizedBox(height: 8),
              CupertinoButton.filled(
                onPressed: _showCupertinoTimerPicker,
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
          items: CupertinoTimerPickerMode.values,
          labelBuilder: (mode) => Text(mode.name),
          onChanged: (value) {
            setState(() {
              _mode = value;
            });
          },
        ),
      ],
    );
  }
}
