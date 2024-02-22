import 'package:cloudapp/Controller/clsLocalizationContoller.dart';
import 'package:cloudapp/View/Pages/OnBoard/shape/clsNextAndSkipButtonShap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Animation/clsRithSlideAnimation.dart';
import 'package:cloudapp/Controller/clsOnBoardingController.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:cloudapp/View/Pages/OnBoard/shape/clsOnBoardShape.dart';
import '../../../Modle/clsOnBoardData.dart';
import '../Auth/clsRigisterScrean.dart';
import '../../../generated/l10n.dart';

class clsOnBoardScrean extends StatefulWidget {
  const clsOnBoardScrean({super.key});

  @override
  State<clsOnBoardScrean> createState() => _clsOnBoardScreanState();
}

class _clsOnBoardScreanState extends State<clsOnBoardScrean> {
  @override
  Widget build(BuildContext context) {
    final List<clsOnBoardData> _boardingList = [
      clsOnBoardData(
          S.of(context).onboarding_1_title, clsImages.onbarding_image1),
      clsOnBoardData("أسرع تطبيق لحفظ البيانات والملفات \n  والتخزين السحابي",
          clsImages.onbarding_image2),
      clsOnBoardData(
          "استمتع بباقاتنا\n المميزة بأقل الأسعار", clsImages.onbarding_image3)
    ];

    var pvLocalization = Provider.of<clsLocalizationContoller>(context);
    var pvOnboardingContoller = Provider.of<clsOnBoardingController>(context);
    int currentIndex = pvOnboardingContoller.currentIndex;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _boardingList.length,
              itemBuilder: (ctx, index) {
                return AnimatedOpacity(
                  duration: const Duration(seconds: 30),
                  opacity: 1.0,
                  child: clsOnBoardShape(
                      title: _boardingList[currentIndex].title,
                      image: _boardingList[currentIndex].mage),
                );
              }),
          Container(
            margin: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIndex != 2) ...[
                clsNextAndSkipButtonShap(
                    isNext: false,
                    image: clsImages.redo,
                    title: S.of(context).skip,
                    onclick: () {
                      clsShardPrefHelper(clsShardName.onBoard_shard)
                          .SaveDataToShard(true);
                      Navigator.pushReplacement(context,
                          clsRithSlideAnimation(page: clsRigisterScrean()));
                    }),

                  Container(
                    width: clsDeviceSize.getDeviceWidth(context) - 160,
                    height: 20,
                    alignment: Alignment.center,
                    child: Container(
                      // color: Colors.green,
                      width: 60,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return Container(
                              margin: EdgeInsets.only(right: 4, left: 4),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index
                                      ? clsColors.primary
                                      : clsColors.gray));
                        },
                      ),
                    ),
                  ),
                  clsNextAndSkipButtonShap(
                    icon: Icons.arrow_forward,
                    title: S.of(context).next,
                    onclick: () {
                      pvOnboardingContoller.increaseIndex();
                    },
                  )
                ]
              else...[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          fixedSize:
                          Size(clsDeviceSize.getDeviceWidth(context)-30, 50),
                          backgroundColor: clsColors.secondary),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            clsRithSlideAnimation(page: clsRigisterScrean()));
                        },
                      child: Text(
                       S.of(context).skip,
                        style: clsFontStyle.regularStyle
                            .copyWith(fontSize: 16, color: Colors.white),
                      )),

                ]

              ],



            ),
          )
        ],
      ),
    );
  }
}
