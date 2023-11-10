import 'package:flutter/material.dart';

import '../utils/string_extension.dart';

extension ThemeModeExtension on ThemeMode {
  String get label => name.capitalize;
}
