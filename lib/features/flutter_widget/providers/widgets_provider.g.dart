// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterWidgetsAsyncHash() =>
    r'7f48e4c8deaa0c01d32e9d12894aa9a70794bc17';

/// See also [flutterWidgetsAsync].
@ProviderFor(flutterWidgetsAsync)
final flutterWidgetsAsyncProvider =
    FutureProvider<List<FlutterWidget>>.internal(
  flutterWidgetsAsync,
  name: r'flutterWidgetsAsyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterWidgetsAsyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterWidgetsAsyncRef = FutureProviderRef<List<FlutterWidget>>;
String _$flutterWidgetMapHash() => r'3f2a3813c258345e6967c8154a634ae7bceffe76';

/// See also [flutterWidgetMap].
@ProviderFor(flutterWidgetMap)
final flutterWidgetMapProvider = Provider<Map<String, FlutterWidget>>.internal(
  flutterWidgetMap,
  name: r'flutterWidgetMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterWidgetMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterWidgetMapRef = ProviderRef<Map<String, FlutterWidget>>;
String _$flutterWidgetsHash() => r'673c7ee3bb0a267d95d247fe7ef5f000070446c3';

/// See also [flutterWidgets].
@ProviderFor(flutterWidgets)
final flutterWidgetsProvider =
    AutoDisposeProvider<List<FlutterWidget>>.internal(
  flutterWidgets,
  name: r'flutterWidgetsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterWidgetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterWidgetsRef = AutoDisposeProviderRef<List<FlutterWidget>>;
String _$flutterWidgetHash() => r'2e7bd16d18ae525394f36a61f54b97bda922404a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [flutterWidget].
@ProviderFor(flutterWidget)
const flutterWidgetProvider = FlutterWidgetFamily();

/// See also [flutterWidget].
class FlutterWidgetFamily extends Family<FlutterWidget?> {
  /// See also [flutterWidget].
  const FlutterWidgetFamily();

  /// See also [flutterWidget].
  FlutterWidgetProvider call({
    required String id,
  }) {
    return FlutterWidgetProvider(
      id: id,
    );
  }

  @override
  FlutterWidgetProvider getProviderOverride(
    covariant FlutterWidgetProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'flutterWidgetProvider';
}

/// See also [flutterWidget].
class FlutterWidgetProvider extends AutoDisposeProvider<FlutterWidget?> {
  /// See also [flutterWidget].
  FlutterWidgetProvider({
    required String id,
  }) : this._internal(
          (ref) => flutterWidget(
            ref as FlutterWidgetRef,
            id: id,
          ),
          from: flutterWidgetProvider,
          name: r'flutterWidgetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flutterWidgetHash,
          dependencies: FlutterWidgetFamily._dependencies,
          allTransitiveDependencies:
              FlutterWidgetFamily._allTransitiveDependencies,
          id: id,
        );

  FlutterWidgetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FlutterWidget? Function(FlutterWidgetRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlutterWidgetProvider._internal(
        (ref) => create(ref as FlutterWidgetRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<FlutterWidget?> createElement() {
    return _FlutterWidgetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlutterWidgetProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlutterWidgetRef on AutoDisposeProviderRef<FlutterWidget?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FlutterWidgetProviderElement
    extends AutoDisposeProviderElement<FlutterWidget?> with FlutterWidgetRef {
  _FlutterWidgetProviderElement(super.provider);

  @override
  String get id => (origin as FlutterWidgetProvider).id;
}

String _$isFlutterWidgetAvailableHash() =>
    r'854b4f30297466fba4aadfa20bbc0f74ac1e7608';

/// See also [isFlutterWidgetAvailable].
@ProviderFor(isFlutterWidgetAvailable)
const isFlutterWidgetAvailableProvider = IsFlutterWidgetAvailableFamily();

/// See also [isFlutterWidgetAvailable].
class IsFlutterWidgetAvailableFamily extends Family<bool> {
  /// See also [isFlutterWidgetAvailable].
  const IsFlutterWidgetAvailableFamily();

  /// See also [isFlutterWidgetAvailable].
  IsFlutterWidgetAvailableProvider call({
    required String id,
  }) {
    return IsFlutterWidgetAvailableProvider(
      id: id,
    );
  }

  @override
  IsFlutterWidgetAvailableProvider getProviderOverride(
    covariant IsFlutterWidgetAvailableProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFlutterWidgetAvailableProvider';
}

/// See also [isFlutterWidgetAvailable].
class IsFlutterWidgetAvailableProvider extends AutoDisposeProvider<bool> {
  /// See also [isFlutterWidgetAvailable].
  IsFlutterWidgetAvailableProvider({
    required String id,
  }) : this._internal(
          (ref) => isFlutterWidgetAvailable(
            ref as IsFlutterWidgetAvailableRef,
            id: id,
          ),
          from: isFlutterWidgetAvailableProvider,
          name: r'isFlutterWidgetAvailableProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFlutterWidgetAvailableHash,
          dependencies: IsFlutterWidgetAvailableFamily._dependencies,
          allTransitiveDependencies:
              IsFlutterWidgetAvailableFamily._allTransitiveDependencies,
          id: id,
        );

  IsFlutterWidgetAvailableProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    bool Function(IsFlutterWidgetAvailableRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFlutterWidgetAvailableProvider._internal(
        (ref) => create(ref as IsFlutterWidgetAvailableRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFlutterWidgetAvailableProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFlutterWidgetAvailableProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFlutterWidgetAvailableRef on AutoDisposeProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;
}

class _IsFlutterWidgetAvailableProviderElement
    extends AutoDisposeProviderElement<bool> with IsFlutterWidgetAvailableRef {
  _IsFlutterWidgetAvailableProviderElement(super.provider);

  @override
  String get id => (origin as IsFlutterWidgetAvailableProvider).id;
}

String _$widgetSearchQueryHash() => r'c173fa286209fcec9a5a7f495c2460de370cc3d9';

/// See also [WidgetSearchQuery].
@ProviderFor(WidgetSearchQuery)
final widgetSearchQueryProvider =
    AutoDisposeNotifierProvider<WidgetSearchQuery, String?>.internal(
  WidgetSearchQuery.new,
  name: r'widgetSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$widgetSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WidgetSearchQuery = AutoDisposeNotifier<String?>;
String _$selectedWidgetTypeHash() =>
    r'712658c010382d2b34902035b43cc36c7c2d7003';

/// See also [SelectedWidgetType].
@ProviderFor(SelectedWidgetType)
final selectedWidgetTypeProvider =
    NotifierProvider<SelectedWidgetType, WidgetCategory?>.internal(
  SelectedWidgetType.new,
  name: r'selectedWidgetTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedWidgetTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedWidgetType = Notifier<WidgetCategory?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
