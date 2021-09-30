import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:local_assistance/screens/menu_screen.dart';
import 'package:provider/provider.dart';

import 'screens/acception/acception_screen.dart';
import 'screens/local_screen.dart';
import 'screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/main_screen.dart';
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
              if (userSnapshot.hasData) {
                final authStatus =
                  FirebaseFirestore.instance.collection("Locals").doc(userSnapshot.data.uid)
                if (authStatus == UserStatus.traveller)
                  return MainSCreen();
                else
                
                return LocalScreen();
              }
              return AuthScreen();
            }),
        routes: {
          AcceptionScreen.routName: (ctx) => AcceptionScreen(),
          MenuScreen.routeName: (ctx) => MenuScreen(),
        },
      ),
    );
  }
}
