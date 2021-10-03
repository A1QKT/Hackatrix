import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final bool isAjoined;
  final String text;
  final Timestamp createIn;
  final String userImage;
  final isMe;
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
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: (widget.isMe == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  constraints: BoxConstraints(
                    maxWidth: _screenSize.width * 0.6,
                    minHeight: _screenSize.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.isMe ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: _screenSize.width * 0.05,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: _screenSize.width * 0.05,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxWidth: _screenSize.width * 0.6,
                  ),
                  decoration: BoxDecoration(
                    color: widget.isMe
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: widget.isMe
                          ? Radius.circular(0)
                          : Radius.circular(12),
                      bottomLeft:
                          widget.isMe ? Radius.circular(0) : Radius.circular(0),
                    ),
                  ),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.isMe ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
