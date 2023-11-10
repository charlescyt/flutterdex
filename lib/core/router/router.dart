import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/flutter_widget/pages/widget_details_page.dart';
import '../../features/flutter_widget/pages/widget_home_page.dart';
import '../../features/settings/pages/settings_page.dart';
import '../widgets/shell_scaffold.dart';
import 'fade_transition_page.dart';
import 'slide_transition_page.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root Navigator');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Shell Navigator');

final router = GoRouter(
  debugLogDiagnostics: false,
  navigatorKey: _rootNavigatorKey,
  initialLocation: WidgetHomeRoute.path,
  routes: $appRoutes,
);

@TypedShellRoute<ShellScaffoldRoute>(
  routes: [
    TypedGoRoute<WidgetHomeRoute>(
      path: WidgetHomeRoute.path,
      routes: [
        TypedGoRoute<WidgetDetailsRoute>(path: WidgetDetailsRoute.path),
      ],
    ),
    TypedGoRoute<SettingsRoute>(path: SettingsRoute.path),
  ],
)
class ShellScaffoldRoute extends ShellRouteData {
  const ShellScaffoldRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: ShellScaffold(child: navigator),
    );
  }
}

class WidgetHomeRoute extends GoRouteData {
  const WidgetHomeRoute();

  static const String path = '/widgets';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadeTransitionPage(
      pageKey: state.pageKey,
      child: const WidgetHomePage(),
    );
  }
}

class WidgetDetailsRoute extends GoRouteData {
  const WidgetDetailsRoute({
    required this.id,
  });

  static const String path = ':id';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: WidgetDetailsPage(id: id),
    );
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const String path = '/settings';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadeTransitionPage(
      pageKey: state.pageKey,
      child: const SettingsPage(),
    );
  }
}
