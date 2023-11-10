import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/router.dart';
import '../models/flutter_widget.dart';
import 'widget_category_chip.dart';
import 'widget_type_chip.dart';

class FlutterWidgetListTile extends ConsumerWidget {
  const FlutterWidgetListTile(
    this.widget, {
    super.key,
  });

  final FlutterWidget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceVariant,
      child: ListTile(
        onTap: () => WidgetDetailsRoute(id: widget.id).go(context),
        title: Text(
          widget.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right),
        subtitle: Row(
          children: [
            Flexible(child: WidgetCategoryChip(widget.category)),
            const SizedBox(width: 8),
            Flexible(child: WidgetTypeChip(widget.type)),
          ],
        ),
      ),
    );
  }
}
