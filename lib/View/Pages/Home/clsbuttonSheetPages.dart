import 'package:cloudapp/Controller/clsCarsuolController.dart';
import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Controller/clsProfileContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsCustomMessage.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/View/Pages/Home/Pages/clsHomeScrean.dart';
import 'package:cloudapp/View/Pages/Home/Pages/clsNotificationScrean.dart';
import 'package:cloudapp/View/Pages/Home/Pages/clsTrashScrean.dart';
import 'package:cloudapp/View/Pages/setting/clsSettingScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import 'Shape/clsButtonsheppItmeShap.dart';

class clsbuttonSheetPages extends StatefulWidget {
  const clsbuttonSheetPages({super.key});

  @override
  State<clsbuttonSheetPages> createState() => _clsbuttonSheetPagesState();
}

class _clsbuttonSheetPagesState extends State<clsbuttonSheetPages> {
  TextEditingController _search = TextEditingController();
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
                                : "مرحبا بكم، شكرا على تسجليكم في تطبيق الذاكرة السحابيةلقد تم تفعيل العرض المجاني بنجاح",
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
    Provider.of<clsProfileContoller>(context, listen: false).getProfileData();
    Provider.of<clsCategoryController>(context, listen: false).getAllCategory();
  }

  @override
  void initState() {
    _showGreatingMassege();
    _getData();
    super.initState();
  }

  List<Widget> pages = [
    clsHomeScrean(),
    clsTrashScrean(),
    clsNotificationScrean(),
    clsSettingScrean()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: clsColors.backgroundColor,
        bottomNavigationBar: Container(
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
        body: pages[currentBottonNavigationInde]);
  }
}
