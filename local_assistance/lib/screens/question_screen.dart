import 'package:flutter/material.dart';
import 'package:local_assistance/models/hashtag.dart';
import 'package:local_assistance/widgets/hashtag_widget.dart';
import 'package:local_assistance/widgets/question_field_screen.dart';

class QuestionScreen extends StatelessWidget {
  static String routName = '/quesion-screen';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    Map<String, bool> hashtagStatus = k_hashtagStatus[args['name']];
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args['name']),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HashtagWidget(hashtagStatus: hashtagStatus),
              QuestionFieldWidget(hashtagStatus: hashtagStatus),
            ],
          ),
        ),
      ),
    );
  }
}
