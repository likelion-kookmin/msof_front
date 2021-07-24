// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionList _$QuestionListFromJson(Map<String, dynamic> json) {
  return _QuestionList.fromJson(json);
}

/// @nodoc
class _$QuestionListTearOff {
  const _$QuestionListTearOff();

  _QuestionList call({List<Question>? questions = const []}) {
    return _QuestionList(
      questions: questions,
    );
  }

  QuestionList fromJson(Map<String, Object> json) {
    return QuestionList.fromJson(json);
  }
}

/// @nodoc
const $QuestionList = _$QuestionListTearOff();

/// @nodoc
mixin _$QuestionList {
  List<Question>? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionListCopyWith<QuestionList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionListCopyWith<$Res> {
  factory $QuestionListCopyWith(
          QuestionList value, $Res Function(QuestionList) then) =
      _$QuestionListCopyWithImpl<$Res>;
  $Res call({List<Question>? questions});
}

/// @nodoc
class _$QuestionListCopyWithImpl<$Res> implements $QuestionListCopyWith<$Res> {
  _$QuestionListCopyWithImpl(this._value, this._then);

  final QuestionList _value;
  // ignore: unused_field
  final $Res Function(QuestionList) _then;

  @override
  $Res call({
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionListCopyWith<$Res>
    implements $QuestionListCopyWith<$Res> {
  factory _$QuestionListCopyWith(
          _QuestionList value, $Res Function(_QuestionList) then) =
      __$QuestionListCopyWithImpl<$Res>;
  @override
  $Res call({List<Question>? questions});
}

/// @nodoc
class __$QuestionListCopyWithImpl<$Res> extends _$QuestionListCopyWithImpl<$Res>
    implements _$QuestionListCopyWith<$Res> {
  __$QuestionListCopyWithImpl(
      _QuestionList _value, $Res Function(_QuestionList) _then)
      : super(_value, (v) => _then(v as _QuestionList));

  @override
  _QuestionList get _value => super._value as _QuestionList;

  @override
  $Res call({
    Object? questions = freezed,
  }) {
    return _then(_QuestionList(
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionList implements _QuestionList {
  const _$_QuestionList({this.questions = const []});

  factory _$_QuestionList.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionListFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<Question>? questions;

  @override
  String toString() {
    return 'QuestionList(questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuestionList &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(questions);

  @JsonKey(ignore: true)
  @override
  _$QuestionListCopyWith<_QuestionList> get copyWith =>
      __$QuestionListCopyWithImpl<_QuestionList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionListToJson(this);
  }
}

abstract class _QuestionList implements QuestionList {
  const factory _QuestionList({List<Question>? questions}) = _$_QuestionList;

  factory _QuestionList.fromJson(Map<String, dynamic> json) =
      _$_QuestionList.fromJson;

  @override
  List<Question>? get questions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionListCopyWith<_QuestionList> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
class _$QuestionTearOff {
  const _$QuestionTearOff();

  _Question call(
      {int? id,
      @JsonKey(fromJson: parseDateTime) DateTime? created_at,
      @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
      @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
      Map<String, dynamic>? comments,
      String? title,
      String? content,
      String? status,
      int? viewed_count,
      int? liked_count,
      int? disliked_count,
      int? author}) {
    return _Question(
      id: id,
      created_at: created_at,
      updated_at: updated_at,
      deleted_at: deleted_at,
      comments: comments,
      title: title,
      content: content,
      status: status,
      viewed_count: viewed_count,
      liked_count: liked_count,
      disliked_count: disliked_count,
      author: author,
    );
  }

  Question fromJson(Map<String, Object> json) {
    return Question.fromJson(json);
  }
}

/// @nodoc
const $Question = _$QuestionTearOff();

/// @nodoc
mixin _$Question {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get created_at => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get deleted_at => throw _privateConstructorUsedError;
  Map<String, dynamic>? get comments => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get viewed_count => throw _privateConstructorUsedError;
  int? get liked_count => throw _privateConstructorUsedError;
  int? get disliked_count => throw _privateConstructorUsedError;
  int? get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(fromJson: parseDateTime) DateTime? created_at,
      @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
      @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
      Map<String, dynamic>? comments,
      String? title,
      String? content,
      String? status,
      int? viewed_count,
      int? liked_count,
      int? disliked_count,
      int? author});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
    Object? comments = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? viewed_count = freezed,
    Object? liked_count = freezed,
    Object? disliked_count = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted_at: deleted_at == freezed
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      viewed_count: viewed_count == freezed
          ? _value.viewed_count
          : viewed_count // ignore: cast_nullable_to_non_nullable
              as int?,
      liked_count: liked_count == freezed
          ? _value.liked_count
          : liked_count // ignore: cast_nullable_to_non_nullable
              as int?,
      disliked_count: disliked_count == freezed
          ? _value.disliked_count
          : disliked_count // ignore: cast_nullable_to_non_nullable
              as int?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(fromJson: parseDateTime) DateTime? created_at,
      @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
      @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
      Map<String, dynamic>? comments,
      String? title,
      String? content,
      String? status,
      int? viewed_count,
      int? liked_count,
      int? disliked_count,
      int? author});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object? id = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
    Object? comments = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? viewed_count = freezed,
    Object? liked_count = freezed,
    Object? disliked_count = freezed,
    Object? author = freezed,
  }) {
    return _then(_Question(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deleted_at: deleted_at == freezed
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      viewed_count: viewed_count == freezed
          ? _value.viewed_count
          : viewed_count // ignore: cast_nullable_to_non_nullable
              as int?,
      liked_count: liked_count == freezed
          ? _value.liked_count
          : liked_count // ignore: cast_nullable_to_non_nullable
              as int?,
      disliked_count: disliked_count == freezed
          ? _value.disliked_count
          : disliked_count // ignore: cast_nullable_to_non_nullable
              as int?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  const _$_Question(
      {this.id,
      @JsonKey(fromJson: parseDateTime) this.created_at,
      @JsonKey(fromJson: parseDateTime) this.updated_at,
      @JsonKey(fromJson: parseDateTime) this.deleted_at,
      this.comments,
      this.title,
      this.content,
      this.status,
      this.viewed_count,
      this.liked_count,
      this.disliked_count,
      this.author});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(fromJson: parseDateTime)
  final DateTime? created_at;
  @override
  @JsonKey(fromJson: parseDateTime)
  final DateTime? updated_at;
  @override
  @JsonKey(fromJson: parseDateTime)
  final DateTime? deleted_at;
  @override
  final Map<String, dynamic>? comments;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? status;
  @override
  final int? viewed_count;
  @override
  final int? liked_count;
  @override
  final int? disliked_count;
  @override
  final int? author;

  @override
  String toString() {
    return 'Question(id: $id, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, comments: $comments, title: $title, content: $content, status: $status, viewed_count: $viewed_count, liked_count: $liked_count, disliked_count: $disliked_count, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.deleted_at, deleted_at) ||
                const DeepCollectionEquality()
                    .equals(other.deleted_at, deleted_at)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.viewed_count, viewed_count) ||
                const DeepCollectionEquality()
                    .equals(other.viewed_count, viewed_count)) &&
            (identical(other.liked_count, liked_count) ||
                const DeepCollectionEquality()
                    .equals(other.liked_count, liked_count)) &&
            (identical(other.disliked_count, disliked_count) ||
                const DeepCollectionEquality()
                    .equals(other.disliked_count, disliked_count)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(deleted_at) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(viewed_count) ^
      const DeepCollectionEquality().hash(liked_count) ^
      const DeepCollectionEquality().hash(disliked_count) ^
      const DeepCollectionEquality().hash(author);

  @JsonKey(ignore: true)
  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {int? id,
      @JsonKey(fromJson: parseDateTime) DateTime? created_at,
      @JsonKey(fromJson: parseDateTime) DateTime? updated_at,
      @JsonKey(fromJson: parseDateTime) DateTime? deleted_at,
      Map<String, dynamic>? comments,
      String? title,
      String? content,
      String? status,
      int? viewed_count,
      int? liked_count,
      int? disliked_count,
      int? author}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: parseDateTime)
  DateTime? get created_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: parseDateTime)
  DateTime? get updated_at => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: parseDateTime)
  DateTime? get deleted_at => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get comments => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  int? get viewed_count => throw _privateConstructorUsedError;
  @override
  int? get liked_count => throw _privateConstructorUsedError;
  @override
  int? get disliked_count => throw _privateConstructorUsedError;
  @override
  int? get author => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionCopyWith<_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
