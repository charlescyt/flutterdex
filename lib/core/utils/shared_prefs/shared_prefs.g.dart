// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsAsyncHash() => r'4936c9d0c359581788200656aa350e7ab5c3ee38';

/// See also [sharedPrefsAsync].
@ProviderFor(sharedPrefsAsync)
final sharedPrefsAsyncProvider = FutureProvider<SharedPreferences>.internal(
  sharedPrefsAsync,
  name: r'sharedPrefsAsyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPrefsAsyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPrefsAsyncRef = FutureProviderRef<SharedPreferences>;
String _$sharedPrefsHash() => r'9741266d641a00c77492222e886ba6b66274f007';

/// See also [sharedPrefs].
@ProviderFor(sharedPrefs)
final sharedPrefsProvider = Provider<SharedPrefsFacade>.internal(
  sharedPrefs,
  name: r'sharedPrefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPrefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPrefsRef = ProviderRef<SharedPrefsFacade>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
