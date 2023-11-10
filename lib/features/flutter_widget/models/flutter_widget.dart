import 'package:freezed_annotation/freezed_annotation.dart';

import 'widget_category.dart';
import 'widget_type.dart';

part 'flutter_widget.freezed.dart';
part 'flutter_widget.g.dart';

@freezed
class FlutterWidget with _$FlutterWidget {
  const factory FlutterWidget({
    required String id,
    required String label,
    required String description,
    required Uri url,
    required WidgetCategory category,
    required WidgetType type,
    required List<FlutterWidgetReference> related,
    required List<Constructor> availableConstructors,
  }) = _FlutterWidget;

  factory FlutterWidget.fromJson(Map<String, dynamic> json) => _$FlutterWidgetFromJson(json);
}

@freezed
class FlutterWidgetReference with _$FlutterWidgetReference {
  const factory FlutterWidgetReference({
    required String id,
    required String label,
  }) = _FlutterWidgetReference;

  factory FlutterWidgetReference.fromJson(Map<String, dynamic> json) => _$FlutterWidgetReferenceFromJson(json);
}

@freezed
class Constructor with _$Constructor {
  const factory Constructor({
    required String name,
    required String code,
  }) = _Constructor;

  factory Constructor.fromJson(Map<String, dynamic> json) => _$ConstructorFromJson(json);

  const Constructor._();

  String get formattedCode => code.replaceAll(', ', ',\n  ').replaceAll('({', '({\n  ').replaceAll('})', ',\n})');
}
