import 'package:flutter/widgets.dart';
import 'package:flutter_playground/examples/examples_list_screen.dart';
import 'package:flutter_playground/examples/state/provider_counter_example.dart';
import 'package:flutter_playground/examples/state/riverpod_counter_example/riverpod_counter_example.dart';
import 'package:flutter_playground/examples/ui/navigation_destination_with_args_example.dart';
import 'package:flutter_playground/examples/ui/render_object_example/render_object_example.dart';
import 'package:flutter_playground/examples/ui/widget_repaint_boundary_example.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// https://pub.dev/packages/go_router_builder/example
// [!Add deeplinks]
class _Routes {
  static const String root = '/';
  // state
  static const String providerCounter = '/providerCounter';
  static const String riverpodCounter = '/riverpodCounter';
  // ui
  static const String renderObject = '/renderObject';
  static const String repaintBoundary = '/repaintBoundary';
  static const String navigationWithArgs = '/navigationWithArgs/:type/:id';
}

final GlobalKey<NavigatorState> appRootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'appRootKey');

/*
 * Android:
 *    adb shell 'am start -d "<testing/http/https>://flutter_playground.com/<route>"' 
 * iOS:
 *    // TODO
 */
// https://docs.flutter.dev/ui/navigation/deep-linking
// https://docs.flutter.dev/cookbook/navigation/set-up-app-links
final router = GoRouter(
  debugLogDiagnostics: true,
  routes: $appRoutes,
  initialLocation: RootRoute().location,
  navigatorKey: appRootNavigatorKey,
);

@TypedGoRoute<RootRoute>(
  path: _Routes.root,
  routes: [
    TypedGoRoute<ProviderCounterRoute>(path: _Routes.providerCounter),
    TypedGoRoute<RiverpodCounterRoute>(path: _Routes.riverpodCounter),
    TypedGoRoute<RenderObjectRoute>(path: _Routes.renderObject),
    TypedGoRoute<WidgetRepaintBoundaryRoute>(path: _Routes.repaintBoundary),
    TypedGoRoute<NavigationDestinationWithArgsRoute>(path: _Routes.navigationWithArgs),
  ],
)
class RootRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExamplesListScreen(
      title: "Examples",
      examples: [
        Example(_Routes.providerCounter, "ProviderCounter"),
        Example(_Routes.riverpodCounter, "RiverpodCounter"),
        Example(_Routes.renderObject, "RenderObject"),
        Example(_Routes.repaintBoundary, "RepaintBoundary"),
        Example("testing://flutter_playground.com/navigationWithArgs/profile/42?name=herman&hobbies=coding,games",
            "NavigationWithArgs"),
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

/// Navigate using deeplink:
/// Android
/// * adb shell 'am start -d "testing://flutter_playground.com/navigationWithArgs/profile/42?name=herman&hobbies=coding,games"'
/// * adb shell 'am start -d "testing://flutter_playground.com/navigationWithArgs/purchase/42?productId=food&notes=delivery"'
/// * adb shell 'am start -d "testing://flutter_playground.com/navigationWithArgs/whatever/42?param1=hello&param2=world"'
/// iOS
/// * TODO
/// Navigate programmatically:
/// NavigationDestinationWithArgsRoute(...).go(context)
class NavigationDestinationWithArgsRoute extends GoRouteData {
  final String type; // :type
  final int id; // :id
  const NavigationDestinationWithArgsRoute({
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final type = NavigationDestinationWithArgsExampleScreenType.values
        .firstWhere((e) => e.name == this.type, orElse: () => NavigationDestinationWithArgsExampleScreenType.unknown);
    final queryParams = state.uri.queryParameters;

    final args = switch (type) {
      NavigationDestinationWithArgsExampleScreenType.profile => ProfileNavigationDestinationWithArgsExampleScreenArgs(
          id,
          name: queryParams['name']!,
          hobbies: queryParams['hobbies']!,
        ),
      NavigationDestinationWithArgsExampleScreenType.purchase => PurchaseNavigationDestinationWithArgsExampleScreenArgs(
          id,
          productId: queryParams['productId']!,
          notes: queryParams['notes']!,
        ),
      NavigationDestinationWithArgsExampleScreenType.unknown =>
        UnknownNavigationDestinationWithArgsExampleScreenArgs(id, queryParams: queryParams),
    };

    return NavigationDestinationWithArgsExampleScreen(args: args);
  }
}
