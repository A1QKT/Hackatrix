import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_assistance/screens/history_screen.dart';
import 'package:local_assistance/screens/profile_screen.dart';
import 'package:local_assistance/screens/setting_screen.dart';

class DrawerSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: FutureBuilder(
                    future: FirebaseStorage.instance
                        .ref('user_image/' +
                            FirebaseAuth.instance.currentUser.uid +
                            '.jpg')
                        .getDownloadURL(),
                    builder: (context, snapshot) {
                      return CircleAvatar(
                        radius: size.width * 0.17,
                        backgroundColor: Colors.amberAccent,
                        backgroundImage: snapshot.data != null
                            ? NetworkImage(snapshot.data)
                            : null,
                      );
                    }),
              ),
              SizedBox(height: 15),
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .get(),
                  builder: (context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }
                    return Text(
                      snapshot.data.data()['fullname'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  }),
              SizedBox(height: 15),
              Text(FirebaseAuth.instance.currentUser.email),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileScreen.routName);
                  },
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SettingScreen.routName);
                  },
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HistoryScreen.routName);
                  },
                  child: ListTile(
                    leading: Icon(Icons.history),
                    title: Text(
                      "History",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
