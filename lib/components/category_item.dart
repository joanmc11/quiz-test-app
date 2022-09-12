import 'package:dumb_tests/bloc/bloc/quiz_bloc.dart';
import 'package:dumb_tests/screens/questions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.category,
    required this.star,
    required this.position
  }) : super(key: key);
  String text;
  IconData icon;
  String category;
  bool star;
  int position;


  @override
  Widget build(BuildContext context) {
    final quizBloc = BlocProvider.of<QuizBloc>(context); 
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: TextButton(
            onPressed: () async{
              print("no state: $position");
              
              quizBloc.add(SetPositionCat(position));
              
              
             
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionPage(category: category)
                  ));
              

            },
            style: TextButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.indigo,
                fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.2
                        : MediaQuery.of(context).size.width * 0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(text,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                Icon(
                  icon,
                  color: Colors.white,
                  size:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.15
                          : MediaQuery.of(context).size.width * 0.08,
                ),
                 Icon(
                  Icons.star,
                  color: star ? Colors.amberAccent : Colors.grey,
                )
              ],
            )),
      ),
    );
  }
}
