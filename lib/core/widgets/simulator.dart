import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../utils/app_scroll_behavior.dart';

enum SimulatorType {
  android,
  ios,
  ;

  String get label => switch (this) {
        android => 'Android',
        ios => 'iOS',
      };
}

class Simulator extends StatelessWidget {
  const Simulator({
    super.key,
    required this.child,
    this.type = SimulatorType.ios,
    this.constraints = const BoxConstraints(maxHeight: 900, minHeight: 300, maxWidth: 400, minWidth: 300),
  });

  final Widget child;
  final SimulatorType type;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: DeviceFrame(
        device: type == SimulatorType.ios //
            ? Devices.ios.iPhone13ProMax
            : Devices.android.samsungGalaxyS20,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
          scrollBehavior: const AppScrollBehavior(),
          home: child,
        ),
      ),
    );
  }
}
