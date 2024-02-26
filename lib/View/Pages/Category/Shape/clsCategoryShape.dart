import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/Util/clsDateShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clsCategoryShape extends StatelessWidget {
  BuildContext context;
  String image;
  clsCategoryModle modle;
  Function() onClick;

  clsCategoryShape(
      {super.key,
      required this.image,
      required this.context,
      required this.modle,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
  //  print("this the category name ${this.name}  = == = =");
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      height: 146,
      width: clsDeviceSize.getDeviceWidth(context),
      child: InkWell(
        radius: 12 ,
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image,height: 48,width: 48,),
                Container(
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "أخر تعديل: ",
                        style: clsFontStyle.regularStyle
                            .copyWith(color: clsColors.gray, fontSize: 12),
                      ),
                      Text(
                         // modifyDate,
                      clsDateShape(modle.updatedAt.toString()).customDate(),
                        style: clsFontStyle.regularStyle
                            .copyWith(color: clsColors.gray, fontSize: 12),
                      ),
                    Icon(Icons.more_vert_outlined)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${modle.name}",
              style: clsFontStyle.bloodStyle
                  .copyWith(color: clsColors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "المساحة الاجمالية",
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                    Text(
                      '${this.modle.totalSpace}',
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "المساحة المتبقية",
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                    Text(
                      '${(modle.totalSpace??0)-(modle?.useSpace??0)}',
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "المساحة المستخدمة",
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                    Text(
                      '${modle.useSpace}',
                      style: clsFontStyle.bloodStyle
                          .copyWith(color: clsColors.gray, fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
