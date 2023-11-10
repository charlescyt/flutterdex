// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $shellScaffoldRoute,
    ];

RouteBase get $shellScaffoldRoute => ShellRouteData.$route(
      navigatorKey: ShellScaffoldRoute.$navigatorKey,
      factory: $ShellScaffoldRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/widgets',
          factory: $WidgetHomeRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              parentNavigatorKey: WidgetDetailsRoute.$parentNavigatorKey,
              factory: $WidgetDetailsRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRouteExtension._fromState,
        ),
      ],
    );

extension $ShellScaffoldRouteExtension on ShellScaffoldRoute {
  static ShellScaffoldRoute _fromState(GoRouterState state) =>
      const ShellScaffoldRoute();
}

extension $WidgetHomeRouteExtension on WidgetHomeRoute {
  static WidgetHomeRoute _fromState(GoRouterState state) =>
      const WidgetHomeRoute();

  String get location => GoRouteData.$location(
        '/widgets',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WidgetDetailsRouteExtension on WidgetDetailsRoute {
  static WidgetDetailsRoute _fromState(GoRouterState state) =>
      WidgetDetailsRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/widgets/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
