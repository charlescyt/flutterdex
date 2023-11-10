import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart' show immutable;

final _logger = Logger('Riverpod');

@immutable
class RiverpodLogger extends ProviderObserver {
  const RiverpodLogger();

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger.fine(
      '''
Added Provider: ${provider.name ?? provider.runtimeType}
Value: $value
''',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.fine(
      '''
Updated Provider: ${provider.name ?? provider.runtimeType}
Previous value: $previousValue
New value: $newValue
''',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logger.fine(
      '''
Disposed Provider: ${provider.name ?? provider.runtimeType}
''',
    );
  }
}
