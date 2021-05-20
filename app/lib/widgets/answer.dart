import 'package:flutter/material.dart';

class Answer extends StatelessWidget{

  final String text;
  final void Function() onAnswer;

  Answer({this.text, this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor
      ),
      onPressed: onAnswer,
      child: Text(text),
    );
  }
}