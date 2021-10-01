import 'package:flutter/material.dart';

class QuestionFieldWidget extends StatefulWidget {
  const QuestionFieldWidget({Key key, @required this.hashtagStatus})
      : super(key: key);
  final Map<String, bool> hashtagStatus;
  @override
  _QuestionFieldWidgetState createState() => _QuestionFieldWidgetState();
}

class _QuestionFieldWidgetState extends State<QuestionFieldWidget> {
  var _titleController = TextEditingController();
  var _detailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.black12),
          height: 100,
          child: TextFormField(
            maxLines: 3,
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: InputBorder.none,
              hintText: 'Question title',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.black12),
          height: 250,
          child: TextFormField(
            controller: _detailController,
            maxLines: 10,
            decoration: InputDecoration(
              labelText: 'Detail',
              border: InputBorder.none,
              hintText: 'Quesion detail',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(widget.hashtagStatus);
            print("titile: " + _titleController.text);
            print("detail: " + _detailController.text);
          },
          child: Text('Post quesion'),
        )
      ],
    );
  }
}
