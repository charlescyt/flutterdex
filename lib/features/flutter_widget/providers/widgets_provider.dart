import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/flutter_widget.dart';
import '../models/widget_category.dart';
import '../repos/flutter_widget_repo.dart';

part 'widgets_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<FlutterWidget>> flutterWidgetsAsync(FlutterWidgetsAsyncRef ref) async {
  final repo = ref.watch(flutterWidgetRepoProvider);
  final widgets = await repo.loadFlutterWidgets();
  return widgets;
}

@Riverpod(keepAlive: true)
Map<String, FlutterWidget> flutterWidgetMap(FlutterWidgetMapRef ref) {
  final widgets = ref.watch(flutterWidgetsAsyncProvider).requireValue;
  return {for (final widget in widgets) widget.id: widget};
}

@riverpod
List<FlutterWidget> flutterWidgets(FlutterWidgetsRef ref) {
  final widgets = ref.watch(flutterWidgetsAsyncProvider).requireValue;

  final searchQuery = ref.watch(widgetSearchQueryProvider);
  final selectedWidgetType = ref.watch(selectedWidgetTypeProvider);

  var filteredWidgets = widgets;

  if (searchQuery != null) {
    filteredWidgets = widgets.where((w) => w.label.toLowerCase().contains(searchQuery)).toList();
  }

  if (selectedWidgetType != null) {
    filteredWidgets = filteredWidgets.where((w) => w.category == selectedWidgetType).toList();
  }

  return filteredWidgets;
}

@riverpod
FlutterWidget? flutterWidget(
  FlutterWidgetRef ref, {
  required String id,
}) {
  final widgetMap = ref.watch(flutterWidgetMapProvider);
  return widgetMap[id];
}

@riverpod
bool isFlutterWidgetAvailable(
  IsFlutterWidgetAvailableRef ref, {
  required String id,
}) {
  final widgetMap = ref.watch(flutterWidgetMapProvider);
  return widgetMap.containsKey(id);
}

@riverpod
class WidgetSearchQuery extends _$WidgetSearchQuery {
  @override
  String? build() => null;

  // ignore: use_setters_to_change_properties
  void updateSearchQuery(String value) => state = value;
}

@Riverpod(keepAlive: true)
class SelectedWidgetType extends _$SelectedWidgetType {
  @override
  WidgetCategory? build() => null;

  // ignore: use_setters_to_change_properties
  void update(WidgetCategory? value) => state = value;
}
