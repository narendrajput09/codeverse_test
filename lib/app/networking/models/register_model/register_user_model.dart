import 'package:json_annotation/json_annotation.dart';
part 'register_user_model.g.dart';
@JsonSerializable()
class RegisterUserResponse {
  bool? status;
  String? message;
  RegisterData? data;

  RegisterUserResponse({this.status, this.message, this.data});

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) => _$RegisterUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}
@JsonSerializable()
class RegisterData {
  int? id;
  String? email;
  String? token;

  RegisterData({this.id, this.email, this.token});

  factory RegisterData.fromJson(Map<String, dynamic> json) => _$RegisterDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}