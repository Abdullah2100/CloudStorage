import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Controller/clsContactTypController.dart';
import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/View/GenralComponent/clsSearchButton.dart';
import 'package:cloudapp/View/Pages/Category/Shape/clsAvaliableSizeShape.dart';
import 'package:cloudapp/View/Pages/Category/Shape/clsCategoryCustomeAppBarShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../../../../Modle/clsContactModle.dart';
import 'Search/clsSearchScreanDelegate.dart';
import 'Shape/clsContactItmeShape.dart';
import 'clsAddOrUpdateNumbersScrean.dart';
import 'package:permission_handler/permission_handler.dart' as permission;


class clsNumberAndPhoneScrean extends StatefulWidget {
  clsCategoryModle modle;

  clsNumberAndPhoneScrean({super.key, required this.modle});

  @override
  State<clsNumberAndPhoneScrean> createState() =>
      _clsNumberAndPhoneScreanState();
}

class _clsNumberAndPhoneScreanState extends State<clsNumberAndPhoneScrean> {

   ScrollController _scrol = ScrollController() ;
  int pageNumber=2;

  void _resultAction(String? message, isComplate) {
    switch (isComplate) {
      case true:
        {
          clsCustomMessage.Message(message ?? "", true, context);
          Provider.of<clsContactController>(context, listen: false)
              .getContacts();
        }

      default:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  void loadData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<clsContactController>(context, listen: false).isPageLoading();
      Provider.of<clsContactTypController>(context, listen: false)
          .getTypeNames();
      Provider.of<clsContactController>(context, listen: false).getContacts();
    });
  }

  void _loadMoreData() {
    if (
    // !Provider.of<clsContactController>(context,listen: false).isFiltter&&
        // && _scrol.position.pixels ==
        // .position.maxScrollExtent
        _scrol.position.maxScrollExtent ==
            _scrol.offset
    ) {
      print("fucntion is calld = = = = =  = = = ==== === =");
      Provider.of<clsContactController>(context,listen: false).getContactByPagination(pageNumber);
        pageNumber++;
    }
  }

  void _pickContactFromContactApp()async{
    var isAccess = await permission.Permission.contacts;
   if (await isAccess.isGranted){
     print("user giveme Access To Contatct ");

   }
}

  @override
  void initState() {
    loadData();
    _scrol.addListener(_loadMoreData);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var pvLocalization = Provider.of<clsLocalizationContoller>(context);
    var pvContactController = Provider.of<clsContactController>(context);



    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return Scaffold(
            bottomSheet:pvContactController.isPagination? Container(
              height: 50,
            width: clsDeviceSize.getDeviceWidth(context),
            alignment: Alignment.center,child: CircularProgressIndicator(color: clsColors.secondary,),):null,
            backgroundColor: clsColors.backgroundColor,
            body: pvContactController.loading
                ? Container(
                    height: clsDeviceSize.getDeviceHeight(context),
                    width: clsDeviceSize.getDeviceWidth(context),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: clsColors.secondary,
                    ),
                  )
                : Container(
                    height: clsDeviceSize.getDeviceHeight(context),
                    width: clsDeviceSize.getDeviceWidth(context),
                    // color: Colors.green,
                    margin: EdgeInsets.only(right: 15, left: 15, top: 30),
                    child: SingleChildScrollView(
                      controller:_scrol ,
                      physics:const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          clsCategoryCustomeAppBarShape(
                            image: clsImages.setting,
                            title: widget.modle.name,
                            context: context,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(clsImages.phonse),
                                Theme(
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
                                      // Navigator.of(context).push(
                                      //     clsRithSlideAnimation(
                                      //         page: clsAddOrUpdateNumbersScrean()));
                                    }
                                  case 1:{
                                  }
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    onTap: (){
                                     Navigator.of(context).push( clsRithSlideAnimation(
                                         page: clsAddOrUpdateNumbersScrean(
                                             categoryId: widget.modle.id ?? 0)));
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
                                    onTap: (){
                                      _pickContactFromContactApp();
                                    },
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

                             /*   InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      clsRithSlideAnimation(
                                        page: clsAddOrUpdateNumbersScrean(
                                            categoryId: widget.modle.id ?? 0),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: clsColors.primary),
                                      width: 141,
                                      height: 32,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            style: clsFontStyle.regularStyle
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: clsColors.white),
                                          )
                                        ],
                                      )),
                                ),
                             */

                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: clsColors.grayLow,
                                        minimumSize: Size(141, 32)),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style: clsFontStyle.regularStyle
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: clsColors.primary),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          clsAvaliableSizeShape(
                              context: context,
                              totalSpace: widget.modle.totalSpace ?? 0,
                              usedSpace: widget.modle.useSpace ?? 0,
                              categoryTitle: widget.modle.name),
                          const SizedBox(height: 20,),

                          clsSearchButton(context: context, navigateFun: ()async{
                            pvContactController.clearCheach();
                            await showSearch(
                            context: context,
                            delegate: clsSearchScreanContactDelegate(),
                            );                          }),
                      const SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                // width:clsDeviceSize.getDeviceWidth(context)*0. ,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        pvContactController.getFilter(0);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 108,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: clsColors.primary),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "عرض الكل",
                                              style: clsFontStyle.regularStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: clsColors.white),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: clsColors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // print("distinct number funtion was called ================");
                                        pvContactController.getFilter(1);
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 93,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: clsColors.secondary),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "المميزة",
                                              style: clsFontStyle.regularStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: clsColors.white),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: clsColors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  pvContactController.getFilter(2);
                                },
                                child: Container(
                                  height: 32,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)
                                      //,color: clsColors.primary
                                      ,
                                      border:
                                          Border.all(color: clsColors.gray)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "المكررة",
                                        style: clsFontStyle.regularStyle
                                            .copyWith(
                                                fontSize: 12,
                                                color: clsColors.gray),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: clsColors.gray,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (pvContactController.contactList.isNotEmpty)
                            Consumer<clsContactController>(
                                builder: (context, value, child) {
                              // print("this the filter size is ${value.contactFilterList.length}");
                              if (value.isModify) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: CircularProgressIndicator(
                                    color: clsColors.secondary,
                                  ),
                                );
                              } else if (value.contactFilterList.isEmpty &&
                                  value.isFiltter) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "لا يوجد بيانات",
                                      style: clsFontStyle.regularStyle.copyWith(
                                          fontSize: 13, color: clsColors.gray),
                                    ));
                              }

                              return AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 2),
                                child: Container(
                                  //color: clsColors.blackLignt,
                                  // margin: EdgeInsets.only(top: 20),
                                  height: 189.1 *
                                      (value.isFiltter
                                          ? value.contactFilterList.length
                                          : value.contactList.length),
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                    value.isFiltter
                                        ? value.contactFilterList.length
                                        : value.contactList.length,
                                    itemBuilder: (context, index) {
                                      clsContactModle modle =
                                      value.isFiltter
                                          ? value.contactFilterList[index]
                                          : value.contactList[index];
                                      return clsContactItmeContactShape(
                                        onComplate: _resultAction,
                                        categoryId: widget.modle.id ?? 0,
                                        modle: modle,
                                        context: context,
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
