// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      userList: (json['userList'] as List<dynamic>?)
          ?.map((e) => UserList.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      lastPage: (json['lastPage'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'userList': instance.userList,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'total': instance.total,
      'perPage': instance.perPage,
    };

UserList _$UserListFromJson(Map<String, dynamic> json) => UserList(
      id: (json['id'] as num?)?.toInt(),
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      country_code: json['country_code'] as String?,
      phone_no: json['phone_no'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'country_code': instance.country_code,
      'phone_no': instance.phone_no,
      'status': instance.status,
    };
