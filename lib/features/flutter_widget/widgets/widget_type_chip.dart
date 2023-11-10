import 'package:flutter/material.dart';

import '../models/widget_type.dart';

class WidgetTypeChip extends StatelessWidget {
  const WidgetTypeChip(
    this.type, {
    super.key,
  });

  final WidgetType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      backgroundColor: type.color.withOpacity(0.5),
      label: Text(type.label),
      labelStyle: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
