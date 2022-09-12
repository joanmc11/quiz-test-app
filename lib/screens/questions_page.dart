import 'package:dumb_tests/components/answer.dart';
import 'package:dumb_tests/components/answers_horizontal.dart';
import 'package:dumb_tests/components/answers_vertical.dart';
import 'package:dumb_tests/models/questions.dart';
import 'package:dumb_tests/services/api_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  QuestionPage({Key? key, required this.category}) : super(key: key);
  String category;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("$category Quiz"),
        shadowColor: Colors.indigo,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder<List<QuestionData>>(
        future: ApiServices().fetchQuestions(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data![0];

            final answerStringList = [
              data.correctAnswer,
              ...data.incorrectAnswers
            ];
            final List<Answer> answers = [];
            for (String item in answerStringList) {
              answers.add(Answer(
                text: item,
                correctAnswer: data.correctAnswer,
              ));
            }

            answers.shuffle();

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.4
                            : MediaQuery.of(context).size.width * 0.05,
                        horizontal: 20),
                    child: Text(
                      data.question,
                      style: const TextStyle(fontSize: 25),
                    ),
                  )),
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? AnswersVertical(
                          correctAnswer: data.correctAnswer,
                          incorrectAnswers: data.incorrectAnswers,
                          answers: answers,
                        )
                      : AnswersHorizontal(
                          correctAnswer: data.correctAnswer,
                          incorrectAnswers: data.incorrectAnswers,
                          answers: answers,
                        ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.indigo,
            strokeWidth: 5,
          ));
        },
      ),
    ));
  }
}
