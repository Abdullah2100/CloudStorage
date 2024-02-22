import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Util/clsDateShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clsCategoryShape extends StatelessWidget {
  BuildContext context;
  String image;
  String name;
  String modifyDate;
  int totalSize;
  int remidSize;
  int usedSize;
  Function() onClick;

  clsCategoryShape(
      {super.key,
      required this.image,
      required this.name,
      required this.context,
      required this.modifyDate,
      required this.remidSize,
      required this.totalSize,
      required this.usedSize,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
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
        onTap: this.onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(this.image,height: 48,width: 48,),
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
                      clsDateShape(modifyDate).customDate(),
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
              this.name,
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
                      '${this.totalSize}',
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
                      '${this.remidSize}',
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
                      '${this.usedSize}',
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
