import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/widgets/simulator.dart';
import '../models/settings.dart';
import '../repos/settings_repo.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentSettings extends _$CurrentSettings {
  @override
  Settings build() {
    final themeMode = ref.watch(settingsRepoProvider).loadThemeMode();
    final simulatorType = ref.watch(settingsRepoProvider).loadSimulatorType();
    return Settings(
      themeMode: themeMode ?? ThemeMode.system,
      simulatorType: simulatorType ?? SimulatorType.ios,
    );
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = state.copyWith(themeMode: themeMode);
    await ref.read(settingsRepoProvider).saveThemeMode(themeMode);
  }

  Future<void> setSimulatorType(SimulatorType simulatorType) async {
    state = state.copyWith(simulatorType: simulatorType);
    await ref.read(settingsRepoProvider).setSimulatorType(simulatorType);
  }
}
