import 'package:flutter/cupertino.dart';

import '../../../core/utils/snack_bar.dart';
import '../../../core/widgets/demo_scaffold.dart';
import '../widgets/section.dart';

class CupertinoAlertDialogDemo extends StatelessWidget {
  const CupertinoAlertDialogDemo({super.key});

  Future<void> _showAlertDialog(BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      useRootNavigator: false,
      builder: (popupContext) => CupertinoAlertDialog(
        title: const Text('Cupertino Alert Dialog'),
        content: const Text('Content of the alert dialog'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              showFloatingSnackBar(
                context: popupContext,
                message: 'You selected No',
              );
              Navigator.pop(popupContext);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              showFloatingSnackBar(
                context: popupContext,
                message: 'You selected Yes',
              );
              Navigator.pop(popupContext);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      demos: [
        Section(
          label: 'CupertinoAlertDialog',
          child: CupertinoButton.filled(
            onPressed: () {
              _showAlertDialog(context);
            },
            child: const Text('Show CupertinoAlertDialog'),
          ),
        ),
      ],
    );
  }
}
