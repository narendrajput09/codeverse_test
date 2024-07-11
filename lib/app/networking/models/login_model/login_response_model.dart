import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? status;
  String? message;
  Record? record;

  LoginResponse({this.status, this.message, this.record});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
@JsonSerializable()
class Record {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  String? profileImg;
  String? authtoken;

  Record(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNo,
        this.profileImg,
        this.authtoken});

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
  Map<String, dynamic> toJson() => _$RecordToJson(this);
}