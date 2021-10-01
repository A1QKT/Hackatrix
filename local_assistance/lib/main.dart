import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:local_assistance/screens/main_screen.dart';
import 'package:local_assistance/screens/menu_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_assistance/screens/history_screen.dart';
import 'package:local_assistance/screens/profile_screen.dart';
import 'package:local_assistance/screens/question_screen.dart';
import 'package:local_assistance/screens/setting_screen.dart';

import 'screens/acception/acception_screen.dart';
import './screens/menu_screen.dart';
import './providers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'Local Assistance',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, AsyncSnapshot<User> userSnapshot) {
            if (userSnapshot.error != null) {
              print("Something went wrong");
            }
            if (userSnapshot.hasData) return MainScreen(userSnapshot.data.uid);
            return Text("Something wrong");
          },
        ),
        routes: {
          AcceptionScreen.routName: (ctx) => AcceptionScreen(),
          MenuScreen.routeName: (ctx) => MenuScreen(),
          QuestionScreen.routName: (ctx) => QuestionScreen(),
          SettingScreen.routName: (ctx) => SettingScreen(),
          HistoryScreen.routName: (ctx) => HistoryScreen(),
          ProfileScreen.routName: (ctx) => ProfileScreen(),
          AcceptionScreen.routName: (ctx) => AcceptionScreen(),
        },
      ),
    );
  }
}
