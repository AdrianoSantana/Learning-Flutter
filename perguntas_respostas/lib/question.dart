import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String pergunta;
  Question(this.pergunta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        pergunta,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
