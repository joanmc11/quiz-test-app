import 'package:html/parser.dart';

class QuestionData {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuestionData({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
        category: json['category'],
        type: json['type'],
        difficulty: json['difficulty'],
        question: parse(json['question']).body!.text,
        correctAnswer: parse(json['correct_answer']).body!.text,
        incorrectAnswers: List<String>.from(
            json['incorrect_answers'].map((model) => parse(model).body!.text)));
  }
}
