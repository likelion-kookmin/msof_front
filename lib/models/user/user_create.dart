import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_create.freezed.dart';
part 'user_create.g.dart';

@freezed
class UserCreate with _$UserCreate {
  const factory UserCreate({
    String? username,
    String? first_name,
    String? last_name,
    String? email,
    String? name,
    String? university,
  }) = _UserCreate;

  factory UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);
}
