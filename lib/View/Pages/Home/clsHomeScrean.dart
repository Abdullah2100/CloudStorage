import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsCarsuolController.dart';
import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Controller/clsProfileContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/View/Category/NumberAndPhone/clsNumberAndPhoneScrean.dart';
import 'package:cloudapp/View/Category/PasswordAndAccount/clsPasswordAndAccountScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Category/Shape/clsCategoryShape.dart';
import '../Profile/clsProfileShape.dart';
import '../../../generated/l10n.dart';
import 'Shape/clsButtonsheppItmeShap.dart';

class clsHomeScrean extends StatefulWidget {
  const clsHomeScrean({super.key});

  @override
  State<clsHomeScrean> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<clsHomeScrean> {
  bool isClickOkay = false;
  int currentBottonNavigationInde = 0;

  void _showGreatingMassege() async {
    String? coponCde = await clsShardPrefHelper
        .getDataFromShared(clsShardName.cupune_shard) as String?;

    if (coponCde != null) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
                backgroundColor: clsColors.white,
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      height: 299,
                      width: 358,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            clsImages.gift,
                            height: 102,
                            width: 102,
                          ),
                          Text(
                            "كود الخصم",
                            style: clsFontStyle.bloodStyle
                                .copyWith(fontSize: 18, color: clsColors.black),
                          ),
                          Text(
                            isClickOkay
                                ? "بمناسبة حدث ما ، تقدم لكم ادارة التطبيق كود الخصم بتخفيض 20% على كل الباقات."
                                : "مرحبا بكم، شكرا على تسجليكم في تطبيق الذاكرة السحابية لقد تم تفعيل العرض المجاني بنجاح",
                            textAlign: TextAlign.center,
                            style: clsFontStyle.bloodStyle
                                .copyWith(fontSize: 12, color: clsColors.gray),
                          ),
                          if (!isClickOkay)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isClickOkay = true;
                                });
                              },
                              child: Text(
                                "حسنا",
                                style: clsFontStyle.regularStyle.copyWith(
                                    color: clsColors.primary, fontSize: 16),
                              ),
                            )
                          else
                            InkWell(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                        text: coponCde.toString()))
                                    .then((value) {
                                  clsShardPrefHelper.clearShardData(
                                      clsShardName.cupune_shard);
                                  Navigator.pop(context);
                                  clsCustomMessage.Message(
                                      "  تم النسخ بنجاح الكوبون هو ${coponCde.toString()}",
                                      true,
                                      context);
                                });
                              },
                              child: Container(
                                width: clsDeviceSize.getDeviceWidth(context),
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      coponCde.toString(),
                                      style: clsFontStyle.regularStyle.copyWith(
                                          fontSize: 20,
                                          color: clsColors.primary),
                                    ),
                                    const Row(
                                      children: [
                                        Text("نسخ"),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(Icons.copy)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  },
                ));
          });
    }
  }



  void _resultAction(String? message, isComplate) {
    switch (isComplate) {
      case false:
        {
          clsCustomMessage.Message("$message", false, context);
        }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getData() async {
    Provider.of<clsProfileContoller>(context, listen: false)
        .getProfileData(_resultAction);
    Provider.of<clsCategoryController>(context, listen: false)
        .getAllCategory(_resultAction);
  }

  @override
  void initState() {
    _showGreatingMassege();
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pvCarsoulController = Provider.of<clsCarsuolController>(context);
    var pvCateogryController = Provider.of<clsCategoryController>(context);

    return Scaffold(
      backgroundColor: clsColors.backgroundColor,
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 5, right: 5, left: 5, bottom: 5),
        height: 70,
        color: clsColors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            clsButtonsheppItmeShap(
              onClick: () {
                setState(() {
                  currentBottonNavigationInde = 0;
                });
              },
              image: clsImages.home,
              currentIndex: currentBottonNavigationInde,
              itumIndex: 0,
              title: S.of(context).home,
            ),
            clsButtonsheppItmeShap(
              onClick: () {
                setState(() {
                  currentBottonNavigationInde = 1;
                });
              },
              image: clsImages.trash,
              currentIndex: currentBottonNavigationInde,
              itumIndex: 1,
              title: S.of(context).trash,
            ),
            FloatingActionButton(
              backgroundColor: clsColors.primary,
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: clsColors.white,
              ),
            ),
            clsButtonsheppItmeShap(
              onClick: () {
                setState(() {
                  currentBottonNavigationInde = 2;
                });
              },
              image: clsImages.notification,
              currentIndex: currentBottonNavigationInde,
              itumIndex: 2,
              title: S.of(context).notification,
            ),
            clsButtonsheppItmeShap(
              onClick: () {
                setState(() {
                  currentBottonNavigationInde = 3;
                });
              },
              image: clsImages.setting,
              currentIndex: currentBottonNavigationInde,
              itumIndex: 3,
              title: S.of(context).setting,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              clsProfileShape(context: context),
              const SizedBox(
                height: 5,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      pvCarsoulController.changeInde(index);
                    },
                    height: 240.0,
                    autoPlay: true,
                    viewportFraction: 1),
                items: [clsImages.slideImage, clsImages.slideImage].map((i) {
                  return Image.asset(
                    i,
                    height: 240,
                    width: clsDeviceSize.getDeviceWidth(context),
                  );
                }).toList(),
              ),
              Container(
                height: 10,
                width: clsDeviceSize.getDeviceWidth(context),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: pvCarsoulController.index == index
                                ? clsColors.LinearIndicatorLolor
                                : clsColors.normalLinercolor),
                        height: 10,
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Container(
                      color: clsColors.white,
                      alignment: Alignment.centerRight,
                      height: 48,
                      width: clsDeviceSize.getDeviceWidth(context) * 0.7,
                      child: Text(
                        "إبحث عن شيء ما...",
                        style: clsFontStyle.regularStyle
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: clsColors.primary,
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      height: 48,
                      width: 48,
                      child: Icon(
                        Icons.search,
                        size: 24,
                        color: clsColors.white,
                      )),
                ],
              )),
              const SizedBox(
                height: 10,
              ),
              if (pvCateogryController.cateoryList.isNotEmpty)
                Container(
                  height: clsDeviceSize.getDeviceHeight(context),
                  width: clsDeviceSize.getDeviceWidth(context),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pvCateogryController.cateoryList.length,
                    itemBuilder: (context, index) {
                      clsCategoryModle _category =
                          pvCateogryController.cateoryList[index];
                      return clsCategoryShape(
                        context: context,
                        image: pvCateogryController.categoryImage[index],
                        modifyDate: _category.updatedAt ?? "",
                        name: _category.name ?? "",
                        onClick: () {
                          switch (index) {
                            case 0:
                              {
                                Navigator.of(context).push(
                                    clsRithSlideAnimation(
                                        page: clsNumberAndPhoneScrean()));
                              }
                            case 1:
                              {}
                            case 2:
                              {
                                Navigator.of(context).push(
                                    clsRithSlideAnimation(
                                        page: clsPasswordAndAccountScrean()));
                              }
                          }
                        },
                        remidSize: 0,
                        totalSize: 0,
                        usedSize: 0,
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
