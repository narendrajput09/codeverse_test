
import 'package:json_annotation/json_annotation.dart';
part 'user_detail_model.g.dart';

@JsonSerializable()
class UserResponse {
  bool? status;
  String? message;
  List<UserList>? userList;
  int? currentPage;
  int? lastPage;
  int? total;
  int? perPage;

  UserResponse(
      {this.status,
        this.message,
        this.userList,
        this.currentPage,
        this.lastPage,
        this.total,
        this.perPage});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
@JsonSerializable()
class UserList {



  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? country_code;
  String? phone_no;
  String? status;

  UserList(
      {this.id,
        this.first_name,
        this.last_name,
        this.email,
        this.country_code,
        this.phone_no,
        this.status});
  factory UserList.fromJson(Map<String, dynamic> json) => _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);


}