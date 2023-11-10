import 'non_web.dart' if (dart.library.html) 'web.dart' as platform;

abstract final class PlatformPlus {
  static bool get isAndroid => platform.isAndroid;
  static bool get isIOS => platform.isIOS;
  static bool get isWeb => platform.isWeb;
  static bool get isMacOS => platform.isMacOS;
  static bool get isWindows => platform.isWindows;
  static bool get isLinux => platform.isLinux;
  static bool get isFuchsia => platform.isFuchsia;

  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktop => isMacOS || isWindows || isLinux;
}
