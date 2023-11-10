import 'dart:async';
import 'dart:ui' show VoidCallback;

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer(this.delay);

  void debounce(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
