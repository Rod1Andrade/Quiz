import 'package:flutter/material.dart';

class Answer extends StatelessWidget{

  final String text;
  final Function function;

  Answer({this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(text),
    );
  }
}