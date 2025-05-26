class FxBreadcrumbItem {

  FxBreadcrumbItem({required this.name, this.route, this.active = false});
  final String name;
  final String? route;
  final bool active;
}
