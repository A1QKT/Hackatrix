import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './local_screen.dart';
import './user_screen.dart';
import '../providers/auth.dart';

class MainScreen extends StatefulWidget {
  final String uid;
  MainScreen(this.uid);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserStatus userStatus;
  Future<void> fetchDataUser(String uid) async {
    final response =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    print(response.exists);
    if (response.exists)
      userStatus = UserStatus.traveller;
    else
      userStatus = UserStatus.local;
  }

  @override
  Widget build(BuildContext context) {
    print("ok");
    return FutureBuilder(
        future: fetchDataUser(widget.uid),
        builder: (_, snapsot) => (userStatus == UserStatus.traveller)
            ? UserSCreen()
            : LocalScreen());
  }
}
