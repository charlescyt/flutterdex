import 'package:meta/meta.dart' show immutable;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfoAsync(PackageInfoAsyncRef ref) async {
  return PackageInfo.fromPlatform();
}

@Riverpod(keepAlive: true)
PackageInfoFacade packageInfo(PackageInfoRef ref) {
  final packageInfo = ref.watch(packageInfoAsyncProvider).requireValue;
  return PackageInfoFacade(packageInfo);
}

@immutable
class PackageInfoFacade {
  final PackageInfo _packageInfo;

  const PackageInfoFacade(this._packageInfo);

  String get appName => _packageInfo.appName;

  String get packageName => _packageInfo.packageName;

  String get version => _packageInfo.version;

  String get buildNumber => _packageInfo.buildNumber;
}
