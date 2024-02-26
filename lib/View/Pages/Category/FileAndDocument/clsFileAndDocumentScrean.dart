import 'package:auto_height_grid_view/auto_height_grid_view.dart';
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
import 'package:cloudapp/Modle/clsDateModle.dart';
import 'package:cloudapp/Modle/clsLinkAndSiteModle.dart';
import 'package:cloudapp/Util/clsDateShape.dart';
import 'package:cloudapp/View/GenralComponent/clsSearchButton.dart';
import 'package:cloudapp/View/Pages/Category/LinkAndSite/Shape/clsLinkAndSiteItemShap.dart';
import 'package:cloudapp/View/Pages/Category/NumberAndPhone/Search/clsSearchScreanDelegate.dart';
import 'package:cloudapp/View/Pages/Category/Shape/clsAvaliableSizeShape.dart';
import 'package:cloudapp/View/Pages/Category/Shape/clsCategoryCustomeAppBarShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/clsLinkAndSiteController.dart';
import '../../../../Modle/clsContactModle.dart';
import 'Shape/clsFileandDocumentItemShape.dart';
import 'clsAddOrUpdateFileAndDocuementScrean.dart';

class clsFileAndDocumentScrean extends StatefulWidget {
  clsCategoryModle modle;

  clsFileAndDocumentScrean({super.key, required this.modle});

  @override
  State<clsFileAndDocumentScrean> createState() => _clsFileAndDocumentScreanState();
}

class _clsFileAndDocumentScreanState extends State<clsFileAndDocumentScrean> {
  ScrollController _scrol = ScrollController();
  int pageNumber = 2;

  void _resultAction(String? message, isComplate) {
    switch (isComplate) {
      case true:
        {
          clsCustomMessage.Message(message ?? "", true, context);
          loadData();
        }

      default:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  void loadData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<clsLinkAndSiteController>(context, listen: false)
          .isPageLoading();
      Provider.of<clsContactTypController>(context, listen: false)
          .getTypeNames();
      Provider.of<clsLinkAndSiteController>(context, listen: false)
          .getLinnkAndLists();
    });
  }

  void _loadMoreData() {
    if (!Provider.of<clsLinkAndSiteController>(context, listen: false)
            .isFiltter &&
        _scrol.position.pixels + 20 == _scrol.position.maxScrollExtent) {
      print("fucntion is calld = = = = =  = = = ==== === =");
      Provider.of<clsLinkAndSiteController>(context, listen: false)
          .getLinkAndSiteByPagination(pageNumber);
      pageNumber++;
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
    // print("this the category name ${widget.modle.name} = = == =  = = =");
    // print("this the category used ${widget.modle.useSpace} = = == =  = = =");
    var pvLocalization = Provider.of<clsLocalizationContoller>(context);
    var pvGeoLocationController =
        Provider.of<clsLinkAndSiteController>(context);
    var linkAndSizeLenth = pvGeoLocationController.linkAndSiteList.length;
    var linkAndSizeFilterLenth =
        pvGeoLocationController.linkAndSiteFilterList.length;
    return Scaffold(
      bottomSheet: pvGeoLocationController.isPagination
          ? Container(
              height: 50,
              width: clsDeviceSize.getDeviceWidth(context),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: clsColors.secondary,
              ),
            )
          : null,
      backgroundColor: clsColors.backgroundColor,
      body: pvGeoLocationController.loading
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
                controller: _scrol,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    clsCategoryCustomeAppBarShape(
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
                          Image.asset(clsImages.fileAndAssetIcon),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                clsRithSlideAnimation(
                                  page: clsAddOrUpdateFileAndDocuementScrean(
                                      categoryId: widget.modle.id ?? 0),
                                ),
                              );
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
                                      "إضافة رابط جديد",
                                      style: clsFontStyle.regularStyle.copyWith(
                                          fontSize: 12, color: clsColors.white),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // clsAvaliableSizeShape(
                    //     context: context,
                    //     totalSpace: widget.modle.totalSpace ?? 0,
                    //     usedSpace: widget.modle.useSpace ?? 0,
                    //     categoryTitle: widget.modle.name),
                    const SizedBox(
                      height: 20,
                    ),
                    clsSearchButton(
                        context: context,
                        navigateFun: () async {
                          pvGeoLocationController.clearCheach();
                          await showSearch(
                            context: context,
                            delegate: clsSearchScreanContactDelegate(),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width:clsDeviceSize.getDeviceWidth(context)*0. ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  pvGeoLocationController.getFilter(0);
                                },
                                child: Container(
                                  height: 32,
                                  width: 108,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: clsColors.primary),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        Icons.keyboard_arrow_down_outlined,
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
                                  pvGeoLocationController.getFilter(1);
                                },
                                child: Container(
                                  height: 32,
                                  width: 93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: clsColors.secondary),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        Icons.keyboard_arrow_down_outlined,
                                        color: clsColors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (pvGeoLocationController.linkAndSiteList.isNotEmpty)
                      Consumer<clsLinkAndSiteController>(
                          builder: (context, value, child) {
                        // print("this the filter size is ${value.contactFilterList.length}");
                        if (value.isModify) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator(
                              color: clsColors.secondary,
                            ),
                          );
                        } else if (value.linkAndSiteFilterList.isEmpty &&
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
                            height: 170.1 *
                                (!value.isFiltter
                                    ? linkAndSizeLenth % 2 != 0
                                        ? linkAndSizeLenth
                                        : (value.linkAndSiteFilterList.length +
                                                1) /
                                            2
                                    : linkAndSizeFilterLenth % 2 != 0
                                        ? linkAndSizeFilterLenth
                                        : (value.linkAndSiteList.length + 1) /
                                            2),
                            child: AutoHeightGridView(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: value.isFiltter
                                  ? value.linkAndSiteFilterList.length
                                  : value.linkAndSiteList.length,
                              builder: (context, index) {
                                clsLinkAndSiteModle modle = value.isFiltter
                                    ? value.linkAndSiteFilterList[index]
                                    : value.linkAndSiteList[index];
                                return clsFileandDocumentItemShape(
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
                    // const SizedBox(
                    //   height: 50,
                    // )
                  ],
                ),
              ),
            ),
    );
  }
}
