// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) {
  return _UserCreate.fromJson(json);
}

/// @nodoc
class _$UserCreateTearOff {
  const _$UserCreateTearOff();

  _UserCreate call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university}) {
    return _UserCreate(
      username: username,
      first_name: first_name,
      last_name: last_name,
      email: email,
      name: name,
      university: university,
    );
  }

  UserCreate fromJson(Map<String, Object> json) {
    return UserCreate.fromJson(json);
  }
}

/// @nodoc
const $UserCreate = _$UserCreateTearOff();

/// @nodoc
mixin _$UserCreate {
  String? get username => throw _privateConstructorUsedError;
  String? get first_name => throw _privateConstructorUsedError;
  String? get last_name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCreateCopyWith<UserCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreateCopyWith<$Res> {
  factory $UserCreateCopyWith(
          UserCreate value, $Res Function(UserCreate) then) =
      _$UserCreateCopyWithImpl<$Res>;
  $Res call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university});
}

/// @nodoc
class _$UserCreateCopyWithImpl<$Res> implements $UserCreateCopyWith<$Res> {
  _$UserCreateCopyWithImpl(this._value, this._then);

  final UserCreate _value;
  // ignore: unused_field
  final $Res Function(UserCreate) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? university = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      university: university == freezed
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCreateCopyWith<$Res> implements $UserCreateCopyWith<$Res> {
  factory _$UserCreateCopyWith(
          _UserCreate value, $Res Function(_UserCreate) then) =
      __$UserCreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university});
}

/// @nodoc
class __$UserCreateCopyWithImpl<$Res> extends _$UserCreateCopyWithImpl<$Res>
    implements _$UserCreateCopyWith<$Res> {
  __$UserCreateCopyWithImpl(
      _UserCreate _value, $Res Function(_UserCreate) _then)
      : super(_value, (v) => _then(v as _UserCreate));

  @override
  _UserCreate get _value => super._value as _UserCreate;

  @override
  $Res call({
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? university = freezed,
  }) {
    return _then(_UserCreate(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      university: university == freezed
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserCreate implements _UserCreate {
  const _$_UserCreate(
      {this.username,
      this.first_name,
      this.last_name,
      this.email,
      this.name,
      this.university});

  factory _$_UserCreate.fromJson(Map<String, dynamic> json) =>
      _$_$_UserCreateFromJson(json);

  @override
  final String? username;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? university;

  @override
  String toString() {
    return 'UserCreate(username: $username, first_name: $first_name, last_name: $last_name, email: $email, name: $name, university: $university)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCreate &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.first_name, first_name) ||
                const DeepCollectionEquality()
                    .equals(other.first_name, first_name)) &&
            (identical(other.last_name, last_name) ||
                const DeepCollectionEquality()
                    .equals(other.last_name, last_name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.university, university) ||
                const DeepCollectionEquality()
                    .equals(other.university, university)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(first_name) ^
      const DeepCollectionEquality().hash(last_name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(university);

  @JsonKey(ignore: true)
  @override
  _$UserCreateCopyWith<_UserCreate> get copyWith =>
      __$UserCreateCopyWithImpl<_UserCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserCreateToJson(this);
  }
}

abstract class _UserCreate implements UserCreate {
  const factory _UserCreate(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university}) = _$_UserCreate;

  factory _UserCreate.fromJson(Map<String, dynamic> json) =
      _$_UserCreate.fromJson;

  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get first_name => throw _privateConstructorUsedError;
  @override
  String? get last_name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get university => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCreateCopyWith<_UserCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
