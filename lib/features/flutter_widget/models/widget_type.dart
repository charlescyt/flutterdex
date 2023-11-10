import 'package:flutter/material.dart' show Color;

import '../../../core/utils/string_extension.dart';

enum WidgetType {
  stateless,
  stateful,
  renderObject,
  preferredSize,
  proxy,
  ;

  const WidgetType();

  String get label => name.capitalize;
}

extension WidgetTypeExtension on WidgetType {
  Color get color => switch (this) {
        WidgetType.stateless => const Color(0xFF64B5F6),
        WidgetType.stateful => const Color(0xFFE57373),
        WidgetType.renderObject => const Color(0xFFFFD54F),
        WidgetType.preferredSize => const Color(0xFF81C784),
        WidgetType.proxy => const Color(0xffb8b8d0),
      };
}
