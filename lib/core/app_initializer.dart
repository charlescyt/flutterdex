import 'dart:developer' as developer;

import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/flutter_widget/providers/widgets_provider.dart';
import 'utils/package_info/package_info.dart';
import 'utils/shared_prefs/shared_prefs.dart';
import 'utils/url_strategy_plus/url_strategy_plus.dart';

part 'app_initializer.g.dart';

@riverpod
class AppInitializer extends _$AppInitializer {
  bool _isInitialized = false;

  @override
  Future<void> build() async {
    if (_isInitialized) return;

    _setupUrlStrategy();
    _setupLogger();

    await (
      Future<void>.delayed(const Duration(seconds: 2)),
      ref.watch(packageInfoAsyncProvider.future),
      ref.watch(sharedPrefsAsyncProvider.future),
      ref.watch(flutterWidgetsAsyncProvider.future),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ).wait;

    _isInitialized = true;

    await Future.microtask(ref.invalidateSelf);
    return future;
  }

  void _setupUrlStrategy() {
    usePathUrlStrategy();
  }

  void _setupLogger() {
    hierarchicalLoggingEnabled = true;
    Logger.root.level = Level.WARNING;
    Logger.root.onRecord.listen((record) {
      developer.log(
        record.message,
        time: record.time,
        sequenceNumber: record.sequenceNumber,
        level: record.level.value,
        name: record.loggerName,
        zone: record.zone,
        error: record.error,
        stackTrace: record.stackTrace,
      );
    });
  }
}
