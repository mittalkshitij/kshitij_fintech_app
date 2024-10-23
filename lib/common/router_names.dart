class RouteNames {
  static const String home = 'home';
  static const String login = 'login';
  static const String bottom_nav_bar = 'bottom_nav_bar';
  static const String dashboard = 'dashboard';
  static const String add_expense = 'add_expense';
}

extension GoRouterPath on String {
  String path() => '/$this';
}
