import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './local_screen.dart';
import './user_screen.dart';
import '../providers/auth.dart';

Size screenSize;

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
    screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: fetchDataUser(widget.uid),
        builder: (_, snapsot) => (userStatus == UserStatus.traveller)
            ? UserSCreen()
            : LocalScreen());
  }
}
