import 'package:flutter/material.dart';

import 'screens/acception/acception_screen.dart';
import './screens/authentication/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Assistance',
      home: AuthScreen(),
      routes: {
        AcceptionScreen.routName: (ctx) => AcceptionScreen(),
      },
    );
  }
}
