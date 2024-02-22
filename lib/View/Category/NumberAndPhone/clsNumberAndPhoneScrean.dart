import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsDateModle.dart';
import 'package:cloudapp/View/Category/NumberAndPhone/clsAddOrUpdateNumbersScrean.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class clsNumberAndPhoneScrean extends StatefulWidget {
  const clsNumberAndPhoneScrean({super.key});

  @override
  State<clsNumberAndPhoneScrean> createState() => _clsNumberAndPhoneScreanState();
}

class _clsNumberAndPhoneScreanState extends State<clsNumberAndPhoneScrean> {



  @override
  Widget build(BuildContext context) {
    var pvLocalization = Provider.of<clsLocalizationContoller>(context);
    return Scaffold(
      backgroundColor: clsColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: clsColors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: clsColors.black,
              size: 24,
            ),
          )
        ],
        leading: Image.asset(
          clsImages.setting,
          color: clsColors.black,
        ),
        title: Text(
          "أسماء وأرقام جهات اتصال",
          style: clsFontStyle.bloodStyle
              .copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
     
      body:
       SingleChildScrollView(
        child: Container(
          height: clsDeviceSize.getDeviceHeight(context),
          width: clsDeviceSize.getDeviceWidth(context),
          // color: Colors.green,
          margin: EdgeInsets.only(right: 15, left: 15, top: 20),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(clsImages.phonse),
                    /*Theme(
                      data: Theme.of(context).copyWith(
                          primaryColor: clsColors.white,
                          cardColor: clsColors.white),
                      child:
                       PopupMenuButton(
                        elevation: 1,
                        // shadowColor: clsColors.white,
                        // color: clsColors.white,
                        constraints: const BoxConstraints(maxWidth: 157),
                        padding: EdgeInsets.zero,

                        offset: const Offset(10, 44),
                        onSelected: (value) {
                          switch (value) {
                            case 0:
                              {
                                Navigator.of(context).push(
                                    clsRithSlideAnimation(
                                        page: clsAddOrUpdateNumbersScrean()));
                              }
                            case 1:{
                            }
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: (){

                              },
                              padding: EdgeInsets.zero,
                              child: Container(
                                // height: 80,
                                // color:clsColors.white ,
                                alignment: Alignment.center,
                                width: clsDeviceSize.getDeviceWidth(context),
                                child: Text(
                                  "إضافة جهة اتصال جديدة",
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.primary),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: Container(
                                // color: clsColors.white,
                                height: 50,
                                width: clsDeviceSize.getDeviceWidth(context),
                                alignment: Alignment.center,
                                child: Text(
                                  "إضافة من ذاكرة الهاتف",
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.primary),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: Container(
                                // color: clsColors.white,
                                height: 50,
                                width: clsDeviceSize.getDeviceWidth(context),
                                alignment: Alignment.center,
                                child: Text(
                                  "إضافة من بطاقة SIM",
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.primary),
                                ),
                              ),
                            )
                          ];
                        },
                        child:
                         Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: clsColors.primary),
                            width: 141,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_box,
                                  size: 16,
                                  color: clsColors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "إضافة جهة اتصال",
                                  style: clsFontStyle.regularStyle.copyWith(
                                      fontSize: 12, color: clsColors.white),
                                )
                              ],
                            )),
                      ),
                    ),
                    */
                    InkWell(
                      onTap: (){
                           Navigator.of(context).push(
                                    clsRithSlideAnimation(
                                        page: clsAddOrUpdateNumbersScrean()));
                        
                      },
                      child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: clsColors.primary),
                              width: 141,
                              height: 32,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_box,
                                    size: 16,
                                    color: clsColors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "إضافة جهة اتصال",
                                    style: clsFontStyle.regularStyle.copyWith(
                                        fontSize: 12, color: clsColors.white),
                                  )
                                ],
                              )),
                    ),
                   
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: clsColors.grayLow,
                            minimumSize: Size(141, 32)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              clsImages.copy,
                              height: 16,
                              width: 16,
                              color: clsColors.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "نسخ البيانات",
                              style: clsFontStyle.regularStyle.copyWith(
                                  fontSize: 12, color: clsColors.primary),
                            )
                          ],
                        ))
                  ],
                ),
              )
         
            ],
          ),
        ),
      ),
    );
  }
}
