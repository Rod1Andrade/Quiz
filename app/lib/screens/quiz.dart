import 'package:app/models/answer_model.dart';
import 'package:app/models/question_model.dart';
import 'package:app/widgets/answer.dart';
import 'package:app/widgets/answer_conclusion_bottom_sheet.dart';
import 'package:app/widgets/question.dart';
import 'package:app/widgets/reload_button.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _questionIndex = 0;

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
  ];

  void _nextQuestion() {
    if (!_finishQuestions()) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  bool _finishQuestions() => _questionIndex >= _questions.length - 1;

  void _reloadQuestions() => setState(() => _questionIndex = 0);

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
            Question(title: '${_questions[_questionIndex].title}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _questions[_questionIndex]
                  .answers
                  .map((e) => Answer(
                        text: e.title,
                        onAnswer: _nextQuestion,
                      ))
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Reload questions icon button
                  if (_finishQuestions())
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
      bottomSheet: _finishQuestions()
          ? AnswerConclusionBottomSheet()
          : null,
    );
  }
}
