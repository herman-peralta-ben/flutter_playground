// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
    ];

RouteBase get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/providerCounter',
          factory: $ProviderCounterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/riverpodCounter',
          factory: $RiverpodCounterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/renderObject',
          factory: $RenderObjectRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/repaintBoundary',
          factory: $WidgetRepaintBoundaryRouteExtension._fromState,
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProviderCounterRouteExtension on ProviderCounterRoute {
  static ProviderCounterRoute _fromState(GoRouterState state) =>
      ProviderCounterRoute();

  String get location => GoRouteData.$location(
        '/providerCounter',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RiverpodCounterRouteExtension on RiverpodCounterRoute {
  static RiverpodCounterRoute _fromState(GoRouterState state) =>
      RiverpodCounterRoute();

  String get location => GoRouteData.$location(
        '/riverpodCounter',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RenderObjectRouteExtension on RenderObjectRoute {
  static RenderObjectRoute _fromState(GoRouterState state) =>
      RenderObjectRoute();

  String get location => GoRouteData.$location(
        '/renderObject',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WidgetRepaintBoundaryRouteExtension on WidgetRepaintBoundaryRoute {
  static WidgetRepaintBoundaryRoute _fromState(GoRouterState state) =>
      WidgetRepaintBoundaryRoute();

  String get location => GoRouteData.$location(
        '/repaintBoundary',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
