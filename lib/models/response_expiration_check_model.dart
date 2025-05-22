import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_expiration_check_model.freezed.dart';
part 'response_expiration_check_model.g.dart';

@freezed
abstract class ResponseExpirationCheckModel with _$ResponseExpirationCheckModel {

  const factory ResponseExpirationCheckModel({

    @JsonKey(name: 'status')
    required int status,

    @JsonKey(name: 'expiration_date')
    required DateTime expirationDate,

  }) = _ResponseExpirationCheckModel;

  factory ResponseExpirationCheckModel.fromJson(Map<String, Object?> json) =>
      _$ResponseExpirationCheckModelFromJson(json);

}
