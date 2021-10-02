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
    final uid = Provider.of<Auth>(context).getUid;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: FutureBuilder(
            future: FirebaseStorage.instance.ref(uid).getDownloadURL(),
            builder: (ctx, snapShotImage) => StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Chats/$uid${widget.uidB}/Messages")
                  .orderBy("time", descending: true)
                  .snapshots(),
              builder: (ctx, snapShotMessage) {
                if (snapShotMessage.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                print(snapShotMessage.data);
                return ListView.builder(
                  reverse: true,
                  itemCount: snapShotMessage.data.length,
                  itemBuilder: (ctx, index) {
                    return Message(
                        text: snapShotMessage.data[index]["message"],
                        createIn: snapShotMessage.data[index]["time"],
                        isMe: (snapShotMessage.data[index]["uid"] == uid),
                        isAjoined: true,
                        userImage:
                            snapShotImage.hasData ? snapShotImage.data : null);
                  },
                );
              },
            ),
          ),
        ),
        NewMessage(uidA: Provider.of<Auth>(context).getUid, uidB: widget.uidB),
      ],
    );
  }
}
