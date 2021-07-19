import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:msof_front/utils/json_converters.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class QuestionList with _$QuestionList {
  const factory QuestionList({
    @Default([]) List<Question>? questions,
  }) = _QuestionList;

  factory QuestionList.fromJson(Map<String, dynamic> json) =>
      _$QuestionListFromJson(json);

  static QuestionList fromJsonT(Object? object) {
    return QuestionList(
        questions: (object as List).map((e) => Question.fromJson(e)).toList());
  }
}

@freezed
class Question with _$Question {
  const factory Question({
    int? id,
    @JsonKey(fromJson: parseDateTime) DateTime? created_at,
    @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
    @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
    int? author_id,
    String? title,
    String? content,
    String? status,
    int? viewed_count,
    int? liked_count,
    int? disliked_count,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static Question fromJsonT(Object? object) =>
      Question.fromJson(object as Map<String, dynamic>);
}
