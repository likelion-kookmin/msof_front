import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class MSOFResponse<T> {
  @JsonKey(name: 'success', fromJson: parseSuccess)
  final bool? success;
  final int? status_code;
  final String? message;
  final T? data;

  static bool parseSuccess(String s) {
    return s == 'true' ? true : false;
  }

  const MSOFResponse({
    this.success,
    this.status_code,
    this.message,
    this.data,
  });
  factory MSOFResponse.fromJson(Map<String, dynamic> json,
          {required T Function(Object? json) fromJsonT}) =>
      _$MSOFResponseFromJson<T>(json, fromJsonT);
}
