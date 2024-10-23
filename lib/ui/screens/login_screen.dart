import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kshitij_fintech_app/common/widgets/common_text_field.dart';

import '../../common/router_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, // hide the back button
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextFormField(
                controller: usernameTextController,
                prefixWidget: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value cannot be empty";
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.emailAddress,
                label: "UserName",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextFormField(
                controller: passwordTextController,
                isPassword: true,
                prefixWidget: const Icon(Icons.password),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value cannot be empty";
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.visiblePassword,
                label: "Password",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.goNamed(RouteNames.bottom_nav_bar);
                    log("Validated");
                  } else {
                    log("Not Validated");
                  }
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
