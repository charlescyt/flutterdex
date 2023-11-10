import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show ThemeMode, immutable;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/shared_prefs/shared_prefs.dart';
import '../../../core/widgets/simulator.dart';

part 'settings_repo.g.dart';

@Riverpod(keepAlive: true)
SettingsRepo settingsRepo(SettingsRepoRef ref) {
  final sharedPrefs = ref.watch(sharedPrefsProvider);
  return SettingsRepo(sharedPrefs);
}

@immutable
class SettingsRepo {
  static const String _themeModeKey = 'themeMode';
  static const String _simulatorTypeKey = 'simulatorType';

  final SharedPrefsFacade _sharedPrefs;

  const SettingsRepo(this._sharedPrefs);

  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    final result = await _sharedPrefs.saveString(_themeModeKey, themeMode.name);
    return result;
  }

  ThemeMode? loadThemeMode() {
    final themeModeString = _sharedPrefs.loadString(_themeModeKey);
    return themeModeString == null //
        ? null
        : ThemeMode.values.firstWhereOrNull((e) => e.name == themeModeString);
  }

  Future<bool> setSimulatorType(SimulatorType simulatorType) async {
    final result = await _sharedPrefs.saveString(_simulatorTypeKey, simulatorType.name);
    return result;
  }

  SimulatorType? loadSimulatorType() {
    final simulatorType = _sharedPrefs.loadString(_simulatorTypeKey);
    return simulatorType == null //
        ? null
        : SimulatorType.values.firstWhereOrNull((e) => e.name == simulatorType);
  }
}
