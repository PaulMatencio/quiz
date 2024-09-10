import 'dart:convert';

class Question {
  String category;
  String question;
  String response;
  List<String> hints;
//  constructor
  Question(
      {required this.category,
        required this.question,
        required this.hints,
        required this.response});

  String getResponse() => response;
/*
      Convert a json input string to a question object
   */
  factory Question.fromJson(Map<String, dynamic> json) {
    String category = json['category'];
    String question = json['question'];
    String response = json['response'];
    final hints = List<String>.from(json['hints']) as List;
    if (hints is List<String>) {
      return Question(
          category: category,
          question: question,
          response: response,
          hints: hints);
    } else {
      throw const FormatException('Invalid JSON data');
    }
  }
}

List<Question> createQuestionsList() {
  List<Question> questions = [];
  List<String> data = [
    '''{"category":"Geography quiz",
      "question": "What is the most populated city in the world?",
      "response": "Tokyo",
      "hints": ["It is in Asia","It is in Japan"]}
      ''',
    '''{"category":"Geography quiz",
      "question": "What is the Official language of Andorra?",
      "response": "Catalan",
      "hints": ["It is spoken by Northern population of Spain","It is started with Ca"]}''',
    '''{"category":"Football quiz",
      "question": "Who is the most successful team in La Liga history?",
      "response": "Madrid",
      "hints": ["It is the Spanish first division football League","It is the Capital of Spain"]}''',
    '''{"category":"Tennis quiz",
      "question": "Which tennis player shares his name with a Swedish apparel fashion brand?",
      "response": "Björn Borg",
      "hints": ["It has stores in seven European countries","He won four consecutive French Open titles"]}''',
  ];
  for (int i = 0; i < data.length; i++) {
    final encodedData = jsonDecode(data[i]);
    questions.add(Question.fromJson(encodedData));
  }
  return questions;
}
