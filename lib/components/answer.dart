import 'package:dumb_tests/bloc/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Answer extends StatelessWidget {
  Answer({Key? key, required this.text, required this.correctAnswer})
      : super(key: key);
  String text;
  String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: state.isPressed ? (text==correctAnswer? Colors.green: Colors.red): Colors.indigo,
            fixedSize: Size(
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.width * 0.2
                    : MediaQuery.of(context).size.width * 0.1),
          ),
          onPressed: () async {
           /* showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Tu respuesta es'),
                content: Text(
                    text == correctAnswer ? 'correct answer' : 'wrong answer'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );*/
            final quizBloc = BlocProvider.of<QuizBloc>(context);
            

            state.isPressed? null :(text == correctAnswer ? quizBloc.add(StarWin(10)) : quizBloc.add(StarWin(-5))) ;
            
            print(state.currentCategory);
            print(state.isPressed);

          },
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
        );
      },
    );
  }
}
