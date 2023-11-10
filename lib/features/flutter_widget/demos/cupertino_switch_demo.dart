import 'package:flutter/cupertino.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  const CupertinoSwitchDemo({super.key});

  @override
  State<CupertinoSwitchDemo> createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {
  bool _switchValue = true;
  bool _isEnabled = true;

  void _onChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoSwitch',
          child: CupertinoSwitch(
            value: _switchValue,
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
