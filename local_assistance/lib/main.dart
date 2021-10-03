import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_assistance/screens/auth_screen.dart';
import 'package:local_assistance/screens/chat_screen.dart';

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
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, AsyncSnapshot<User> userSnapshot) {
            if (userSnapshot.error != null) {
              print("Something went wrong");
            }
            if (userSnapshot.hasData) {
              Provider.of<Auth>(ctx, listen: false)
                  .setUid(userSnapshot.data.uid);
              return MainScreen(userSnapshot.data.uid);
            }
            return AuthScreen();
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
          ChatScreen.routeName: (ctx) => ChatScreen(uidB: "krgLDaEkfthuN4b1VHuXHdFFDi33"),
        },
      ),
    );
  }
}
