import 'package:dumb_tests/components/answer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswersVertical extends StatelessWidget {
  AnswersVertical({
    Key? key,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.answers,
  }) : super(key: key);
  String correctAnswer;
  List<dynamic> incorrectAnswers;
  List<Answer> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: answers[0]
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: answers[1]
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: answers[2]
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: answers[3]
        ),
      ],
    );
  }
}
