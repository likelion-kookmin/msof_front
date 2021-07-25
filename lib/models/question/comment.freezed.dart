// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentList _$CommentListFromJson(Map<String, dynamic> json) {
  return _CommentList.fromJson(json);
}

/// @nodoc
class _$CommentListTearOff {
  const _$CommentListTearOff();

  _CommentList call(
      {int? count,
      String? next,
      String? previous,
      List<Comment>? results = const []}) {
    return _CommentList(
      count: count,
      next: next,
      previous: previous,
      results: results,
    );
  }

  CommentList fromJson(Map<String, Object> json) {
    return CommentList.fromJson(json);
  }
}

/// @nodoc
const $CommentList = _$CommentListTearOff();

/// @nodoc
mixin _$CommentList {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Comment>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentListCopyWith<CommentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListCopyWith<$Res> {
  factory $CommentListCopyWith(
          CommentList value, $Res Function(CommentList) then) =
      _$CommentListCopyWithImpl<$Res>;
  $Res call(
      {int? count, String? next, String? previous, List<Comment>? results});
}

/// @nodoc
class _$CommentListCopyWithImpl<$Res> implements $CommentListCopyWith<$Res> {
  _$CommentListCopyWithImpl(this._value, this._then);

  final CommentList _value;
  // ignore: unused_field
  final $Res Function(CommentList) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
abstract class _$CommentListCopyWith<$Res>
    implements $CommentListCopyWith<$Res> {
  factory _$CommentListCopyWith(
          _CommentList value, $Res Function(_CommentList) then) =
      __$CommentListCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? count, String? next, String? previous, List<Comment>? results});
}

/// @nodoc
class __$CommentListCopyWithImpl<$Res> extends _$CommentListCopyWithImpl<$Res>
    implements _$CommentListCopyWith<$Res> {
  __$CommentListCopyWithImpl(
      _CommentList _value, $Res Function(_CommentList) _then)
      : super(_value, (v) => _then(v as _CommentList));

  @override
  _CommentList get _value => super._value as _CommentList;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_CommentList(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentList implements _CommentList {
  const _$_CommentList(
      {this.count, this.next, this.previous, this.results = const []});

  factory _$_CommentList.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentListFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  @JsonKey(defaultValue: const [])
  @override
  final List<Comment>? results;

  @override
  String toString() {
    return 'CommentList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CommentList &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$CommentListCopyWith<_CommentList> get copyWith =>
      __$CommentListCopyWithImpl<_CommentList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentListToJson(this);
  }
}

abstract class _CommentList implements CommentList {
  const factory _CommentList(
      {int? count,
      String? next,
      String? previous,
      List<Comment>? results}) = _$_CommentList;

  factory _CommentList.fromJson(Map<String, dynamic> json) =
      _$_CommentList.fromJson;

  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  String? get next => throw _privateConstructorUsedError;
  @override
  String? get previous => throw _privateConstructorUsedError;
  @override
  List<Comment>? get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentListCopyWith<_CommentList> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {int? id,
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
      int? parent}) {
    return _Comment(
      id: id,
      recomments: recomments,
      created_at: created_at,
      updated_at: updated_at,
      deleted_at: deleted_at,
      selected: selected,
      content: content,
      status: status,
      liked_count: liked_count,
      disliked_count: disliked_count,
      author: author,
      question: question,
      parent: parent,
    );
  }

  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  int? get id => throw _privateConstructorUsedError;
  List<Comment>? get recomments => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get created_at => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get updated_at => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseDateTime)
  DateTime? get deleted_at => throw _privateConstructorUsedError;
  bool? get selected => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get liked_count => throw _privateConstructorUsedError;
  int? get disliked_count => throw _privateConstructorUsedError;
  int? get author => throw _privateConstructorUsedError;
  int? get question => throw _privateConstructorUsedError;
  int? get parent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {int? id,
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
      int? parent});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? recomments = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
    Object? selected = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? liked_count = freezed,
    Object? disliked_count = freezed,
    Object? author = freezed,
    Object? question = freezed,
    Object? parent = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      recomments: recomments == freezed
          ? _value.recomments
          : recomments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
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
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
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
      int? parent});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? recomments = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? deleted_at = freezed,
    Object? selected = freezed,
    Object? content = freezed,
    Object? status = freezed,
    Object? liked_count = freezed,
    Object? disliked_count = freezed,
    Object? author = freezed,
    Object? question = freezed,
    Object? parent = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      recomments: recomments == freezed
          ? _value.recomments
          : recomments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
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
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
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
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {this.id,
      this.recomments,
      @JsonKey(fromJson: parseDateTime) this.created_at,
      @JsonKey(fromJson: parseDateTime) this.updated_at,
      @JsonKey(fromJson: parseDateTime) this.deleted_at,
      this.selected,
      this.content,
      this.status,
      this.liked_count,
      this.disliked_count,
      this.author,
      this.question,
      this.parent});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  final int? id;
  @override
  final List<Comment>? recomments;
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
  final bool? selected;
  @override
  final String? content;
  @override
  final String? status;
  @override
  final int? liked_count;
  @override
  final int? disliked_count;
  @override
  final int? author;
  @override
  final int? question;
  @override
  final int? parent;

  @override
  String toString() {
    return 'Comment(id: $id, recomments: $recomments, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, selected: $selected, content: $content, status: $status, liked_count: $liked_count, disliked_count: $disliked_count, author: $author, question: $question, parent: $parent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.recomments, recomments) ||
                const DeepCollectionEquality()
                    .equals(other.recomments, recomments)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.deleted_at, deleted_at) ||
                const DeepCollectionEquality()
                    .equals(other.deleted_at, deleted_at)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.liked_count, liked_count) ||
                const DeepCollectionEquality()
                    .equals(other.liked_count, liked_count)) &&
            (identical(other.disliked_count, disliked_count) ||
                const DeepCollectionEquality()
                    .equals(other.disliked_count, disliked_count)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(recomments) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(deleted_at) ^
      const DeepCollectionEquality().hash(selected) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(liked_count) ^
      const DeepCollectionEquality().hash(disliked_count) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(parent);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {int? id,
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
      int? parent}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  List<Comment>? get recomments => throw _privateConstructorUsedError;
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
  bool? get selected => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  int? get liked_count => throw _privateConstructorUsedError;
  @override
  int? get disliked_count => throw _privateConstructorUsedError;
  @override
  int? get author => throw _privateConstructorUsedError;
  @override
  int? get question => throw _privateConstructorUsedError;
  @override
  int? get parent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
