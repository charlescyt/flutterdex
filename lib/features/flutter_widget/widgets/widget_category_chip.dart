import 'package:flutter/material.dart';

import '../models/widget_category.dart';

class WidgetCategoryChip extends StatelessWidget {
  const WidgetCategoryChip(
    this.category, {
    super.key,
  });

  final WidgetCategory category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      backgroundColor: category.color.withOpacity(0.5),
      avatar: Icon(
        category.icon,
        color: theme.colorScheme.onSurface,
      ),
      label: Text(category.label),
      labelStyle: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
