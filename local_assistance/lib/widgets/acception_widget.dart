import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';


class AcceptionWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  AcceptionWidget({
    @required this.title,
    @required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.0,
        width: 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.solid),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.local_activity),
                      title: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                        ),
                      )),
                  SizedBox(height: 4),
                  Divider(
                    color: Colors.redAccent,
                    thickness: 1.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 42),
                        child: RaisedButton(
                          child: const Text('Check'),
                          onPressed: () {},
                        ),
                      ),
                      RaisedButton(
                        child: const Text('Request'),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
