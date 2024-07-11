import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key, required this.btnText, this.onPressed, this.isLoading = false})
      : super(key: key);
  final String btnText;
  final Function? onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*.065,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              ColorName.azureRadiance,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        onPressed: () {
          if (!isLoading!) {
            onPressed!();
          }
        },
        child: isLoading!
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: ColorName.white,
                ),
              )
            : Text(
              btnText,
              style: GoogleFonts.plusJakartaSans(color: ColorName.white,fontSize: 14,fontWeight: FontWeight.w500),
            ),
      ),
    );
  }
}

