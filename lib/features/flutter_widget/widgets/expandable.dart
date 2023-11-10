import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  const Expandable({
    super.key,
    this.axis = Axis.vertical,
    this.axisAlignment = 1,
    this.isExpanded = false,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.begin = 0,
    this.end = 1,
    required this.child,
  });

  final Axis axis;
  final double axisAlignment;
  final bool isExpanded;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;
  final Widget child;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: widget.begin, end: widget.end) //
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(Expandable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.axis,
      axisAlignment: widget.axisAlignment,
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
