import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/View/Pages/Category/Shape/clsAvilablityExplinationShape.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class clsAvaliableSizeShape extends StatelessWidget {
  String categoryTitle;
  int totalSpace;
  int usedSpace;
  BuildContext context;

  clsAvaliableSizeShape(
      {super.key,
      required this.context,
      required this.totalSpace,
      required this.usedSpace,
      required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    double pixle =
        clsDeviceSize.getDeviceWidth(this.context) / (this.totalSpace);
    double totalInPrecentage = pixle < 0 ? pixle * -1 : pixle;
    double usedSpace = this.usedSpace==0?0:
        (totalInPrecentage * this.usedSpace);
    double remindSpace = clsDeviceSize.getDeviceWidth(this.context) - usedSpace;
   // print("this the used space ${usedSpace}");
  //  print("this the rest space ${remindSpace}");
 //   print("this the widget space ${clsDeviceSize.getDeviceWidth(context)}");
    return Container(
      height: 120,
      width: clsDeviceSize.getDeviceWidth(this.context),
      // margin: EdgeInsets.only(right: 15,left: 15),
      child: Column(
        children: [
          Container(
            height: 50,
            // margin: ,
            //width: clsDeviceSize.getDeviceWidth(this.context),
            child: Row(
              children: [
                Container(
                  //  margin: EdgeInsets.only(right:15),
                  height: 15,
                  width: usedSpace,
                  decoration: BoxDecoration(
                      color: clsColors.secondary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topLeft:
                            remindSpace == 0 ? Radius.circular(3) : Radius.zero,
                        bottomLeft:
                            remindSpace == 0 ? Radius.circular(3) : Radius.zero,
                      )),
                ),
                Container(
                  //   margin: EdgeInsets.only(right: 15,left: 15),
                  height: 15,
                  width: remindSpace - 30,
                  decoration: BoxDecoration(
                      color: clsColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        bottomLeft: Radius.circular(3),
                        topRight:
                            usedSpace == 0 ? Radius.circular(3) : Radius.zero,
                        bottomRight:
                            usedSpace == 0 ? Radius.circular(3) : Radius.zero,
                      )),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "المساحة الاجمالية :",
                style: clsFontStyle.mediamStyle.copyWith(
                  fontSize: 14,
                  color: clsColors.blackLignt,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                totalSpace.toString(),
                style: clsFontStyle.mediamStyle.copyWith(
                  fontSize: 14,
                  color: clsColors.blackLignt,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                this.categoryTitle,
                style: clsFontStyle.mediamStyle.copyWith(
                  fontSize: 14,
                  color: clsColors.blackLignt,
                ),
              ),
            ],
          ),
         const  SizedBox(height: 10,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                clsAvilablityExplinationShape(
                  title: "المساحة المستخدمة",
                  color: clsColors.secondary,
                ),
                clsAvilablityExplinationShape(
                  title: "المساحة المتبقية",
                  color: clsColors.primary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
