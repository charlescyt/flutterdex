import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';

import 'core/flutter_dex.dart';
import 'core/utils/platform_plus/platform_plus.dart';
import 'core/utils/riverpod_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (PlatformPlus.isDesktop) {
    setWindowTitle('Flutterdex');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(400, 600));
  }

  runApp(
    const ProviderScope(
      observers: [RiverpodLogger()],
      child: FlutterDex(),
    ),
  );
}
