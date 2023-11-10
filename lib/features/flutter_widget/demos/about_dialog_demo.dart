import 'package:flutter/material.dart';

import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class AboutDialogDemo extends StatelessWidget {
  const AboutDialogDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'AboutDialog',
          child: ElevatedButton.icon(
            icon: Image.asset('assets/images/logo.png', width: 24, height: 24),
            label: const Text('Show About Dialog'),
            onPressed: () {
              showAboutDialog(
                context: context,
                useRootNavigator: false,
                applicationName: 'Flutterdex',
                applicationVersion: '1.0.0',
                applicationIcon: Image.asset('assets/images/logo.png', width: 36, height: 36),
                children: [
                  const Text('This is an About Dialog.'),
                  const Text('It shows information about the app.'),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
