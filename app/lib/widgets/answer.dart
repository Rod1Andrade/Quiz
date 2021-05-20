import 'package:flutter/material.dart';

/// Componente para comportar um botao de resposta
///
/// @author Rodrigo Andrade
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