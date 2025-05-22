// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_expiration_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseExpirationCheckModel {

@JsonKey(name: 'status') int get status;@JsonKey(name: 'expiration_date') DateTime get expirationDate;
/// Create a copy of ResponseExpirationCheckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseExpirationCheckModelCopyWith<ResponseExpirationCheckModel> get copyWith => _$ResponseExpirationCheckModelCopyWithImpl<ResponseExpirationCheckModel>(this as ResponseExpirationCheckModel, _$identity);

  /// Serializes this ResponseExpirationCheckModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseExpirationCheckModel&&(identical(other.status, status) || other.status == status)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,expirationDate);

@override
String toString() {
  return 'ResponseExpirationCheckModel(status: $status, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $ResponseExpirationCheckModelCopyWith<$Res>  {
  factory $ResponseExpirationCheckModelCopyWith(ResponseExpirationCheckModel value, $Res Function(ResponseExpirationCheckModel) _then) = _$ResponseExpirationCheckModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status') int status,@JsonKey(name: 'expiration_date') DateTime expirationDate
});




}
/// @nodoc
class _$ResponseExpirationCheckModelCopyWithImpl<$Res>
    implements $ResponseExpirationCheckModelCopyWith<$Res> {
  _$ResponseExpirationCheckModelCopyWithImpl(this._self, this._then);

  final ResponseExpirationCheckModel _self;
  final $Res Function(ResponseExpirationCheckModel) _then;

/// Create a copy of ResponseExpirationCheckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? expirationDate = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResponseExpirationCheckModel implements ResponseExpirationCheckModel {
  const _ResponseExpirationCheckModel({@JsonKey(name: 'status') required this.status, @JsonKey(name: 'expiration_date') required this.expirationDate});
  factory _ResponseExpirationCheckModel.fromJson(Map<String, dynamic> json) => _$ResponseExpirationCheckModelFromJson(json);

@override@JsonKey(name: 'status') final  int status;
@override@JsonKey(name: 'expiration_date') final  DateTime expirationDate;

/// Create a copy of ResponseExpirationCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseExpirationCheckModelCopyWith<_ResponseExpirationCheckModel> get copyWith => __$ResponseExpirationCheckModelCopyWithImpl<_ResponseExpirationCheckModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseExpirationCheckModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseExpirationCheckModel&&(identical(other.status, status) || other.status == status)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,expirationDate);

@override
String toString() {
  return 'ResponseExpirationCheckModel(status: $status, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$ResponseExpirationCheckModelCopyWith<$Res> implements $ResponseExpirationCheckModelCopyWith<$Res> {
  factory _$ResponseExpirationCheckModelCopyWith(_ResponseExpirationCheckModel value, $Res Function(_ResponseExpirationCheckModel) _then) = __$ResponseExpirationCheckModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status') int status,@JsonKey(name: 'expiration_date') DateTime expirationDate
});




}
/// @nodoc
class __$ResponseExpirationCheckModelCopyWithImpl<$Res>
    implements _$ResponseExpirationCheckModelCopyWith<$Res> {
  __$ResponseExpirationCheckModelCopyWithImpl(this._self, this._then);

  final _ResponseExpirationCheckModel _self;
  final $Res Function(_ResponseExpirationCheckModel) _then;

/// Create a copy of ResponseExpirationCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? expirationDate = null,}) {
  return _then(_ResponseExpirationCheckModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
