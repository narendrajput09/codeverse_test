import 'package:codeverse/app/modules/signin_signup_flow/controller/signin_signup_flow_controller.dart';
import 'package:get/get.dart';


class SignInSignUpFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInSignUpFlowController>(() => SignInSignUpFlowController());
  }
}
