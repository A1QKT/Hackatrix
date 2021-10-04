import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/info_suggested_local.dart';

class SuggestLocal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoSuggestedLocal(),
                FlatButton(onPressed: () {}, child: Text("OK")),
                FlatButton(onPressed: () {}, child: Text("Skip")),
              ],
            ),
          ),
        );
      },
    );
  }
}
