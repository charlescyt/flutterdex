import 'package:flutter/services.dart' show Clipboard, ClipboardData;

Future<void> copyToClipboard({required String text}) async {
  await Clipboard.setData(ClipboardData(text: text));
}
