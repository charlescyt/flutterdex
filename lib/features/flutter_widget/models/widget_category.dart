import 'package:flutter/material.dart' show Color, IconData, Icons;

import '../../../core/utils/string_extension.dart';

enum WidgetCategory {
  material,
  cupertino,
  layout,
  graphics,
  scrolling,
  animation,
  ;

  const WidgetCategory();

  String get label => name.capitalize;
}

extension WidgetCategoryExtension on WidgetCategory {
  IconData get icon => switch (this) {
        WidgetCategory.material => Icons.layers_outlined,
        WidgetCategory.cupertino => Icons.phone_iphone_outlined,
        WidgetCategory.layout => Icons.view_quilt_outlined,
        WidgetCategory.graphics => Icons.image_outlined,
        WidgetCategory.scrolling => Icons.view_day_outlined,
        WidgetCategory.animation => Icons.animation_outlined,
      };

  IconData get selectedIcon => switch (this) {
        WidgetCategory.material => Icons.layers,
        WidgetCategory.cupertino => Icons.phone_iphone,
        WidgetCategory.layout => Icons.view_quilt,
        WidgetCategory.graphics => Icons.image,
        WidgetCategory.scrolling => Icons.view_day,
        WidgetCategory.animation => Icons.animation,
      };

  Color get color => switch (this) {
        WidgetCategory.material => const Color(0xFFa890f0),
        WidgetCategory.cupertino => const Color(0xFFFF4500),
        WidgetCategory.layout => const Color(0xFFFFFF00),
        WidgetCategory.graphics => const Color(0xFFFFA500),
        WidgetCategory.scrolling => const Color(0xFF00FA9A),
        WidgetCategory.animation => const Color(0xFFF06292),
      };
}
