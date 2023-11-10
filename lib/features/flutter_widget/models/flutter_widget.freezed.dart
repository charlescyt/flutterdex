// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flutter_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlutterWidget _$FlutterWidgetFromJson(Map<String, dynamic> json) {
  return _FlutterWidget.fromJson(json);
}

/// @nodoc
mixin _$FlutterWidget {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;
  WidgetCategory get category => throw _privateConstructorUsedError;
  WidgetType get type => throw _privateConstructorUsedError;
  List<FlutterWidgetReference> get related =>
      throw _privateConstructorUsedError;
  List<Constructor> get availableConstructors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlutterWidgetCopyWith<FlutterWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterWidgetCopyWith<$Res> {
  factory $FlutterWidgetCopyWith(
          FlutterWidget value, $Res Function(FlutterWidget) then) =
      _$FlutterWidgetCopyWithImpl<$Res, FlutterWidget>;
  @useResult
  $Res call(
      {String id,
      String label,
      String description,
      Uri url,
      WidgetCategory category,
      WidgetType type,
      List<FlutterWidgetReference> related,
      List<Constructor> availableConstructors});
}

/// @nodoc
class _$FlutterWidgetCopyWithImpl<$Res, $Val extends FlutterWidget>
    implements $FlutterWidgetCopyWith<$Res> {
  _$FlutterWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = null,
    Object? url = null,
    Object? category = null,
    Object? type = null,
    Object? related = null,
    Object? availableConstructors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as WidgetCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WidgetType,
      related: null == related
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as List<FlutterWidgetReference>,
      availableConstructors: null == availableConstructors
          ? _value.availableConstructors
          : availableConstructors // ignore: cast_nullable_to_non_nullable
              as List<Constructor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlutterWidgetImplCopyWith<$Res>
    implements $FlutterWidgetCopyWith<$Res> {
  factory _$$FlutterWidgetImplCopyWith(
          _$FlutterWidgetImpl value, $Res Function(_$FlutterWidgetImpl) then) =
      __$$FlutterWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String description,
      Uri url,
      WidgetCategory category,
      WidgetType type,
      List<FlutterWidgetReference> related,
      List<Constructor> availableConstructors});
}

/// @nodoc
class __$$FlutterWidgetImplCopyWithImpl<$Res>
    extends _$FlutterWidgetCopyWithImpl<$Res, _$FlutterWidgetImpl>
    implements _$$FlutterWidgetImplCopyWith<$Res> {
  __$$FlutterWidgetImplCopyWithImpl(
      _$FlutterWidgetImpl _value, $Res Function(_$FlutterWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? description = null,
    Object? url = null,
    Object? category = null,
    Object? type = null,
    Object? related = null,
    Object? availableConstructors = null,
  }) {
    return _then(_$FlutterWidgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as WidgetCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WidgetType,
      related: null == related
          ? _value._related
          : related // ignore: cast_nullable_to_non_nullable
              as List<FlutterWidgetReference>,
      availableConstructors: null == availableConstructors
          ? _value._availableConstructors
          : availableConstructors // ignore: cast_nullable_to_non_nullable
              as List<Constructor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlutterWidgetImpl implements _FlutterWidget {
  const _$FlutterWidgetImpl(
      {required this.id,
      required this.label,
      required this.description,
      required this.url,
      required this.category,
      required this.type,
      required final List<FlutterWidgetReference> related,
      required final List<Constructor> availableConstructors})
      : _related = related,
        _availableConstructors = availableConstructors;

  factory _$FlutterWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlutterWidgetImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String description;
  @override
  final Uri url;
  @override
  final WidgetCategory category;
  @override
  final WidgetType type;
  final List<FlutterWidgetReference> _related;
  @override
  List<FlutterWidgetReference> get related {
    if (_related is EqualUnmodifiableListView) return _related;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_related);
  }

  final List<Constructor> _availableConstructors;
  @override
  List<Constructor> get availableConstructors {
    if (_availableConstructors is EqualUnmodifiableListView)
      return _availableConstructors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableConstructors);
  }

  @override
  String toString() {
    return 'FlutterWidget(id: $id, label: $label, description: $description, url: $url, category: $category, type: $type, related: $related, availableConstructors: $availableConstructors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._related, _related) &&
            const DeepCollectionEquality()
                .equals(other._availableConstructors, _availableConstructors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      description,
      url,
      category,
      type,
      const DeepCollectionEquality().hash(_related),
      const DeepCollectionEquality().hash(_availableConstructors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlutterWidgetImplCopyWith<_$FlutterWidgetImpl> get copyWith =>
      __$$FlutterWidgetImplCopyWithImpl<_$FlutterWidgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlutterWidgetImplToJson(
      this,
    );
  }
}

abstract class _FlutterWidget implements FlutterWidget {
  const factory _FlutterWidget(
          {required final String id,
          required final String label,
          required final String description,
          required final Uri url,
          required final WidgetCategory category,
          required final WidgetType type,
          required final List<FlutterWidgetReference> related,
          required final List<Constructor> availableConstructors}) =
      _$FlutterWidgetImpl;

  factory _FlutterWidget.fromJson(Map<String, dynamic> json) =
      _$FlutterWidgetImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get description;
  @override
  Uri get url;
  @override
  WidgetCategory get category;
  @override
  WidgetType get type;
  @override
  List<FlutterWidgetReference> get related;
  @override
  List<Constructor> get availableConstructors;
  @override
  @JsonKey(ignore: true)
  _$$FlutterWidgetImplCopyWith<_$FlutterWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlutterWidgetReference _$FlutterWidgetReferenceFromJson(
    Map<String, dynamic> json) {
  return _FlutterWidgetReference.fromJson(json);
}

/// @nodoc
mixin _$FlutterWidgetReference {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlutterWidgetReferenceCopyWith<FlutterWidgetReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterWidgetReferenceCopyWith<$Res> {
  factory $FlutterWidgetReferenceCopyWith(FlutterWidgetReference value,
          $Res Function(FlutterWidgetReference) then) =
      _$FlutterWidgetReferenceCopyWithImpl<$Res, FlutterWidgetReference>;
  @useResult
  $Res call({String id, String label});
}

/// @nodoc
class _$FlutterWidgetReferenceCopyWithImpl<$Res,
        $Val extends FlutterWidgetReference>
    implements $FlutterWidgetReferenceCopyWith<$Res> {
  _$FlutterWidgetReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlutterWidgetReferenceImplCopyWith<$Res>
    implements $FlutterWidgetReferenceCopyWith<$Res> {
  factory _$$FlutterWidgetReferenceImplCopyWith(
          _$FlutterWidgetReferenceImpl value,
          $Res Function(_$FlutterWidgetReferenceImpl) then) =
      __$$FlutterWidgetReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label});
}

/// @nodoc
class __$$FlutterWidgetReferenceImplCopyWithImpl<$Res>
    extends _$FlutterWidgetReferenceCopyWithImpl<$Res,
        _$FlutterWidgetReferenceImpl>
    implements _$$FlutterWidgetReferenceImplCopyWith<$Res> {
  __$$FlutterWidgetReferenceImplCopyWithImpl(
      _$FlutterWidgetReferenceImpl _value,
      $Res Function(_$FlutterWidgetReferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$FlutterWidgetReferenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlutterWidgetReferenceImpl implements _FlutterWidgetReference {
  const _$FlutterWidgetReferenceImpl({required this.id, required this.label});

  factory _$FlutterWidgetReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlutterWidgetReferenceImplFromJson(json);

  @override
  final String id;
  @override
  final String label;

  @override
  String toString() {
    return 'FlutterWidgetReference(id: $id, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterWidgetReferenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlutterWidgetReferenceImplCopyWith<_$FlutterWidgetReferenceImpl>
      get copyWith => __$$FlutterWidgetReferenceImplCopyWithImpl<
          _$FlutterWidgetReferenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlutterWidgetReferenceImplToJson(
      this,
    );
  }
}

abstract class _FlutterWidgetReference implements FlutterWidgetReference {
  const factory _FlutterWidgetReference(
      {required final String id,
      required final String label}) = _$FlutterWidgetReferenceImpl;

  factory _FlutterWidgetReference.fromJson(Map<String, dynamic> json) =
      _$FlutterWidgetReferenceImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$FlutterWidgetReferenceImplCopyWith<_$FlutterWidgetReferenceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Constructor _$ConstructorFromJson(Map<String, dynamic> json) {
  return _Constructor.fromJson(json);
}

/// @nodoc
mixin _$Constructor {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConstructorCopyWith<Constructor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstructorCopyWith<$Res> {
  factory $ConstructorCopyWith(
          Constructor value, $Res Function(Constructor) then) =
      _$ConstructorCopyWithImpl<$Res, Constructor>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$ConstructorCopyWithImpl<$Res, $Val extends Constructor>
    implements $ConstructorCopyWith<$Res> {
  _$ConstructorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConstructorImplCopyWith<$Res>
    implements $ConstructorCopyWith<$Res> {
  factory _$$ConstructorImplCopyWith(
          _$ConstructorImpl value, $Res Function(_$ConstructorImpl) then) =
      __$$ConstructorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$ConstructorImplCopyWithImpl<$Res>
    extends _$ConstructorCopyWithImpl<$Res, _$ConstructorImpl>
    implements _$$ConstructorImplCopyWith<$Res> {
  __$$ConstructorImplCopyWithImpl(
      _$ConstructorImpl _value, $Res Function(_$ConstructorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$ConstructorImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstructorImpl extends _Constructor {
  const _$ConstructorImpl({required this.name, required this.code}) : super._();

  factory _$ConstructorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstructorImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'Constructor(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstructorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstructorImplCopyWith<_$ConstructorImpl> get copyWith =>
      __$$ConstructorImplCopyWithImpl<_$ConstructorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstructorImplToJson(
      this,
    );
  }
}

abstract class _Constructor extends Constructor {
  const factory _Constructor(
      {required final String name,
      required final String code}) = _$ConstructorImpl;
  const _Constructor._() : super._();

  factory _Constructor.fromJson(Map<String, dynamic> json) =
      _$ConstructorImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$ConstructorImplCopyWith<_$ConstructorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
