import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class TokenUser with _$TokenUser {
  const factory TokenUser({
    String? token,
    User? user,
  }) = _TokenUser;

  factory TokenUser.fromJson(Map<String, dynamic> json) =>
      _$TokenUserFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? username,
    String? first_name,
    String? last_name,
    String? email,
    String? name,
    String? university,
    String? point,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
