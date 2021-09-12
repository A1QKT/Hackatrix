import 'package:flutter/material.dart';
import '/screens/acception_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Assistance',
      initialRoute: AcceptionScreen.routName,
      routes: {
        AcceptionScreen.routName: (ctx) => AcceptionScreen(),
      },
    );
  }
}
