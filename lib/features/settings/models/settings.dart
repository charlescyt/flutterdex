import 'package:flutter/material.dart' show ThemeMode;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/widgets/simulator.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    required ThemeMode themeMode,
    required SimulatorType simulatorType,
  }) = _Settings;
}
