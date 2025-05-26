/// [FxRoutes] - able to create add and map routes.
/// Still in development
library;


import 'route.dart';

class FxRoutes {
  static List<FxRoute> _routes = [];

  static List<FxRoute> get routes => _routes;

  static void registerRoute(FxRoute route) {
    for (int i = 0; i < _routes.length; i++) {
      if (routes[i].name == route.name) {
        routes[i] = route;
        return;
      }
    }
    _routes.add(route);
  }

  static void registerRoutes(List<FxRoute> routes) {
    for (var r in routes) {
      registerRoute(r);
    }
  }

  static void create([List<FxRoute>? routes]) {
    _routes = [];
    if (routes != null) _routes.addAll(routes);
  }

  @Deprecated('Use registerRoute method instead of this')
  static void add(FxRoute route) {
    _routes.add(route);
  }

  @Deprecated('Use registerRoutes method instead of this')
  static void addAll(List<FxRoute> routes) {
    _routes.addAll(routes);
  }
}
