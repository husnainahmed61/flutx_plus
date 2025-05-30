import 'package:flutter/material.dart';
import 'package:flutx_plus/exceptions/route_exception.dart';

import 'middlewares/middleware.dart';
import 'route.dart';
import 'routes.dart';

export 'middlewares/middleware.dart';
export 'route.dart';
export 'route_builders/enter_exit_route.dart';
export 'route_builders/fade_route.dart';
export 'route_builders/rotation_route.dart';
export 'route_builders/scale_rotate_route.dart';
export 'route_builders/scale_route.dart';
export 'route_builders/size_route.dart';
export 'route_builders/slide_left_route.dart';
export 'route_builders/slide_right_route.dart';
export 'routes.dart';

/// The [FxRouter] handles navigation and route mapping.
class FxRouter {
  static T? getArgs<T>(BuildContext context) {
    try {
      final Object? args = ModalRoute.of(context)?.settings.arguments;
      if (args is T) return args;
      return null;
    } catch (e) {
      throw RouteException(
          "Use getArgs in onReady state. Don't use in constructor or initState");
    }
  }

  static FxRoute? _getRouteFromRouteName(String routeName) {
    for (FxRoute route in FxRoutes.routes) {
      if (route.name.compareTo(routeName) == 0) return route;
    }
    return null;
  }

  static FxRoute? getSecuredRouteFromRouteName(String routeName) {
    final Uri uri = Uri.parse(routeName);
    final route0 = uri.path;
    final FxRoute? route = _getRouteFromRouteName(route0);
    if (route == null) return null;

    if (route.middlewares != null && route.middlewares!.isNotEmpty) {
      for (FxMiddleware middleware in route.middlewares!) {
        final String redirectedRouteName = middleware.handle(route0);
        if (redirectedRouteName.compareTo(route0) != 0) {
          return getSecuredRouteFromRouteName(redirectedRouteName);
        }
      }
    }
    return route;
  }

  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    final FxRoute? route = getSecuredRouteFromRouteName(routeName);
    if (route == null){
      throw RouteException("'$routeName' Route is not implemented");
    }
    return Navigator.of(context).pushNamed<T>(route.name, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    final FxRoute? route = getSecuredRouteFromRouteName(routeName);
    if (route == null) {
      throw RouteException("'$routeName' Route is not implemented");
    }
    return Navigator.of(context)
        .pushReplacementNamed<T, TO>(route.name, arguments: arguments);
  }
}
