// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentList _$_$_CommentListFromJson(Map<String, dynamic> json) {
  return _$_CommentList(
    count: json['count'] as int?,
    next: json['next'] as String?,
    previous: json['previous'] as String?,
    results: (json['results'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_CommentListToJson(_$_CommentList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    id: json['id'] as int?,
    recomments: (json['recomments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    created_at: parseDateTime(json['created_at'] as String?),
    updated_at: parseDateTime(json['updated_at'] as String?),
    deleted_at: parseDateTime(json['deleted_at'] as String?),
    selected: json['selected'] as bool?,
    content: json['content'] as String?,
    status: json['status'] as String?,
    liked_count: json['liked_count'] as int?,
    disliked_count: json['disliked_count'] as int?,
    author: json['author'] as int?,
    question: json['question'] as int?,
    parent: json['parent'] as int?,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recomments': instance.recomments?.map((e) => e.toJson()).toList(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at?.toIso8601String(),
      'selected': instance.selected,
      'content': instance.content,
      'status': instance.status,
      'liked_count': instance.liked_count,
      'disliked_count': instance.disliked_count,
      'author': instance.author,
      'question': instance.question,
      'parent': instance.parent,
    };
