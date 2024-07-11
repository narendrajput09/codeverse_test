import 'package:codeverse/app/networking/models/user_detail_model/user_detail_model.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GridItemList extends StatelessWidget {
   GridItemList({super.key,required this.userList});
  UserList userList = UserList();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: ColorName.silver),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "${userList.first_name} ${userList.last_name}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorName.shark,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: SizedBox(
                    width: Get.width * 0.5,
                    child: Text(
                      "${userList.email} ${userList.phone_no}",
                      textAlign: TextAlign.start,

                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorName.shark,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 15
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(width: 1, color: ColorName.azureRadiance)),
              child: const Center(
                child: Text(
                  "View Profile",
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorName.azureRadiance,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
