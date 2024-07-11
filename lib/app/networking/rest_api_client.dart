import 'dart:io';
import 'package:codeverse/app/networking/apis.dart';
import 'package:codeverse/app/networking/app_interceptor.dart';
import 'package:codeverse/app/networking/models/login_model/login_response_model.dart';
import 'package:codeverse/app/networking/models/register_model/register_user_model.dart';
import 'package:codeverse/app/networking/models/user_detail_model/user_detail_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'rest_api_client.g.dart';

@RestApi(baseUrl: "https://mmfinfotech.co/machine_test/api/")
abstract class RestApiClient {

  factory RestApiClient() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options = BaseOptions(
        headers: {},
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60));
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _RestApiClient(dio);
  }

  @POST(Apis.register)
  Future<RegisterUserResponse> registerUser(@Body() Map<String, dynamic> registerUser);

  @POST(Apis.login)
  Future<LoginResponse> loginUser(@Body() Map<String, dynamic> loginBody);

  @GET(Apis.userList)
  Future<UserResponse> userDetail(@Header('Authorization') String token);

  @GET(Apis.logout)
  Future<dynamic> logOut(@Header('Authorization') String token);
}