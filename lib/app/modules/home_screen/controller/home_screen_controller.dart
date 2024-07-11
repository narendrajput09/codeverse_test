import 'package:codeverse/app/networking/models/user_detail_model/user_detail_model.dart';
import 'package:codeverse/app/networking/rest_api_client.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:codeverse/utils/app_preference.dart';
import 'package:codeverse/utils/my_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeScreenController extends GetxController {
var toggelList = false.obs;
var isLoading = false.obs;
var userName = "User Name".obs;
var userEmail = "User@gmail.com".obs;
RxList<UserList> userList = <UserList>[].obs;
@override
  void onInit() {
    super.onInit();
    getUserDetail();
    getUserNameFromPref();
  }

Future<void> getUserDetail() async {
  isLoading.value = true;
  var client = RestApiClient();
  String token = await AppPreference().get(AppPreference.KEY_REGISTER_TOKEN);
  print("token $token");

  client.userDetail("Bearer ${token}").then((value) {
    isLoading.value = false;
    if (value.status == true) {
      userList.value = value.userList!;
    } else {
      MySnackBar.error(value.message);

    }
  }).onError((error, stackTrace) {
    if (error is DioException) {
      var err = error;
      MySnackBar.error(err.message);
      isLoading.value = false;
    } else {
      MySnackBar.error(error.toString());
      isLoading.value = false;
    }
  });
}

  void getUserNameFromPref() async{

  userName.value = await AppPreference().get(AppPreference.KEY_USER_NAME);
  userEmail.value = await AppPreference().get(AppPreference.KEY_USER_EMAIL);

  }

  void logOut() async{
    String token = await AppPreference().get(AppPreference.KEY_REGISTER_TOKEN);
    var client = RestApiClient();

    client.logOut("Bearer ${token}").then((value) {
     AppPreference().clearAll();
     Get.offAllNamed(AppRoutes.signInSignUpFlow);
    }).onError((error, stackTrace) {
      if (error is DioException) {
        var err = error;
        MySnackBar.error(err.message);
        isLoading.value = false;
      } else {
        MySnackBar.error(error.toString());
        isLoading.value = false;
      }
    });
  }

}
