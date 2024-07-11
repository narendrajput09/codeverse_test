import 'package:codeverse/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:codeverse/app/modules/login_screen/controller/login_screen_controller.dart';
import 'package:get/get.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
