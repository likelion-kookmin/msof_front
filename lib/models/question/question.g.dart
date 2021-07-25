// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionList _$_$_QuestionListFromJson(Map<String, dynamic> json) {
  return _$_QuestionList(
    count: json['count'] as int?,
    next: json['next'] as String?,
    previous: json['previous'] as String?,
    results: (json['results'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_QuestionListToJson(_$_QuestionList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    id: json['id'] as int?,
    created_at: parseDateTime(json['created_at'] as String?),
    updated_at: parseDateTime(json['updated_at'] as String?),
    deleted_at: parseDateTime(json['deleted_at'] as String?),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    content: json['content'] as String?,
    status: json['status'] as String?,
    viewed_count: json['viewed_count'] as int?,
    liked_count: json['liked_count'] as int?,
    disliked_count: json['disliked_count'] as int?,
    author: json['author'] as int?,
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at?.toIso8601String(),
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'viewed_count': instance.viewed_count,
      'liked_count': instance.liked_count,
      'disliked_count': instance.disliked_count,
      'author': instance.author,
    };
