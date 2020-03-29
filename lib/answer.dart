import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answersText;

  Answer(this.selectHandler , this.answersText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answersText),
        onPressed: selectHandler,
        textColor: Colors.black,
        color: Colors.deepOrange,
      ),

    );
  }
}