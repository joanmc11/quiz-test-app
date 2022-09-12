import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizState()) {
    

    on<SetPositionCat>((event, emit) =>
        emit(state.copyWith(currentCategory: event.cat, isPressed: false)));

    on<StarWin>((event, emit) {
      final newList = state.stars;
     event.points == 10 ? newList![state.currentCategory] = true: null;

      emit(state.copyWith(
          isPressed: true,
          stars: newList,
          points: (event.points == 10 || state.points!=0) ? (state.points + event.points) : 0));
    });
  }
}
