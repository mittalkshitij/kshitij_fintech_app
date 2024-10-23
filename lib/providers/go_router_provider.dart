import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kshitij_fintech_app/ui/screens/add_expense_screen.dart';
import 'package:kshitij_fintech_app/ui/screens/bottom_navbar_screen.dart';
import 'package:kshitij_fintech_app/ui/screens/dashboard_screen.dart';
import 'package:kshitij_fintech_app/ui/screens/home_screen.dart';

import '../common/router_names.dart';
import '../ui/screens/login_screen.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RouteNames.home.path(),
      routes: [
        GoRoute(
          path: RouteNames.home.path(),
          name: RouteNames.home,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: RouteNames.login.path(),
          name: RouteNames.login,
          builder: (context, state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: RouteNames.bottom_nav_bar.path(),
          name: RouteNames.bottom_nav_bar,
          builder: (context, state) {
            return const BottomNavBarScreen();
          },
        ),
        GoRoute(
          path: RouteNames.dashboard.path(),
          name: RouteNames.dashboard,
          builder: (context, state) {
            return const DashboardScreen();
          },
        ),
        GoRoute(
          path: RouteNames.add_expense.path(),
          name: RouteNames.add_expense,
          builder: (context, state) {
            return const AddExpenseScreen();
          },
        ),
      ],
      // errorBuilder: (context, state) {
      //   return const ErrorScreen();
      // },
    );
  },
);
