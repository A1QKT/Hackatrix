import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final bool isAjoined;
  final String text;
  final Timestamp createIn;
  final String userImage;
  final isMe;
  bool seen = false;
  Message(
      {@required this.text,
      @required this.createIn,
      @required this.isMe,
      @required this.isAjoined,
      @required this.userImage});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final bool seen = false;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxWidth: _screenSize.width * 0.6,
      ),
      decoration: BoxDecoration(
          color: widget.isMe ? Colors.grey : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: widget.isMe ? Radius.circular(0) : Radius.circular(12),
            bottomLeft: widget.isMe ? Radius.circular(0) : Radius.circular(0),
          )),
      child: Row(
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          widget.isAjoined
              ? CircleAvatar(
                  radius: _screenSize.width * 0.15,
                  backgroundImage: NetworkImage(widget.userImage),
                )
              : SizedBox(
                  width: _screenSize.width * 0.15,
                ),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.isMe ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
