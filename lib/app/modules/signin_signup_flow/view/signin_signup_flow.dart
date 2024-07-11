import 'package:codeverse/app/modules/login_screen/view/login_screen.dart';
import 'package:codeverse/app/modules/sign_up/view/signup_screen.dart';
import 'package:codeverse/app/modules/signin_signup_flow/controller/signin_signup_flow_controller.dart';
import 'package:codeverse/app/widgets/app_background.dart';
import 'package:codeverse/l10n/localization.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInSignUpFlow extends StatelessWidget {
  SignInSignUpFlow({Key? key}) : super(key: key);
  final SignInSignUpFlowController controller =
      Get.put(SignInSignUpFlowController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackground(
        childWidget: DefaultTabController(
          length: 2,

          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: size.height * .1),
            child: Column(
              children: [
                TabBar(
                  onTap: (value){
                    print("index${value}");
                  },
                  padding: EdgeInsets.zero,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: ColorName.silver,

                  labelColor: ColorName.shark,
                  unselectedLabelColor: ColorName.shark.withOpacity(0.5),
                  indicatorColor: ColorName.azureRadiance,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      text: AppLocalizations.of(context)!.singIn,
                    ),
                    Tab(
                      text: AppLocalizations.of(context)!.singUp,
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    LoginScreen(),
                    SignUpScreen(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
