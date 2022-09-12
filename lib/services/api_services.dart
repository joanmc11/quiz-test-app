import 'dart:convert';
import 'package:dumb_tests/models/questions.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  


  Future<List<QuestionData>> fetchQuestions(String category) async {
    String endpoint = 'https://opentdb.com/api.php?amount=5&category=$category&type=multiple';
    final response = await http.get(Uri.parse(
        endpoint));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final List result = jsonDecode(response.body)['results'];
      return result.map((e) => QuestionData.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load question');
    }
  }
}
