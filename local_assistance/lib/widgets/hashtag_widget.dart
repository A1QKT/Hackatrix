import 'package:flutter/material.dart';
import 'package:local_assistance/screens/main_screen.dart';

class HashtagWidget extends StatefulWidget {
  const HashtagWidget({
    Key key,
    @required this.hashtagStatus,
  }) : super(key: key);

  final Map<String, bool> hashtagStatus;

  @override
  _HashtagWidgetState createState() => _HashtagWidgetState();
}

class _HashtagWidgetState extends State<HashtagWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<String> hashtag = widget.hashtagStatus.entries.map((e) {
      return e.key;
    }).toList();
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border(
          top: BorderSide(),
          bottom: BorderSide(),
          left: BorderSide(),
          right: BorderSide(),
        ),
      ),
      width: screenSize.width,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: screenSize.width,
            height: 50,
            color: Colors.blue[200],
            child: Text(
              'Choose hashtags',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            width: screenSize.width,
            child: GridView.count(
              childAspectRatio: 4,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              children: hashtag.map((element) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.hashtagStatus[element] =
                          !widget.hashtagStatus[element];
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.hashtagStatus[element]
                            ? Colors.blue[400]
                            : Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        element,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
