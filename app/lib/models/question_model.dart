import 'package:app/models/answer_model.dart';

/// Classe Question Model - Modelo de questão responsável
/// por determinar os elementos que uma questão deve ter.
///
/// @author Rodrigo Andrade
class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({this.title, this.answers});

}