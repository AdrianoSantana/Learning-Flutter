import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _questionIndex = 0;
  List<Widget> widgetsAnswers = [];
  int _totalScore = 0;
  final _questions = const [
    {
      'text': 'Qual sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 1},
        {'text': 'Vermelho', 'score': 3},
        {'text': 'Verde', 'score': 5},
        {'text': 'Azul', 'score': 7},
      ]
    },
    {
      'text': 'Qual o seu animal favorito ?',
      'answers': [
        {'text': 'Coelho', 'score': 1},
        {'text': 'Cobra', 'score': 3},
        {'text': 'Elefante', 'score': 5},
        {'text': 'Leão', 'score': 7},
      ]
    },
    {
      'text': 'Qual o seu celular preferido?',
      'answers': [
        {'text': 'A3', 'score': 1},
        {'text': 'A5', 'score': 3},
        {'text': 'A6', 'score': 5},
        {'text': 'A7', 'score': 7},
      ]
    },
  ];

  bool get hasSelectedQuestion {
    return _questionIndex < _questions.length;
  }

  void _toAnswer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        widgetsAnswers.clear();
        _questionIndex += 1;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas & Respostas'),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                toAnswer: _toAnswer,
                hasSelectedQuestion: hasSelectedQuestion,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
