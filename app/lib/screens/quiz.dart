import 'package:app/models/answer.dart';
import 'package:app/models/question_model.dart';
import 'package:app/widgets/question.dart';
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
        Answer(title: 'Java', value: 5),
        Answer(title: 'Dart', value: 10),
        Answer(title: 'Javascript', value: 10),
        Answer(title: 'C++', value: 10),
        Answer(title: 'Python', value: 10),
      ],
    ),
    QuestionModel(
      title: 'Qual o melhor Framework?',
      answers: [
        Answer(title: 'React Native', value: 5),
        Answer(title: 'Flutter', value: 10),
        Answer(title: 'Phonegap', value: 1),
        Answer(title: 'Vue JS', value: 2),
        Answer(title: 'Angular', value: 4),
      ],
    ),
    QuestionModel(
      title: 'Qual o melhor Sistema Operacional?',
      answers: [
        Answer(title: 'Android', value: 10),
        Answer(title: 'IOS', value: 5),
        Answer(title: 'Mac OS', value: 5),
        Answer(title: 'Linux', value: 10),
        Answer(title: 'Windows', value: 5),
      ],
    ),
  ];

  void _nextQuestion() => setState(() {
        if (_questionIndex < _questions.length - 1) {
          _questionIndex++;
        }
      });

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
                  .map((e) => ElevatedButton(
                      onPressed: _nextQuestion, child: Text(e.title)))
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
    );
  }
}
