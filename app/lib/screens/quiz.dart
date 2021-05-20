import 'package:app/models/answer_model.dart';
import 'package:app/models/question_model.dart';
import 'package:app/widgets/PlanQuiz.dart';
import 'package:app/widgets/answer_conclusion_bottom_sheet.dart';
import 'package:app/widgets/reload_button.dart';
import 'package:flutter/material.dart';

/// Quiz - Tela do questionario
///
/// @author Rodrigo Andrade
class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Total de pontuação das questõse
  int _totalValue = 0;

  // Index da Lista de questões
  int _questionIndex = 0;

  // Index normal
  int _overIndex = 0;

  // Lista de questões
  final List<QuestionModel> _questions = [
    QuestionModel(
      title: 'Qual a melhor linguagem de programação?',
      answers: [
        AnswerModel(title: 'Java', value: 5),
        AnswerModel(title: 'Dart', value: 10),
        AnswerModel(title: 'Javascript', value: 10),
        AnswerModel(title: 'C++', value: 10),
        AnswerModel(title: 'Python', value: 10),
      ],
    ),
    QuestionModel(
      title: 'Qual o melhor Framework?',
      answers: [
        AnswerModel(title: 'React Native', value: 5),
        AnswerModel(title: 'Flutter', value: 10),
        AnswerModel(title: 'Phonegap', value: 1),
        AnswerModel(title: 'Vue JS', value: 2),
        AnswerModel(title: 'Angular', value: 4),
      ],
    ),
    QuestionModel(
      title: 'Qual o melhor Sistema Operacional?',
      answers: [
        AnswerModel(title: 'Android', value: 10),
        AnswerModel(title: 'IOS', value: 5),
        AnswerModel(title: 'Mac OS', value: 5),
        AnswerModel(title: 'Linux', value: 10),
        AnswerModel(title: 'Windows', value: 5),
      ],
    ),
    QuestionModel(
      title: 'Qual a sua placa de video?',
      answers: [
        AnswerModel(title: 'NVIDIA', value: 10),
        AnswerModel(title: 'AMD', value: 5),
      ],
    )
  ];

  /// Avança para a próxima questão, alterando o estado.
  void _nextQuestion() {
    // Questions Index update state
    if (_isValidIndex) {
      setState(() {
        _questionIndex++;
      });
    }

    // Over Index update State
    if (!_finishedQuestions)
      setState(() {
        _overIndex++;
      });
  }

  /// Aumenta o valor do total de questões
  void _increasePontuation(AnswerModel answer) {
    if (!_finishedQuestions) _totalValue += answer.value;
  }

  /// Verifica se o indices da questão já está no fim
  ///
  /// Return:
  /// True caso esteja
  /// False caso contrário
  bool get _isValidIndex => _questionIndex < _questions.length - 1;

  /// Verifica se o OverIndex tem o tamanho igual o maior que
  /// o tamanho da lista. Server para não dar index over flow.
  ///
  /// True caso tenha chegado ao fim das questoes
  /// False caso contrario.
  bool get _finishedQuestions => _overIndex >= _questions.length;

  /// Recarrega as questões, resetando as variáveis participantes
  void _reloadQuestions() {
    setState(() {
      _questionIndex = 0;
      _totalValue = 0;
      _overIndex = 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PlanQuiz(
              questions: _questions,
              questionIndex: _questionIndex,
              nextQuestionFunction: _nextQuestion,
              updatePointsValue: _increasePontuation,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Reload questions icon button
                  if (_finishedQuestions)
                    ReloadButton(reloadFunction: _reloadQuestions),
                  Spacer(),
                  Icon(Icons.menu_book),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('${_questionIndex + 1}/${_questions.length}'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _finishedQuestions
          ? AnswerConclusionBottomSheet(
              totalPoints: _totalValue,
            )
          : null,
    );
  }
}
