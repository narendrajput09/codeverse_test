import 'package:codeverse/app/modules/home_screen/binding/home_screen_binding.dart';
import 'package:codeverse/app/modules/home_screen/view/home_screen.dart';
import 'package:codeverse/app/modules/login_screen/binding/login_screen_binding.dart';
import 'package:codeverse/app/modules/login_screen/view/login_screen.dart';
import 'package:codeverse/app/modules/sign_up/binding/signup_screen_binding.dart';
import 'package:codeverse/app/modules/sign_up/view/signup_screen.dart';
import 'package:codeverse/app/modules/signin_signup_flow/binding/signin_signup_flow_binding.dart';
import 'package:codeverse/app/modules/signin_signup_flow/view/signin_signup_flow.dart';
import 'package:codeverse/app/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => LoginScreen(),
        binding: LoginScreenBinding()),
    GetPage(
        name: AppRoutes.signupScreen,
        page: () => SignUpScreen(),
        binding: SignUpScreenBinding()),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => HomeScreen(),
        binding: HomeScreenBinding()),
  GetPage(
        name: AppRoutes.signInSignUpFlow,
        page: () => SignInSignUpFlow(),
        binding: SignInSignUpFlowBinding()),


  ];
}
