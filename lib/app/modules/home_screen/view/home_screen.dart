import 'package:codeverse/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:codeverse/app/modules/login_screen/controller/login_screen_controller.dart';
import 'package:codeverse/app/widgets/app_background.dart';
import 'package:codeverse/app/widgets/grid_item_list.dart';
import 'package:codeverse/app/widgets/grid_item_view.dart';
import 'package:codeverse/src/gen/assets.gen.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(Assets.images.imgApple.path, height: 50),
        ),
        actions: [IconButton(onPressed: (){

          controller.logOut();
        }, icon: Icon(Icons.logout_outlined,size: 24,color: Colors.red,))],
        title:  Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.userName.value,
              style: TextStyle(
                  fontSize: 17,
                  color: ColorName.shark,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              controller.userEmail.value,
              style: TextStyle(
                  fontSize: 15,
                  color: ColorName.shark,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),),
      ),
      body: AppBackground(
        childWidget: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(() =>controller.isLoading.value?Center(child: CircularProgressIndicator(color: ColorName.azureRadiance)): Column(
            children: [
              UserListTitle(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Obx(() => GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.toggelList.value?1:2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio:controller.toggelList.value?4/1:2/2
                      ),
                      itemCount: controller.userList.length,
                      itemBuilder: (context, index) {
                        return controller.toggelList.value?GridItemList( userList: controller.userList[index]): GridItemView(userList: controller.userList[index]);

                      }),),
                ),
              ),
            ],
          ),)
        ),
      ),
    );
  }

  Widget UserListTitle() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "User List",
        style: TextStyle(
            fontSize: 17, color: ColorName.shark, fontWeight: FontWeight.w500),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1, color: ColorName.silver)),
        child: Obx(() => Row(
          children: [
            GestureDetector(
              onTap: (){
                controller.toggelList.value = true;
              },
              child: Image.asset(
                Assets.images.icList.path,
                height: 25,
                color: controller.toggelList.value?ColorName.azureRadiance:ColorName.shark,

              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: (){
                controller.toggelList.value = false;
              },
              child: Image.asset(
                Assets.images.icGrid.path,
                height: 25,
                color: controller.toggelList.value?ColorName.shark:ColorName.azureRadiance,
              ),
            ),
          ],
        ),),
      )
    ]);
  }
}
