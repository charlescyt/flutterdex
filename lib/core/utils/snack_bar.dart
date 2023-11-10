import 'package:flutter/material.dart';

void showFloatingSnackBar({
  required BuildContext context,
  required String message,
}) {
  final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
  scaffoldMessenger?.removeCurrentSnackBar();
  scaffoldMessenger?.showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(8),
    ),
  );
}
