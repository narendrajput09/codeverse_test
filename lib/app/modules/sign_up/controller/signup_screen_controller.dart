import 'package:codeverse/app/networking/models/register_model/register_user_model.dart';
import 'package:codeverse/app/networking/rest_api_client.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:codeverse/utils/app_preference.dart';
import 'package:codeverse/utils/my_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  Rx<RegisterUserResponse> registerResponse = RegisterUserResponse().obs;
  var selectedCountry = '+91'.obs;
  var isLoading = false.obs;




  onSignUpPress(){
    if (formKey.currentState!.validate()) {


          if (passwordController.text != confirmPasswordController.text) {
            MySnackBar.error(
                "Please check confirm password");
          } else {
            registerApi();
          }
        }

  }

  Future<void> registerApi() async {
    isLoading.value = true;
    var client = RestApiClient();

    var registerUser = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'country_code': selectedCountry.value,
      'phone_no': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirm_password': confirmPasswordController.text
    };
    client.registerUser(registerUser).then((value) {
      isLoading.value = false;

      if (value.status == true) {
        registerResponse.value = value;

        AppPreference()
            .set(value.data!.token ?? "", AppPreference.KEY_REGISTER_TOKEN);
        AppPreference()
            .set(value.data?.email ?? "", AppPreference.KEY_USER_EMAIL);

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
