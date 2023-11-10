import 'package:flutter/material.dart';

class LabelDivider extends StatelessWidget {
  const LabelDivider({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          color: theme.dividerColor,
          thickness: 2,
        ),
        Material(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: onTap,
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: theme.dividerColor,
                    width: 2,
                  ),
                ),
              ),
              child: DefaultTextStyle.merge(
                style: const TextStyle(fontWeight: FontWeight.bold),
                child: Text(label),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
