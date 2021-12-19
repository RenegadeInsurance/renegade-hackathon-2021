// To parse this JSON data, do
//
//     final questionareModel = questionareModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionareModel {
  QuestionareModel({
    this.complexQuestionId,
    this.key,
    this.question,
    this.options,
  });

  final int? complexQuestionId;
  final String? key;
  final String? question;
  final List<Option>? options;

  QuestionareModel copyWith({
    int? complexQuestionId,
    String? key,
    String? question,
    List<Option>? options,
  }) =>
      QuestionareModel(
        complexQuestionId: complexQuestionId ?? this.complexQuestionId,
        key: key ?? this.key,
        question: question ?? this.question,
        options: options ?? this.options,
      );

  factory QuestionareModel.fromJson(String str) =>
      QuestionareModel.fromMap(json.decode(str));

  factory QuestionareModel.fromMap(Map<String, dynamic> json) =>
      QuestionareModel(
        complexQuestionId: json["complex_question_id"],
        key: json["key"],
        question: json["question"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionareModel &&
        other.complexQuestionId == complexQuestionId &&
        other.key == key &&
        other.question == question &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return complexQuestionId.hashCode ^
        key.hashCode ^
        question.hashCode ^
        options.hashCode;
  }

  @override
  String toString() {
    return 'QuestionareModel(complexQuestionId: $complexQuestionId, key: $key, question: $question, options: $options)';
  }
}

class Option {
  Option({
    this.option,
    this.result,
    this.followQuestion,
  });

  final String? option;
  final String? result;
  final int? followQuestion;

  Option copyWith({
    String? option,
    String? result,
    int? followQuestion,
  }) =>
      Option(
        option: option ?? this.option,
        result: result ?? this.result,
        followQuestion: followQuestion ?? this.followQuestion,
      );

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        option: json["option"],
        result: json["result"] == null ? null : json["result"],
        followQuestion:
            json["follow_question"] == null ? null : json["follow_question"],
      );

  Map<String, dynamic> toMap() => {
        "option": option,
        "result": result == null ? null : result,
        "follow_question": followQuestion == null ? null : followQuestion,
      };

  @override
  String toString() =>
      'Option(option: $option, result: $result, followQuestion: $followQuestion)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Option &&
        other.option == option &&
        other.result == result &&
        other.followQuestion == followQuestion;
  }

  @override
  int get hashCode =>
      option.hashCode ^ result.hashCode ^ followQuestion.hashCode;
}
