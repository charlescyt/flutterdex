import 'package:logging/logging.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefsAsync(SharedPrefsAsyncRef ref) async {
  return SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
SharedPrefsFacade sharedPrefs(SharedPrefsRef ref) {
  final sharedPrefs = ref.watch(sharedPrefsAsyncProvider).requireValue;
  return SharedPrefsFacade(sharedPrefs);
}

final _logger = Logger('SharedPrefs');

@immutable
class SharedPrefsFacade {
  final SharedPreferences _sharedPreferences;

  const SharedPrefsFacade(this._sharedPreferences);

  Future<bool> saveString(String key, String value) async {
    final result = await _sharedPreferences.setString(key, value);
    if (result) {
      _logger.fine('Successfully saved string with key: $key and value: $value');
    } else {
      _logger.warning('Failed to save string with key: $key and value: $value');
    }
    return result;
  }

  String? loadString(String key) {
    try {
      final value = _sharedPreferences.getString(key);
      _logger.fine('Successfully loaded string with key: $key and value: $value');
      return value;
    } on Exception catch (e, st) {
      _logger.warning('Failed to load string with key: $key', e, st);
      return null;
    }
  }

  Future<bool> saveBool(String key, bool value) async {
    final result = await _sharedPreferences.setBool(key, value);
    if (result) {
      _logger.fine('Successfully saved bool with key: $key and value: $value');
    } else {
      _logger.warning('Failed to save bool with key: $key and value: $value');
    }
    return result;
  }

  bool? loadBool(String key) {
    try {
      final value = _sharedPreferences.getBool(key);
      _logger.fine('Successfully loaded bool with key: $key and value: $value');
      return value;
    } on Exception catch (e, st) {
      _logger.warning('Failed to load bool with key: $key', e, st);
      return null;
    }
  }
}
