import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/router.dart';
import '../models/flutter_widget.dart';
import '../providers/widgets_provider.dart';

class WidgetReferenceChip extends ConsumerWidget {
  const WidgetReferenceChip(
    this.reference, {
    super.key,
  });

  final FlutterWidgetReference reference;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isAvailable = ref.watch(isFlutterWidgetAvailableProvider(id: reference.id));
    return ActionChip(
      label: Text(reference.label),
      backgroundColor: isAvailable //
          ? theme.colorScheme.primaryContainer
          : theme.disabledColor,
      onPressed: isAvailable //
          ? () async => WidgetDetailsRoute(id: reference.id).push(context)
          : null,
    );
  }
}
