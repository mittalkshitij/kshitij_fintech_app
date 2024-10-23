import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kshitij_fintech_app/common/router_names.dart';
import 'package:kshitij_fintech_app/ui/screens/dashboard_screen.dart';
import 'package:kshitij_fintech_app/ui/screens/transaction_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
    BottomNavigationBarItem(
        icon: Icon(Icons.monetization_on), label: 'Transactions'),
  ];
  int bottomNavIndex = 0;

  final List<Widget> screens = [DashboardScreen(), TransactionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          context.pushNamed(RouteNames.add_expense);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
        currentIndex: bottomNavIndex,
      ),
    );
  }
}
