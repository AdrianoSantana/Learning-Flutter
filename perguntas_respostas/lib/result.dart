import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final void Function() restartQuiz;

  Result(this.totalScore, this.restartQuiz);

  String get resultPhrase {
    if (totalScore < 8) {
      return 'Parabéns';
    } else if (totalScore < 12) {
      return 'Você é bom!';
    } else if (totalScore < 16) {
      return 'Impressionante';
    } else {
      return 'B r a b o';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        Center(
          child: Text(
            "${totalScore.toString()} pontos",
            style: const TextStyle(fontSize: 22),
          ),
        ),
        ElevatedButton(
          child: const Text(
            "Reiniciar",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: restartQuiz,
        )
      ],
    );
  }
}
