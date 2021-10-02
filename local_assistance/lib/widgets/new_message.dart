import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  final String uidB;
  final String uidA;
  NewMessage({@required this.uidA, @required this.uidB});
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _textController = TextEditingController();
  dynamic _message = '';
  Future<void> addChat() async {
    FocusScope.of(context).unfocus();
    try {
      await FirebaseFirestore.instance
          .collection("Chats")
          .doc("${widget.uidB}")
          .set({
        "time": Timestamp.now(),
        "message": _message,
        "uid": widget.uidA,
      });
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
      width: screenSize.width,
      child: Row(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: "Send a message..."),
            onChanged: (value) {
              _message = _textController.text;
            },
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
