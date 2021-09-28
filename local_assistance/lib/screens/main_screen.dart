import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import './drawer.dart';

class MainSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CollectionReference userInformations =
    //     FirebaseFirestore.instance.collection("userInformations");

    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection("test").add({
            "name": "khang",
            "location": "vung tau",
          });
        },
        child: Icon(Icons.add),
      ),
      drawer: DrawerSheet(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("test").snapshots(),
        builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
          if (!snapShot.hasData) return Text("there is no data");
          if (snapShot.error != null) return Text("Some thing went wrong");
          return ListView.builder(
              itemCount: snapShot.data.docs.length,
              itemBuilder: (_, index) {
                final data =
                    snapShot.data.docs[index].data() as Map<String, dynamic>;
                return Text(data["name"]);
              });
        },
      ),
    );
  }
}
