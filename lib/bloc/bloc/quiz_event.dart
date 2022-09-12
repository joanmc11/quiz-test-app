part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}


class SetPositionCat extends QuizEvent {
  final int cat;

  const SetPositionCat(this.cat);
}

class StarWin extends QuizEvent{
  final int points;

  const StarWin(this.points);

}
