import 'dart:io';
import 'package:codeverse/app/modules/sign_up/controller/signup_screen_controller.dart';
import 'package:codeverse/app/widgets/common_textfield.dart';
import 'package:codeverse/app/widgets/primary_button.dart';
import 'package:codeverse/l10n/localization.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpScreenController controller = Get.put(SignUpScreenController());

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
                    controller: controller.firstNameController,
                    hintText: AppLocalizations.of(context)!.enterFirstName,
                    labeltext: AppLocalizations.of(context)!.firstName,
                    validator: TextFieldValidator.name,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Password field
                  MyTextField(
                    controller: controller.lastNameController,
                    hintText: AppLocalizations.of(context)!.enterLastName,
                    labeltext: AppLocalizations.of(context)!.lastName,
                    errorText: AppLocalizations.of(context)!.enterLastName,
                    keyboardType: TextInputType.name,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorName.silver.withOpacity(.5),
                                width: 2),
                          ),
                          height: 58,
                          child: CountryCodePicker(
                            onChanged: (countryCode) {
                              controller.selectedCountry.value =
                                  countryCode.dialCode!.substring(1);
                            },
                            searchStyle: Theme.of(context).textTheme.bodyMedium,
                            initialSelection: 'US',
                            favorite: const ['+91', 'In'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                            textStyle: GoogleFonts.plusJakartaSans(
                              color: ColorName.shark,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(
                          child: MyTextField(
                            controller: controller.phoneController,
                            hintText:
                                AppLocalizations.of(context)!.enterPhoneNum,
                            labeltext: AppLocalizations.of(context)!.phoneNum,
                            validator: TextFieldValidator.phone,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    controller: controller.emailController,
                    hintText: AppLocalizations.of(context)!.enterYourEmail,
                    labeltext: AppLocalizations.of(context)!.email,
                    validator: TextFieldValidator.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: AppLocalizations.of(context)!.enterYourPass,
                    labeltext: AppLocalizations.of(context)!.password,
                    validator: TextFieldValidator.password,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    controller: controller.confirmPasswordController,
                    hintText:
                        AppLocalizations.of(context)!.enterConfirmPassword,
                    labeltext: AppLocalizations.of(context)!.confirmPass,
                    validator: TextFieldValidator.confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  //primary button

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Obx(
                      () => PrimaryButton(
                        btnText: AppLocalizations.of(context)!.signup,
                        isLoading: controller.isLoading.value,
                        onPressed: () {
                          controller.onSignUpPress();
                        },
                      ),
                    ),
                  ),

                  //Already have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.alreadyHaveAnAcc,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: ColorName.silver),
                      ),
                      Text(
                        AppLocalizations.of(context)!.singIn,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: ColorName.azureRadiance),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
