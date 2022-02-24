import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  String? access_token;
  String? refresh_token;
  String? jwt_token;
  int? expires_in;

  //反序列化
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel(
      {this.access_token, this.refresh_token, this.jwt_token, this.expires_in});
}
