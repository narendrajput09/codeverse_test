import 'package:codeverse/app/networking/rest_api_client.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:codeverse/utils/app_preference.dart';
import 'package:codeverse/utils/my_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  onLoginPress(){
    if (formKey.currentState!.validate()) {



        loginAPI();

    }

  }

  Future<void> loginAPI() async {
    isLoading.value = true;
    var client = RestApiClient();

    var loginBody = {

      'email': emailController.text,
      'password': passwordController.text,
    };
    client.loginUser(loginBody).then((value) {
      isLoading.value = false;

      if (value.status == true) {

        AppPreference()
            .set(value.record!.authtoken ?? "", AppPreference.KEY_REGISTER_TOKEN);
        AppPreference()
            .set(value.record?.email ?? "", AppPreference.KEY_USER_EMAIL);
        AppPreference()
            .set("${value.record?.firstName} ${value.record?.lastName}" ?? "", AppPreference.KEY_USER_NAME);

        Get.offAllNamed(AppRoutes.homeScreen);
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

}
