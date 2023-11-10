import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/search_field.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../providers/widgets_provider.dart';
import '../widgets/widget_card.dart';
import '../widgets/widget_category_horizontal_bar.dart';
import '../widgets/widget_list_tile.dart';

class WidgetHomePage extends StatelessWidget {
  const WidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SlotLayout(
      config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key('Small'),
          builder: (_) => const _Small(),
        ),
        Breakpoints.mediumAndUp: SlotLayout.from(
          key: const Key('Large'),
          builder: (_) => const _Large(),
        ),
      },
    );
  }
}

class _Small extends ConsumerWidget {
  const _Small();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgets = ref.watch(flutterWidgetsProvider);
    final selectedWidgetType = ref.watch(selectedWidgetTypeProvider);
    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            TopAppBar(
              title: const Text('Flutter Widgets'),
              bottom: WidgetCategoryHorizontalBar(
                selected: selectedWidgetType,
                onTap: (value) => ref.read(selectedWidgetTypeProvider.notifier).update(value),
              ),
            ),
            SearchField(
              hintText: 'Search widget...',
              onChanged: (value) => ref.read(widgetSearchQueryProvider.notifier).updateSearchQuery(value),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                itemCount: widgets.length,
                itemBuilder: (_, index) => FlutterWidgetListTile(widgets[index])
                    .animate(
                      key: ValueKey('$selectedWidgetType-${widgets[index].id}'),
                      delay: 200.ms,
                    )
                    .fadeIn(duration: 500.ms, curve: Curves.easeInOut)
                    .scaleXY()
                    .blurXY(begin: 8, end: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Large extends ConsumerWidget {
  const _Large();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgets = ref.watch(flutterWidgetsProvider);
    final selectedWidgetType = ref.watch(selectedWidgetTypeProvider);
    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: WidgetCategoryHorizontalBar(
                selected: selectedWidgetType,
                onTap: (value) => ref.read(selectedWidgetTypeProvider.notifier).update(value),
              ),
            ),
            SearchField(
              hintText: 'Search widget...',
              onChanged: (value) => ref.read(widgetSearchQueryProvider.notifier).updateSearchQuery(value),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  const maxCrossAxisExtent = 220.0;
                  const leftPadding = 8.0;
                  const rightPadding = 8.0;
                  final widthWithoutPadding = constraints.maxWidth - leftPadding - rightPadding;
                  final crossAxisCount = (widthWithoutPadding / maxCrossAxisExtent).ceil();
                  return GridView.builder(
                    padding: const EdgeInsets.only(left: leftPadding, right: rightPadding, bottom: 8),
                    itemCount: widgets.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: maxCrossAxisExtent,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (_, index) => FlutterWidgetCard(widgets[index])
                        .animate(
                          key: ValueKey('$selectedWidgetType-${widgets[index].id}'),
                          delay: 200.ms + (index % crossAxisCount * 100).ms,
                        )
                        .fadeIn(duration: 500.ms, curve: Curves.easeInOut)
                        .scaleXY()
                        .blurXY(begin: 8, end: 0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
