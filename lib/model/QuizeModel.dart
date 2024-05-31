// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) => List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
    String question;
    List<dynamic> answers;
    int correctAnswer;
    String userName;
    String? id;

    QuizModel({
        required this.question,
        required this.answers,
        required this.correctAnswer,
        required this.userName,
         this.id,
    });

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        question: json["question"],
        answers: List<dynamic>.from(json["answers"].map((x) => x)),
        correctAnswer: json["correctAnswer"],
        userName: json["userName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctAnswer": correctAnswer,
        "userName": userName,
        "id": id,
    };
}
