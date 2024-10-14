import 'package:flutter/widgets.dart';
import 'package:flutter_playground/examples/examples_list_screen.dart';
import 'package:flutter_playground/examples/state/provider_counter_example.dart';
import 'package:flutter_playground/examples/state/riverpod_counter_example/riverpod_counter_example.dart';
import 'package:flutter_playground/examples/ui/render_object_example/render_object_example.dart';
import 'package:flutter_playground/examples/ui/widget_repaint_boundary_example.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// https://pub.dev/packages/go_router_builder/example
// [!Add deeplinks]
class Routes {
  // TODO PUT TITLE HERE
  static const String root = '/';
  // state
  static const String providerCounter = '/providerCounter';
  static const String riverpodCounter = '/riverpodCounter';
  // ui
  static const String renderObject = '/renderObject';
  static const String repaintBoundary = '/repaintBoundary';
}

final GlobalKey<NavigatorState> appRootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'appRootKey');

/*
 * Android:
 *    adb shell 'am start -d "testing://flutter_playground.com/riverpodCounter"'
 *    adb shell 'am start -d "http://flutter_playground.com/repaintBoundary"'
 *    adb shell 'am start -d "https://flutter_playground.com/providerCounter"'
 * iOS:
 *  // TODO
 */
// https://docs.flutter.dev/ui/navigation/deep-linking
// https://docs.flutter.dev/cookbook/navigation/set-up-app-links
final router = GoRouter(
  debugLogDiagnostics: true,
  routes: $appRoutes,
  initialLocation: Routes.root,
  navigatorKey: appRootNavigatorKey,
);

@TypedGoRoute<RootRoute>(
  path: Routes.root,
  routes: [
    TypedGoRoute<ProviderCounterRoute>(path: Routes.providerCounter),
    TypedGoRoute<RiverpodCounterRoute>(path: Routes.riverpodCounter),
    TypedGoRoute<RenderObjectRoute>(path: Routes.renderObject),
    TypedGoRoute<WidgetRepaintBoundaryRoute>(path: Routes.repaintBoundary),
  ],
)
class RootRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExamplesListScreen(
      title: "Examples",
      examples: [
        Example(Routes.providerCounter, "ProviderCounter"),
        Example(Routes.riverpodCounter, "RiverpodCounter"),
        Example(Routes.renderObject, "RenderObject"),
        Example(Routes.repaintBoundary, "RepaintBoundary"),
      ],
    );
  }
}

class ProviderCounterRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProviderCounterExampleScreen();
  }
}

class RiverpodCounterRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodCounterExampleScreen();
  }
}

class RenderObjectRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RenderObjectExampleScreen();
  }
}

class WidgetRepaintBoundaryRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WidgetRepaintBoundaryExampleScreen();
  }
}
