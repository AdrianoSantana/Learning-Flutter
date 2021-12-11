import 'package:flutter/cupertino.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final void Function(int) toAnswer;
  final bool hasSelectedQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.toAnswer,
    required this.hasSelectedQuestion,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasSelectedQuestion ? questions[questionIndex].cast()['answers'] : [];

    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['text'].toString()),
        ...answers.map((answer) {
          return Answer(
            answer['text'].toString(),
            () => toAnswer(int.parse(answer['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
