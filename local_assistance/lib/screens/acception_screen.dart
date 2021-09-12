import 'package:flutter/material.dart';
import '../widgets/acception_widget.dart';

class AcceptionScreen extends StatelessWidget {
  static String routName = '/acception-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AcceptionWidget(
        title:
            "Allow Local Assitance to use your location while you use the app",
        subTitle: "Your location will be used to reccomend for the people",
      ),
    );
  }
}
