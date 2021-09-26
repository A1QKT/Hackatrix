import 'package:flutter/material.dart';

import 'screens/acception/acception_screen.dart';
import './screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Assistance',
      initialRoute: LoginScreen.routeName,
      routes: {
        AcceptionScreen.routName: (ctx) => AcceptionScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}
