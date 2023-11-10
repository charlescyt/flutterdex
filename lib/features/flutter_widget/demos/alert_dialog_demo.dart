import 'package:flutter/material.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  bool _barrierDismissible = false;

  Future<void> _showSimpleAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: _barrierDismissible,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Title'),
          content: const Text('Content'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showScrollableDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: _barrierDismissible,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const FlutterLogo(),
          title: const Text('Did you scroll to the bottom?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('This is the top of the dialog.'),
                SizedBox(height: 300),
                Text('Keep scrolling!'),
                SizedBox(height: 300),
                Text('This is the bottom of the dialog.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'AlertDialog',
          child: ElevatedButton(
            onPressed: () async {
              await _showSimpleAlertDialog(context);
            },
            child: const Text('Show AlertDialog'),
          ),
        ),
        Section(
          label: 'AlertDialog (with Scrollable Content)',
          child: ElevatedButton.icon(
            icon: const FlutterLogo(),
            label: const Text('Show Scrollable AlertDialog'),
            onPressed: () async {
              final response = await showScrollableDialog(context);
              if (!context.mounted) return;

              switch (response) {
                case true:
                  showFloatingSnackBar(
                    context: context,
                    message: 'You have selected Yes',
                  );
                case false:
                  showFloatingSnackBar(
                    context: context,
                    message: 'You have selected No',
                  );
                case null:
                  showFloatingSnackBar(
                    context: context,
                    message: 'You dismissed the dialog',
                  );
              }
            },
          ),
        ),
      ],
      options: [
        const Text('Barrier Dismissible'),
        Switch(
          value: _barrierDismissible,
          onChanged: (value) {
            setState(() {
              _barrierDismissible = value;
            });
          },
        ),
      ],
    );
  }
}
