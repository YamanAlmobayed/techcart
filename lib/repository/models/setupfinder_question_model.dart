import 'dart:convert';

SetupfinderQuestionModel setupfinderQuestionModelFromJson(String str) =>
    SetupfinderQuestionModel.fromJson(json.decode(str));

String setupfinderQuestionModelToJson(SetupfinderQuestionModel data) =>
    json.encode(data.toJson());

class SetupfinderQuestionModel {
  final String? qustion;
  final List<String>? answers;
  final bool? isOutput;

  SetupfinderQuestionModel({
    this.qustion,
    this.answers,
    this.isOutput,
  });

  factory SetupfinderQuestionModel.fromJson(Map<String, dynamic> json) =>
      SetupfinderQuestionModel(
        qustion: json["qustion"],
        answers: json["answers"] == null
            ? []
            : List<String>.from(json["answers"]!.map((x) => x)),
        isOutput: json["is_output"],
      );

  Map<String, dynamic> toJson() => {
        "qustion": qustion,
        "answers":
            answers == null ? [] : List<dynamic>.from(answers!.map((x) => x)),
        "is_output": isOutput,
      };
}
