import 'package:flutter/material.dart';

class ButtonGroup<T> extends StatelessWidget {
  const ButtonGroup({
    super.key,
    required this.selected,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    this.alignment = WrapAlignment.center,
    this.spacing = 8,
    this.runSpacing = 0,
  });

  final T? selected;
  final List<T> items;
  final Widget Function(T item) labelBuilder;
  final ValueChanged<T>? onChanged;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      alignment: alignment,
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        for (final item in items)
          ActionChip(
            backgroundColor: item == selected //
                ? theme.colorScheme.primaryContainer
                : null,
            label: labelBuilder(item),
            onPressed: () => onChanged?.call(item),
          ),
      ],
    );
  }
}

class AlignmentButtonGroup extends StatelessWidget {
  const AlignmentButtonGroup({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final Alignment selected;
  final ValueChanged<Alignment>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonGroup<Alignment>(
      selected: selected,
      items: const [
        Alignment.topLeft,
        Alignment.topCenter,
        Alignment.topRight,
        Alignment.centerLeft,
        Alignment.center,
        Alignment.centerRight,
        Alignment.bottomLeft,
        Alignment.bottomCenter,
        Alignment.bottomRight,
      ],
      labelBuilder: (item) => Text(getLabel(item)),
      onChanged: onChanged,
    );
  }

  String getLabel(Alignment item) {
    return switch (item) {
      Alignment.topLeft => 'TopLeft',
      Alignment.topCenter => 'TopCenter',
      Alignment.topRight => 'TopRight',
      Alignment.centerLeft => 'CenterLeft',
      Alignment.center => 'Center',
      Alignment.centerRight => 'CenterRight',
      Alignment.bottomLeft => 'BottomLeft',
      Alignment.bottomCenter => 'BottomCenter',
      Alignment.bottomRight => 'BottomRight',
      _ => item.toString(),
    };
  }
}

class AlignmentDirectionalButtonGroup extends StatelessWidget {
  const AlignmentDirectionalButtonGroup({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final AlignmentDirectional selected;
  final ValueChanged<AlignmentDirectional>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonGroup<AlignmentDirectional>(
      selected: selected,
      items: const [
        AlignmentDirectional.topStart,
        AlignmentDirectional.topCenter,
        AlignmentDirectional.topEnd,
        AlignmentDirectional.centerStart,
        AlignmentDirectional.center,
        AlignmentDirectional.centerEnd,
        AlignmentDirectional.bottomStart,
        AlignmentDirectional.bottomCenter,
        AlignmentDirectional.bottomEnd,
      ],
      labelBuilder: (item) => Text(getLabel(item)),
      onChanged: onChanged,
    );
  }

  String getLabel(AlignmentDirectional item) {
    return switch (item) {
      AlignmentDirectional.topStart => 'TopStart',
      AlignmentDirectional.topCenter => 'TopCenter',
      AlignmentDirectional.topEnd => 'TopEnd',
      AlignmentDirectional.centerStart => 'CenterStart',
      AlignmentDirectional.center => 'Center',
      AlignmentDirectional.centerEnd => 'CenterEnd',
      AlignmentDirectional.bottomStart => 'BottomStart',
      AlignmentDirectional.bottomCenter => 'BottomCenter',
      AlignmentDirectional.bottomEnd => 'BottomEnd',
      _ => item.toString(),
    };
  }
}

class FloatingActionButtonLocationButtonGroup extends StatelessWidget {
  const FloatingActionButtonLocationButtonGroup({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final FloatingActionButtonLocation selected;
  final ValueChanged<FloatingActionButtonLocation>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonGroup<FloatingActionButtonLocation>(
      selected: selected,
      items: const [
        FloatingActionButtonLocation.centerDocked,
        FloatingActionButtonLocation.centerFloat,
        FloatingActionButtonLocation.centerTop,
        FloatingActionButtonLocation.endContained,
        FloatingActionButtonLocation.endDocked,
        FloatingActionButtonLocation.endFloat,
        FloatingActionButtonLocation.endTop,
        FloatingActionButtonLocation.miniCenterDocked,
        FloatingActionButtonLocation.miniCenterFloat,
        FloatingActionButtonLocation.miniCenterTop,
        FloatingActionButtonLocation.miniEndDocked,
        FloatingActionButtonLocation.miniEndFloat,
        FloatingActionButtonLocation.miniEndTop,
        FloatingActionButtonLocation.miniStartDocked,
        FloatingActionButtonLocation.miniStartFloat,
        FloatingActionButtonLocation.miniStartTop,
        FloatingActionButtonLocation.startDocked,
        FloatingActionButtonLocation.startFloat,
        FloatingActionButtonLocation.startTop,
      ],
      labelBuilder: (item) => Text(getLabel(item)),
      onChanged: onChanged,
    );
  }

  String getLabel(FloatingActionButtonLocation item) {
    return switch (item) {
      FloatingActionButtonLocation.centerDocked => 'CenterDocked',
      FloatingActionButtonLocation.centerFloat => 'CenterFloat',
      FloatingActionButtonLocation.centerTop => 'CenterTop',
      FloatingActionButtonLocation.endContained => 'EndContained',
      FloatingActionButtonLocation.endDocked => 'EndDocked',
      FloatingActionButtonLocation.endFloat => 'EndFloat',
      FloatingActionButtonLocation.endTop => 'EndTop',
      FloatingActionButtonLocation.miniCenterDocked => 'MiniCenterDocked',
      FloatingActionButtonLocation.miniCenterFloat => 'MiniCenterFloat',
      FloatingActionButtonLocation.miniCenterTop => 'MiniCenterTop',
      FloatingActionButtonLocation.miniEndDocked => 'MiniEndDocked',
      FloatingActionButtonLocation.miniEndFloat => 'MiniEndFloat',
      FloatingActionButtonLocation.miniEndTop => 'MiniEndTop',
      FloatingActionButtonLocation.miniStartDocked => 'MiniStartDocked',
      FloatingActionButtonLocation.miniStartFloat => 'MiniStartFloat',
      FloatingActionButtonLocation.miniStartTop => 'MiniStartTop',
      FloatingActionButtonLocation.startDocked => 'StartDocked',
      FloatingActionButtonLocation.startFloat => 'StartFloat',
      FloatingActionButtonLocation.startTop => 'StartTop',
      _ => item.toString(),
    };
  }
}

class CurveButtonGroup extends StatelessWidget {
  const CurveButtonGroup({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final Curve selected;
  final ValueChanged<Curve>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonGroup(
      selected: selected,
      items: const [
        Curves.linear,
        Curves.decelerate,
        Curves.fastLinearToSlowEaseIn,
        Curves.ease,
        Curves.easeIn,
        Curves.easeInToLinear,
        Curves.easeInSine,
        Curves.easeInQuad,
        Curves.easeInCubic,
        Curves.easeInQuart,
        Curves.easeInQuint,
        Curves.easeInExpo,
        Curves.easeInCirc,
        Curves.easeInBack,
        Curves.easeOut,
        Curves.linearToEaseOut,
        Curves.easeOutSine,
        Curves.easeOutQuad,
        Curves.easeOutCubic,
        Curves.easeOutQuart,
        Curves.easeOutQuint,
        Curves.easeOutExpo,
        Curves.easeOutCirc,
        Curves.easeOutBack,
        Curves.easeInOut,
        Curves.easeInOutSine,
        Curves.easeInOutQuad,
        Curves.easeInOutCubic,
        Curves.easeInOutQuart,
        Curves.easeInOutQuint,
        Curves.easeInOutExpo,
        Curves.easeInOutCirc,
        Curves.easeInOutBack,
        Curves.fastOutSlowIn,
        Curves.slowMiddle,
        Curves.bounceIn,
        Curves.bounceOut,
        Curves.bounceInOut,
        Curves.elasticIn,
        Curves.elasticOut,
        Curves.elasticInOut,
      ],
      labelBuilder: (item) => Text(getLabel(item)),
      onChanged: onChanged,
    );
  }

  String getLabel(Curve curve) {
    return switch (curve) {
      Curves.linear => 'Linear',
      Curves.decelerate => 'Decelerate',
      Curves.fastLinearToSlowEaseIn => 'FastLinearToSlowEaseIn',
      Curves.ease => 'Ease',
      Curves.easeIn => 'EaseIn',
      Curves.easeInToLinear => 'EaseInToLinear',
      Curves.easeInSine => 'EaseInSine',
      Curves.easeInQuad => 'EaseInQuad',
      Curves.easeInCubic => 'EaseInCubic',
      Curves.easeInQuart => 'EaseInQuart',
      Curves.easeInQuint => 'EaseInQuint',
      Curves.easeInExpo => 'EaseInExpo',
      Curves.easeInCirc => 'EaseInCirc',
      Curves.easeInBack => 'EaseInBack',
      Curves.easeOut => 'EaseOut',
      Curves.linearToEaseOut => 'LinearToEaseOut',
      Curves.easeOutSine => 'EaseOutSine',
      Curves.easeOutQuad => 'EaseOutQuad',
      Curves.easeOutCubic => 'EaseOutCubic',
      Curves.easeOutQuart => 'EaseOutQuart',
      Curves.easeOutQuint => 'EaseOutQuint',
      Curves.easeOutExpo => 'EaseOutExpo',
      Curves.easeOutCirc => 'EaseOutCirc',
      Curves.easeOutBack => 'EaseOutBack',
      Curves.easeInOut => 'EaseInOut',
      Curves.easeInOutSine => 'EaseInOutSine',
      Curves.easeInOutQuad => 'EaseInOutQuad',
      Curves.easeInOutCubic => 'EaseInOutCubic',
      Curves.easeInOutQuart => 'EaseInOutQuart',
      Curves.easeInOutQuint => 'EaseInOutQuint',
      Curves.easeInOutExpo => 'EaseInOutExpo',
      Curves.easeInOutCirc => 'EaseInOutCirc',
      Curves.easeInOutBack => 'EaseInOutBack',
      Curves.fastOutSlowIn => 'FastOutSlowIn',
      Curves.slowMiddle => 'SlowMiddle',
      Curves.bounceIn => 'BounceIn',
      Curves.bounceOut => 'BounceOut',
      Curves.bounceInOut => 'Bounce,InOut',
      Curves.elasticIn => 'ElasticIn',
      Curves.elasticOut => 'ElasticOut',
      Curves.elasticInOut => 'ElasticInOut',
      _ => curve.toString(),
    };
  }
}
