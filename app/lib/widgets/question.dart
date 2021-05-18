import 'package:flutter/material.dart';

/// Question - Widget responsável por mostrar uma
/// questão na tela.
class Question extends StatelessWidget {
  final String title;

  Question({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
