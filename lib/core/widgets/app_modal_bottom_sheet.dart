import 'package:flutter/material.dart';

class AppModalBottomSheet<T> extends StatelessWidget {
  const AppModalBottomSheet({
    super.key,
    required this.selected,
    required this.items,
    required this.titleBuilder,
    required this.onSelected,
  });

  final T? selected;
  final List<T> items;
  final Widget Function(T item) titleBuilder;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            for (final item in items)
              ListTile(
                selected: selected == item,
                selectedColor: theme.colorScheme.primary,
                title: titleBuilder(item),
                trailing: selected == item ? const Icon(Icons.check) : null,
                onTap: () {
                  onSelected(item);
                  Navigator.of(context).pop(item);
                },
              ),
          ],
        ).toList(),
      ),
    );
  }
}
