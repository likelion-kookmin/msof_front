// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenUser _$TokenUserFromJson(Map<String, dynamic> json) {
  return _TokenUser.fromJson(json);
}

/// @nodoc
class _$TokenUserTearOff {
  const _$TokenUserTearOff();

  _TokenUser call({String? token, User? user}) {
    return _TokenUser(
      token: token,
      user: user,
    );
  }

  TokenUser fromJson(Map<String, Object> json) {
    return TokenUser.fromJson(json);
  }
}

/// @nodoc
const $TokenUser = _$TokenUserTearOff();

/// @nodoc
mixin _$TokenUser {
  String? get token => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenUserCopyWith<TokenUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenUserCopyWith<$Res> {
  factory $TokenUserCopyWith(TokenUser value, $Res Function(TokenUser) then) =
      _$TokenUserCopyWithImpl<$Res>;
  $Res call({String? token, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$TokenUserCopyWithImpl<$Res> implements $TokenUserCopyWith<$Res> {
  _$TokenUserCopyWithImpl(this._value, this._then);

  final TokenUser _value;
  // ignore: unused_field
  final $Res Function(TokenUser) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$TokenUserCopyWith<$Res> implements $TokenUserCopyWith<$Res> {
  factory _$TokenUserCopyWith(
          _TokenUser value, $Res Function(_TokenUser) then) =
      __$TokenUserCopyWithImpl<$Res>;
  @override
  $Res call({String? token, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$TokenUserCopyWithImpl<$Res> extends _$TokenUserCopyWithImpl<$Res>
    implements _$TokenUserCopyWith<$Res> {
  __$TokenUserCopyWithImpl(_TokenUser _value, $Res Function(_TokenUser) _then)
      : super(_value, (v) => _then(v as _TokenUser));

  @override
  _TokenUser get _value => super._value as _TokenUser;

  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_TokenUser(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenUser implements _TokenUser {
  const _$_TokenUser({this.token, this.user});

  factory _$_TokenUser.fromJson(Map<String, dynamic> json) =>
      _$_$_TokenUserFromJson(json);

  @override
  final String? token;
  @override
  final User? user;

  @override
  String toString() {
    return 'TokenUser(token: $token, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TokenUser &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$TokenUserCopyWith<_TokenUser> get copyWith =>
      __$TokenUserCopyWithImpl<_TokenUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokenUserToJson(this);
  }
}

abstract class _TokenUser implements TokenUser {
  const factory _TokenUser({String? token, User? user}) = _$_TokenUser;

  factory _TokenUser.fromJson(Map<String, dynamic> json) =
      _$_TokenUser.fromJson;

  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TokenUserCopyWith<_TokenUser> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university,
      String? point}) {
    return _User(
      username: username,
      first_name: first_name,
      last_name: last_name,
      email: email,
      name: name,
      university: university,
      point: point,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get username => throw _privateConstructorUsedError;
  String? get first_name => throw _privateConstructorUsedError;
  String? get last_name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;
  String? get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university,
      String? point});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? university = freezed,
    Object? point = freezed,
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
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university,
      String? point});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? username = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? university = freezed,
    Object? point = freezed,
  }) {
    return _then(_User(
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
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.username,
      this.first_name,
      this.last_name,
      this.email,
      this.name,
      this.university,
      this.point});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

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
  final String? point;

  @override
  String toString() {
    return 'User(username: $username, first_name: $first_name, last_name: $last_name, email: $email, name: $name, university: $university, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
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
                    .equals(other.university, university)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(first_name) ^
      const DeepCollectionEquality().hash(last_name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(university) ^
      const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String? username,
      String? first_name,
      String? last_name,
      String? email,
      String? name,
      String? university,
      String? point}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  String? get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
