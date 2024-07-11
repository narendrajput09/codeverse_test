
import 'package:codeverse/l10n/extensions.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
    MyTextField(
      {super.key,
        required this.controller,
        this.hintText,
        this.errorText,
        this.validator = TextFieldValidator.text,
        this.obsureText = false,
        this.enabled = true,
        this.iconWidget,
        this.keyboardType = TextInputType.text,
        this.minLines,
        this.maxLines,
        this.maxLength,
        this.autoFocus = false,
        this.inputformat, this.title,
        this.nameColor = false, this.labeltext

      });

  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final String? title;
  final String? labeltext;
  final TextFieldValidator validator;
  final bool obsureText;
  final Widget? iconWidget;
  final TextInputType keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? autoFocus;
  final bool enabled;
  final  List<TextInputFormatter>? inputformat;
  final bool? nameColor ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: GoogleFonts.plusJakartaSans(
            color: ColorName.shark
          ),
          inputFormatters: inputformat,
          enabled: enabled,
          autofocus: autoFocus!,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obsureText,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            counterText: '',
            labelText: labeltext,
            labelStyle: GoogleFonts.plusJakartaSans(color: ColorName.shark,fontSize: 20,fontWeight: FontWeight.w500),

            hintText: hintText ?? 'Type anything',
            hintStyle: GoogleFonts.plusJakartaSans(color: ColorName.silver,fontSize: 16,fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              // Adjust the radius as needed
              borderSide: const BorderSide(
                // Set the border color here
                width: 1.0, // Set the border width here
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:  const BorderSide(
                color: ColorName.silver,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:  const BorderSide(
                color: ColorName.silver,
                width: 1.0,
              ),
            ),
          ),

          /* onChanged: (value) {
            controller.formKey.currentState?.validate();
          },*/
          validator: (value) {
            if (validator == TextFieldValidator.text) {
              if (value == null || value.isEmpty) {
                return errorText ?? 'Please enter some text';
              }
            } else if (validator == TextFieldValidator.name) {
              if (value == null || value.isEmpty) {
                return errorText ?? 'Please enter valid name';
              }
            } else if (validator == TextFieldValidator.email) {
              if (value == null || !value.isValidEmail() ) {
                return errorText ?? 'Please enter valid email address';
              }
            } else if (validator == TextFieldValidator.password) {
              if (value == null || !value.isValidPassword()) {
                return errorText ?? 'Please enter valid password';
              }
            } else if (validator == TextFieldValidator.phone) {
              if (value == null || !value.isValidPhone()) {
                return errorText ?? 'Please enter valid phone number';
              }
            }
            else if (validator == TextFieldValidator.confirmPassword) {
              if (value == null || !value.isValidConfirmPassword()) {
                return errorText ?? 'Please enter confirm password';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}

enum TextFieldValidator {
  none,
  text,
  name,
  email,
  password,
  confirmPassword,
  phone,

}
