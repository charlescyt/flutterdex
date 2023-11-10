// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlutterWidgetImpl _$$FlutterWidgetImplFromJson(Map<String, dynamic> json) =>
    _$FlutterWidgetImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      url: Uri.parse(json['url'] as String),
      category: $enumDecode(_$WidgetCategoryEnumMap, json['category']),
      type: $enumDecode(_$WidgetTypeEnumMap, json['type']),
      related: (json['related'] as List<dynamic>)
          .map(
              (e) => FlutterWidgetReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableConstructors: (json['availableConstructors'] as List<dynamic>)
          .map((e) => Constructor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FlutterWidgetImplToJson(_$FlutterWidgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'url': instance.url.toString(),
      'category': _$WidgetCategoryEnumMap[instance.category]!,
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'related': instance.related,
      'availableConstructors': instance.availableConstructors,
    };

const _$WidgetCategoryEnumMap = {
  WidgetCategory.material: 'material',
  WidgetCategory.cupertino: 'cupertino',
  WidgetCategory.layout: 'layout',
  WidgetCategory.graphics: 'graphics',
  WidgetCategory.scrolling: 'scrolling',
  WidgetCategory.animation: 'animation',
};

const _$WidgetTypeEnumMap = {
  WidgetType.stateless: 'stateless',
  WidgetType.stateful: 'stateful',
  WidgetType.renderObject: 'renderObject',
  WidgetType.preferredSize: 'preferredSize',
  WidgetType.proxy: 'proxy',
};

_$FlutterWidgetReferenceImpl _$$FlutterWidgetReferenceImplFromJson(
        Map<String, dynamic> json) =>
    _$FlutterWidgetReferenceImpl(
      id: json['id'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$FlutterWidgetReferenceImplToJson(
        _$FlutterWidgetReferenceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_$ConstructorImpl _$$ConstructorImplFromJson(Map<String, dynamic> json) =>
    _$ConstructorImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$ConstructorImplToJson(_$ConstructorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
