import 'package:codeverse/app/networking/models/user_detail_model/user_detail_model.dart';
import 'package:codeverse/src/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class GridItemView extends StatelessWidget {
   GridItemView({
    super.key,
     required this.userList
  });
  UserList userList = UserList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1,color: ColorName.silver),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.symmetric(vertical: 2 ),
              child: Text(
                userList.first_name.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,

                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorName.shark,
                    fontWeight: FontWeight.w500),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 2 ),
              child: Text(
                userList.last_name.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,

                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorName.shark,
                    fontWeight: FontWeight.w500),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 2 ),
              child: Text(
                userList.email.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,

                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorName.shark,
                    fontWeight: FontWeight.w500),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 2 ),
              child: Text(
                userList.phone_no.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,

                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    color: ColorName.shark,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(padding: const EdgeInsets.symmetric(vertical: 6,),
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(width: 1,color: ColorName.azureRadiance)

              ),
              child: const Center(child: Text( "User name",
                style: TextStyle(
                    fontSize: 12,
                    color: ColorName.azureRadiance,
                    fontWeight: FontWeight.w400),),),
            )

          ],
        ),
      ),
    );
  }
}