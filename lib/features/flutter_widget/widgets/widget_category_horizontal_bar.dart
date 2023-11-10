import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/widget_category.dart';

class WidgetCategoryHorizontalBar extends StatelessWidget {
  const WidgetCategoryHorizontalBar({
    super.key,
    this.selected,
    required this.onTap,
  });

  final WidgetCategory? selected;
  final ValueChanged<WidgetCategory?> onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: [
            _Slot(
              label: 'All',
              icon: Icons.widgets_outlined,
              selectedIcon: Icons.widgets,
              selected: selected == null,
              onTap: () => onTap(null),
            ),
            for (final item in WidgetCategory.values)
              _Slot(
                label: item.label,
                icon: item.icon,
                selectedIcon: item.selectedIcon,
                selected: item == selected,
                onTap: () => onTap(item),
              ),
          ]
              .animate(delay: 300.ms, interval: 200.ms) //
              .scaleXY(duration: 500.ms, curve: Curves.easeInOut),
        ),
      ),
    );
  }
}

class _Slot extends StatefulWidget {
  const _Slot({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.selected = false,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_Slot> createState() => _SlotState();
}

class _SlotState extends State<_Slot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.selected ? theme.indicatorColor : theme.unselectedWidgetColor;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 64),
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: (value) {
          if (value) {
            _controller.forward();
          } else {
            _controller.reset();
          }

          setState(() => _isHovering = value);
        },
        onTap: () {
          widget.onTap();
          _controller.forward().whenComplete(_controller.reset);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.selected //
                    ? widget.selectedIcon ?? widget.icon
                    : widget.icon,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                widget.label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: (widget.selected || _isHovering) //
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(autoPlay: false, controller: _controller)
        .shake(duration: 300.ms, delay: 150.ms)
        .tint(color: theme.colorScheme.primary)
        .shimmer(duration: 2.seconds);
  }
}
