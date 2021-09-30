import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final Function function;
  MenuCard({@required this.name, @required this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.grey),
          top: BorderSide(color: Colors.grey),
        )),
        child: Text(name),
      ),
    );
  }
}
