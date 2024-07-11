import 'package:codeverse/app/modules/login_screen/controller/login_screen_controller.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:codeverse/app/widgets/common_textfield.dart';
import 'package:codeverse/app/widgets/primary_button.dart';
import 'package:codeverse/l10n/localization.dart';
import 'package:codeverse/src/gen/assets.gen.dart';
import 'package:codeverse/src/gen/colors.gen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, }) : super(key: key);
  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                              children: [
                                const SizedBox(height: 10,),
                                //Email field
                                MyTextField(
                                  controller: controller.emailController,
                                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                                  labeltext: AppLocalizations.of(context)!.email,
                                  validator: TextFieldValidator.email,
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                //Password field
                                MyTextField(
                                  controller: controller.passwordController,
                                  hintText: AppLocalizations.of(context)!.enterYourPass,
                                  labeltext: AppLocalizations.of(context)!.password,
                                  validator: TextFieldValidator.password,
                                ),

                                //primary button
                                const SizedBox(
                                  height: 40,
                                ),
                                Obx(() => PrimaryButton(
                                  btnText: AppLocalizations.of(context)!.login,
                                  isLoading: controller.isLoading.value,
                                  onPressed: () {
                                    controller.onLoginPress();                                  },
                                ),),

                                //Forgot password
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppLocalizations.of(context)!.forgotPass,
                        style: const TextStyle(
                            fontSize: 16,
                            color: ColorName.shark,
                            fontWeight: FontWeight.w400),
                      )),
                                ),

                                //social login
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorName.shark,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          AppLocalizations.of(context)!.orSignInWith,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorName.shark),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorName.shark,
                        ),
                      ),
                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 40),
                                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Image.asset(Assets.images.imgFacebook.path,height: 50,),
                    Image.asset(Assets.images.imgGoogle.path,height: 50,),
                    Image.asset(Assets.images.imgApple.path,height: 50,),
                                  ],),
                                ),

                                //Don't have accout text
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                    Text(AppLocalizations.of(context)!.donNotHaveAcc,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: ColorName.silver),),
                    Text(AppLocalizations.of(context)!.signup,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: ColorName.azureRadiance),),
                                  ],
                                )
                              ],
                            ),
                  ),
                ),),),
      );
  }
}
