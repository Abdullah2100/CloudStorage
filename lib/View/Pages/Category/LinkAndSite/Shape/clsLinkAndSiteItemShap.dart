
import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsLinkAndSiteController.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/View/Pages/Category/LinkAndSite/clsAddOrUpdateLinkAndSiteScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../Controller/clsContactContoller.dart';
import '../../../../../Modle/clsLinkAndSiteModle.dart';
import '../../../../../Util/clsDateShape.dart';

class clsLinkAndSiteItemShap extends StatefulWidget {
  clsLinkAndSiteModle  modle;
  int categoryId;
  BuildContext context;
  Function onComplate;

  clsLinkAndSiteItemShap(
      {super.key,
      required this.modle,
      required this.context,
      required this.categoryId,
      required this.onComplate});

  @override
  State<clsLinkAndSiteItemShap> createState() => _clsLinkAndSiteItemShapState();
}

class _clsLinkAndSiteItemShapState extends State<clsLinkAndSiteItemShap> {
  @override
  Widget build(BuildContext context) {
    var pvLinkAndSiteController = Provider.of<clsLinkAndSiteController>(context);
    return Container(
      padding: EdgeInsets.only(top: 10,left: 10,right:10),
      decoration: BoxDecoration(

          color: clsColors.white ,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      margin: const EdgeInsets.only(bottom: 10),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                clsImages.link,
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
                        Navigator.of(context)
                            .push(clsRithSlideAnimation(
                                page: clsAddOrUpdateLinkAndSiteScrean(
                              categoryId: widget.categoryId,
                              contact: widget.modle,
                            ))).then((value) =>
                          widget.onComplate
                        );

                      },
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              clsImages.edit,
                              color: clsColors.grean,
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 3,),
                            Text(
                              "تعديل جهة الإتصال",
                              style: clsFontStyle.bloodStyle.copyWith(
                                  fontSize: 12, color: clsColors.grean),
                            ),
                          ],
                        ),
                      ),
                    )
                 ,
                    PopupMenuItem(
                      onTap: () {
                        widget.modle.isStartNumberSetter();
                        widget.modle.setName(null);
                        widget.modle.setTypID(null);

                        pvLinkAndSiteController.isPageLoading();
                        pvLinkAndSiteController.updateLinkAndList(widget.modle, widget.categoryId, widget.onComplate);

                      },
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              clsImages.star,
                              color: clsColors.secondary,
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 3,),

                            Text(
                              "وضع كمميز",style: clsFontStyle.bloodStyle.copyWith(
                                  fontSize: 12, color: clsColors.secondary),
                            ),
                          ],
                        ),
                      ),
                    )

                   , PopupMenuItem(
                      onTap: () {
                        pvLinkAndSiteController.isPageLoading();
                        pvLinkAndSiteController.deleteLinkAndList(widget.modle.id??0,  widget.onComplate);

                      },
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              clsImages.delete,
                              color: clsColors.red,
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 3,),

                            Text(
                  "حذف جهة الإتصال"
                  ,style: clsFontStyle.bloodStyle.copyWith(
                                fontSize: 12, color: clsColors.red),
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
            "facc",
            // "${pvContactTypController.contactTypeList.where((element) => element.id == modle.typeId)?.first.name}",
            style: clsFontStyle.regularStyle
                .copyWith(fontSize: 12, color: clsColors.gray),
          ),

          // ]
          //  ,
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
