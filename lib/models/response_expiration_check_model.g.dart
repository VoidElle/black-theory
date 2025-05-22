// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_expiration_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseExpirationCheckModel _$ResponseExpirationCheckModelFromJson(
  Map<String, dynamic> json,
) => _ResponseExpirationCheckModel(
  status: (json['status'] as num).toInt(),
  expirationDate: DateTime.parse(json['expiration_date'] as String),
);

Map<String, dynamic> _$ResponseExpirationCheckModelToJson(
  _ResponseExpirationCheckModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'expiration_date': instance.expirationDate.toIso8601String(),
};
