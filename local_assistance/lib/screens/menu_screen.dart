import 'package:flutter/material.dart';

import '../widgets/menu_card.dart';

class MenuScreen extends StatelessWidget {
  static String routeName = "/menu-screen";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Icon(Icons.settings),
              MenuCard(name: "Setting", function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
