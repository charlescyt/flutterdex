import 'package:flutter/material.dart';

class OutlinedBox extends StatelessWidget {
  const OutlinedBox({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: theme.colorScheme.inverseSurface,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
      child: child,
    );
  }
}
