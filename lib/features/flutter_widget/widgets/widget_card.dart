import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/router.dart';
import '../models/flutter_widget.dart';
import 'widget_category_chip.dart';
import 'widget_type_chip.dart';

class FlutterWidgetCard extends ConsumerStatefulWidget {
  const FlutterWidgetCard(
    this.widget, {
    super.key,
  });

  final FlutterWidget widget;

  @override
  ConsumerState<FlutterWidgetCard> createState() => _FlutterWidgetCardState();
}

class _FlutterWidgetCardState extends ConsumerState<FlutterWidgetCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceVariant,
      child: InkWell(
        onTap: () => WidgetDetailsRoute(id: widget.widget.id).go(context),
        onHover: (value) => setState(() => _isHovering = value),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.widget.label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Flexible(child: WidgetCategoryChip(widget.widget.category)),
              const SizedBox(width: 8),
              Flexible(child: WidgetTypeChip(widget.widget.type)),
            ],
          ),
        ),
      ),
    )
        .animate(
          autoPlay: false,
          adapter: ValueAdapter(_isHovering ? 1 : 0),
          onComplete: (controller) => controller.repeat(),
        )
        .shake(hz: 3, rotation: 0.1, duration: 1.seconds, curve: Curves.easeInOut)
        .shimmer();
  }
}
