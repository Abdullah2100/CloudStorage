
import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:cloudapp/View/Pages/Category/NumberAndPhone/clsAddOrUpdateNumbersScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../Controller/clsContactContoller.dart';
import '../../../../../Util/clsDateShape.dart';

class clsContactItmeSearchContactShape extends StatefulWidget {
  clsContactModle modle;
  int categoryId;
  BuildContext context;
  Function onComplate;

  clsContactItmeSearchContactShape(
      {super.key,
      required this.modle,
      required this.context,
      required this.categoryId,
      required this.onComplate});

  @override
  State<clsContactItmeSearchContactShape> createState() => _clsContactItmeContactShapeState();
}

class _clsContactItmeContactShapeState extends State<clsContactItmeSearchContactShape> {
  @override
  Widget build(BuildContext context) {
    var pvContactController = Provider.of<clsContactController>(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: clsColors.white, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      height: 179,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                clsImages.call,
                height: 28,
                width: 28,
              ),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 1,
                color: clsColors.white,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                      if(pvContactController.addingSeachItemToSearchList(widget.modle)){
                        clsCustomMessage.Message("تمت اضافة العنصر بنجاح", true, context);
                        return;
                      }

                      clsCustomMessage.Message("العنصر موجود في القائمة الرئيسية", false, context);

                      },
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              clsImages.edit,
                              color: clsColors.grean,
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 3,),
                            Text(
                              "إضافة الى القائمة الحالية",
                              style: clsFontStyle.bloodStyle.copyWith(
                                  fontSize: 12, color: clsColors.grean),
                            ),
                          ],
                        ),
                      ),
                    )



                  ];
                },
                child: Image.asset(
                  clsImages.more,
                  color: clsColors.gray,
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${widget.modle.name!=null?(widget.modle.name!.length>40?widget.modle.name!.substring(0,40)+'...':widget.modle.name) : ""}",
            style: clsFontStyle.bloodStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${widget.modle.number}",
            // "${pvContactTypController.contactTypeList.where((element) => element.id == modle.typeId)?.first.name}",
            style: clsFontStyle.regularStyle
                .copyWith(fontSize: 12, color: clsColors.gray),
          ),

          // ]
          //  ,
          // const SizedBox(
          //   height: 10,
          // ),
          // if(widget.modle.contactTypeModle!=null)
          //   Text(
          //     "${widget.modle.contactTypeModle?.name ?? ""}",
          //     style: clsFontStyle.bloodStyle.copyWith(fontSize: 16),
          //   ),
          //  if (modle.typeId != null&&pvContactTypController.contactTypeList.isNotEmpty) ...[
          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تاريخ الاضافة",
                style: clsFontStyle.regularStyle
                    .copyWith(fontSize: 12, color: clsColors.gray),
              ),
              Text(
                clsDateShape(widget.modle.createdAt.toString()).customDate(),
                style: clsFontStyle.regularStyle
                    .copyWith(fontSize: 12, color: clsColors.gray),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
