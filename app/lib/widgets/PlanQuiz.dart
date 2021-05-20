import 'package:app/models/answer_model.dart';
import 'package:app/models/question_model.dart';
import 'package:app/widgets/answer.dart';
import 'package:app/widgets/question.dart';
import 'package:flutter/cupertino.dart';

/// Questionario Plano - Componente que
/// recebe uma lista de questionario, o index da questao atual
/// e uma funcao para atualizar o index.
///
/// @author Rodrigo Andrade
class PlanQuiz extends StatelessWidget {
  final int questionIndex;
  final List<QuestionModel> questions;
  final void Function() nextQuestionFunction;
  final void Function(AnswerModel answerModel) updatePointsValue;

  PlanQuiz({
    this.questionIndex,
    this.questions,
    this.nextQuestionFunction,
    this.updatePointsValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(title: '${questions[questionIndex].title}'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: questions[questionIndex]
              .answers
              .map((e) => Answer(
                    text: e.title,
                    onAnswer: () {
                      if (updatePointsValue != null) updatePointsValue(e);
                      nextQuestionFunction();
                    },
                  ))
              .toList(),
        )
      ],
    );
  }
}
