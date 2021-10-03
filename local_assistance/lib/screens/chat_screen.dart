import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/auth.dart';
import '../widgets/message.dart';
import '../widgets/new_message.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat-screen";
  final String uidB;
  ChatScreen({@required this.uidB});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<Auth>(context, listen: false).getUid;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: FirebaseStorage.instance
            .ref("user_image/" + uid + ".jpg")
            .getDownloadURL(),
        builder: (ctx, snapShotImage) {
          if (snapShotImage.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapShotImage.error != null) {
            return Center(
              child: Text("Something went wrong!"),
            );
          } else
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Chats")
                  .doc("$uid${widget.uidB}/")
                  .collection("Messages")
                  .orderBy("time", descending: true)
                  .snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> snapShotMessage) {
                if (snapShotMessage.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (snapShotMessage.error != null)
                  return Center(
                    child: Text("Something went wrong!"),
                  );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: snapShotMessage.data.docs.length,
                        itemBuilder: (ctx, index) {
                          return Message(
                              text: snapShotMessage.data.docs[index]["message"],
                              createIn: snapShotMessage.data.docs[index]
                                  ["time"],
                              isMe: (snapShotMessage.data.docs[index]["uid"] ==
                                  uid),
                              isAjoined: true,
                              userImage: snapShotImage.hasData
                                  ? snapShotImage.data
                                  : null);
                        },
                      ),
                    ),
                    NewMessage(
                        uidA: Provider.of<Auth>(context, listen: false).getUid,
                        uidB: widget.uidB),
                  ],
                );
              },
            );
        },
      ),
    );
  }
}
