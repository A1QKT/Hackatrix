import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class NewMessage extends StatefulWidget {
  final String uidB;
  final String uidA;
  NewMessage({@required this.uidA, @required this.uidB});
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _textController = TextEditingController();
  String _message = '';
  Future<void> addChat() async {
    FocusScope.of(context).unfocus();
    try {
      await FirebaseFirestore.instance
          .collection("Chats")
          .doc("${widget.uidA}${widget.uidB}")
          .collection("Messages")
          .add({
        "time": Timestamp.now(),
        "message": _message,
        "uid": widget.uidA,
      });
      _textController.clear();
    } on FirebaseException catch (error) {
      print(error.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Can't send the message")));
    } catch (error) {
      print(error.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Can't send the message")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      margin: const EdgeInsets.all(10),
      width: screenSize.width,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(32)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              controller: _textController,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: "Send a message...",
                  hintStyle: TextStyle(fontSize: 17),
                  border: InputBorder.none),
              onChanged: (value) {
                setState(() {
                  _message = value;
                });
              },
            ),
          ),
          IconButton(
              onPressed: (_message.trim().isEmpty) ? null : addChat,
              icon: Icon(
                Icons.send,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }
}
