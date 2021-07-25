import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:msof_front/models/question/comment.dart';
import 'package:msof_front/utils/json_converters.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class QuestionList with _$QuestionList {
  const factory QuestionList({
    int? count,
    String? next,
    String? previous,
    @Default([]) List<Question>? results,
  }) = _QuestionList;

  factory QuestionList.fromJson(Map<String, dynamic> json) =>
      _$QuestionListFromJson(json);

  static QuestionList fromJsonT(Map<String, dynamic> json) {
    var questions = <Question>[];
    (json['results'] ?? []).forEach((e) => questions.add(Question.fromJson(e)));
    return QuestionList(results: questions);
  }
}

@freezed
class Question with _$Question {
  const factory Question({
    int? id,
    @JsonKey(fromJson: parseDateTime) DateTime? created_at,
    @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
    @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
    List<Comment>? comments,
    String? title,
    String? content,
    String? status,
    int? viewed_count,
    int? liked_count,
    int? disliked_count,
    int? author,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static Question fromJsonT(Object? object) =>
      Question.fromJson(object as Map<String, dynamic>);
}
