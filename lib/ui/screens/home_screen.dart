import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kshitij_fintech_app/common/router_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Easy Bank"),
            Container(
              height: 300,
              width: 500,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child:
                  Image.asset('assets/expensemanager.jpg', fit: BoxFit.contain),
            ),
            const Text("Welcome to Easy Bank"),
            const Text(
              "Your Journey to effortless building start here.",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.login);
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
