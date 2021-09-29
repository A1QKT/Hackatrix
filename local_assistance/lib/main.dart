import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_assistance/screens/history_screen.dart';
import 'package:local_assistance/screens/profile_screen.dart';
import 'package:local_assistance/screens/setting_screen.dart';
import 'screens/acception/acception_screen.dart';
import 'screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Assistance',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) return MainSCreen();
            return AuthScreen();
          }),
      routes: {
        AcceptionScreen.routName: (ctx) => AcceptionScreen(),
        ProfileScreen.routName: (ctx) => ProfileScreen(),
        SettingScreen.routName: (ctx) => SettingScreen(),
        HistoryScreen.routName: (ctx) => HistoryScreen(),
      },
    );
  }
}
