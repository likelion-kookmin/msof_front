// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCreate _$_$_UserCreateFromJson(Map<String, dynamic> json) {
  return _$_UserCreate(
    username: json['username'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    email: json['email'] as String?,
    name: json['name'] as String?,
    university: json['university'] as String?,
  );
}

Map<String, dynamic> _$_$_UserCreateToJson(_$_UserCreate instance) =>
    <String, dynamic>{
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'name': instance.name,
      'university': instance.university,
    };
