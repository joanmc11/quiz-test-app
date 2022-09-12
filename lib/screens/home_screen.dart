import 'package:dumb_tests/bloc/bloc/quiz_bloc.dart';
import 'package:dumb_tests/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Quiz"),
        shadowColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.10
                          : MediaQuery.of(context).size.height * 0.10,
                ),
                Text('Score: ${state.points.toInt()}'),
                CategoryItem(
                    text: "Books",
                    icon: Icons.menu_book,
                    category: '10',
                    star: state.stars![0],
                    position: 0),
                CategoryItem(
                    text: "Films",
                    icon: Icons.movie_creation,
                    category: '11',
                    star: state.stars![1],
                    position: 1),
                CategoryItem(
                    text: "Sports",
                    icon: Icons.sports_baseball,
                    category: '21',
                    star: state.stars![2],
                    position: 2),
                CategoryItem(
                    text: "Geography",
                    icon: Icons.map_outlined,
                    category: '22',
                    star: state.stars![3],
                    position: 3),
              ],
            );
          },
        ),
      ),
    );
  }
}
