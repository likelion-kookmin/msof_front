import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:msof_front/utils/json_converters.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class CommentList with _$CommentList {
  const factory CommentList({
    int? count,
    String? next,
    String? previous,
    @Default([]) List<Comment>? results,
  }) = _CommentList;

  factory CommentList.fromJson(Map<String, dynamic> json) =>
      _$CommentListFromJson(json);

  static CommentList fromJsonT(Map<String, dynamic> json) {
    var comments = <Comment>[];
    (json['results'] ?? []).forEach((e) => comments.add(Comment.fromJson(e)));
    return CommentList(results: comments);
  }
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    int? id,
    List<Comment>? recomments,
    @JsonKey(fromJson: parseDateTime) DateTime? created_at,
    @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
    @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
    bool? selected,
    String? content,
    String? status,
    int? liked_count,
    int? disliked_count,
    int? author,
    int? question,
    int? parent,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  static Comment fromJsonT(Object? object) =>
      Comment.fromJson(object as Map<String, dynamic>);
}
