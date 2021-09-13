import 'package:flutter/material.dart';

import 'login_item.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(child: LoginItem()),
    );
  }
}
