import 'package:flutter/material.dart';

/// Componente para mostrar o resultado do quiz.
///
/// @author Rodrigo Andrade
class AnswerConclusionBottomSheet extends StatelessWidget  {

  final int totalPoints;

  AnswerConclusionBottomSheet({this.totalPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Parabéns!',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
            ),
          ),
          Text(
            'Total de pontos: $totalPoints',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w300
            ),
          ),
        ],
      ),
    );
  }
}