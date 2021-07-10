// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenUser _$_$_TokenUserFromJson(Map<String, dynamic> json) {
  return _$_TokenUser(
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_TokenUserToJson(_$_TokenUser instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user?.toJson(),
    };

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    username: json['username'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    email: json['email'] as String?,
    name: json['name'] as String?,
    university: json['university'] as String?,
    point: json['point'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'name': instance.name,
      'university': instance.university,
      'point': instance.point,
    };
