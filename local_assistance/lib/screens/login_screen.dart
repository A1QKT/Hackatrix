import 'package:flutter/material.dart';

import '../widgets/login_item.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: LoginItem()),
    );
  }
}
