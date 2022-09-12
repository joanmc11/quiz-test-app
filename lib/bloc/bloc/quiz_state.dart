part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final bool isPressed;
  final double points;
  final List<bool>? stars;
  final int currentCategory;

  QuizState({this.isPressed = false, this.points = 0, stars, this.currentCategory=0})
      : stars = stars ?? [false, false, false, false];

  QuizState copyWith({
    final bool? isPressed,
    final double? points,
    final List<bool>? stars,
    final int? currentCategory,
  }) =>
      QuizState(
        isPressed: isPressed ?? this.isPressed,
        points: points ?? this.points,
        stars: stars ?? this.stars,
        currentCategory: currentCategory ?? this.currentCategory
      );

  @override
  List<Object?> get props => [isPressed, points, stars];
}


