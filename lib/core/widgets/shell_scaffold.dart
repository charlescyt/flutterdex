import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router.dart';
import '../utils/package_info/package_info.dart';

class ShellScaffold extends ConsumerWidget {
  const ShellScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(SettingsRoute.path)) {
      return 1;
    }

    return 0;
  }

  void onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        const WidgetHomeRoute().go(context);
      case 1:
        const SettingsRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = getCurrentIndex(context);
    final packageInfo = ref.watch(packageInfoProvider);

    return SlotLayout(
      config: {
        Breakpoints.small: SlotLayout.from(
          key: const Key('Small'),
          builder: (_) => Scaffold(
            body: child,
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => onDestinationSelected(context, index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.my_library_books_outlined),
                  selectedIcon: Icon(Icons.my_library_books),
                  label: 'Widgets',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
        Breakpoints.mediumAndUp: SlotLayout.from(
          key: const Key('MediumAndUp'),
          builder: (_) => Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: true,
                  minExtendedWidth: 160,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => onDestinationSelected(context, index),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.my_library_books_outlined),
                      selectedIcon: Icon(Icons.my_library_books),
                      label: Text('Widgets'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                  trailing: Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text('v${packageInfo.version}'),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      },
    );
  }
}
