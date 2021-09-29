import 'package:flutter/material.dart';
import 'package:local_assistance/screens/question_screen.dart';

class MainFeature extends StatelessWidget {
  final String featureName;
  final Icon icon;
  MainFeature({@required this.featureName, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuestionScreen.routName,
          arguments: {
            'name': featureName,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon, Text(featureName)],
          ),
        ),
      ),
    );
    ;
  }
}
