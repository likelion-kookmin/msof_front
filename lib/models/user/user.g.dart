// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    token: json['token'] as String?,
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
      'token': instance.token,
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'name': instance.name,
      'university': instance.university,
      'point': instance.point,
    };
