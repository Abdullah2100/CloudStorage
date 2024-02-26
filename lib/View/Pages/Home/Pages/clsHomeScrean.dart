import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../../Category/FileAndDocument/clsFileAndDocumentScrean.dart';
import '../../Category/NumberAndPhone/clsNumberAndPhoneScrean.dart';
import '../../Category/PasswordAndAccount/clsPasswordAndAccountScrean.dart';
import '../../Category/Shape/clsCategoryShape.dart';
import '../../Profile/clsProfileShape.dart';
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
import 'package:cloudapp/View/Pages/Category/LinkAndSite/clsLinkAndSiteScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../../generated/l10n.dart';

class clsHomeScrean extends StatefulWidget {
  const clsHomeScrean({super.key});

  @override
  State<clsHomeScrean> createState() => _clsHomeScreanState();
}

class _clsHomeScreanState extends State<clsHomeScrean> {
  TextEditingController _search = TextEditingController();
  var filterList = <clsCategoryModle>[];

  @override
  Widget build(BuildContext context) {
    var pvCarsoulController = Provider.of<clsCarsuolController>(context);
    var pvCateogryController = Provider.of<clsCategoryController>(context);


    return SingleChildScrollView(
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
                    // pvCarsoulController.changeInde(index);
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
                          child: TextField(
                              controller: _search,
                              onChanged: (value) {
                                if (value.length > 0) {
                                  setState(() {
//filterList=pvCateogryController.cateoryList.where((element) => element.name.startsWith(value)).toList();
                                  });
                                }
                              },
                              style: clsFontStyle.mediamStyle.copyWith(
                                fontSize: 18,
                                color: clsColors.gray,
                              ),
                              decoration: InputDecoration(
                                label: Padding(
                                  padding:
                                  const EdgeInsets.only(right: 20),
                                  child: Text(
                                    S
                                        .of(context)
                                        .enterYourAccountName,
                                    textAlign: TextAlign.center,
                                    style: clsFontStyle.mediamStyle
                                        .copyWith(
                                        fontSize: 14,
                                        color: clsColors.gray),
                                  ),
                                ),
                                border: InputBorder.none,
                                fillColor: clsColors.gray,
                              )
                          )),


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
                height: 176.1 * pvCateogryController.cateoryList.length,
                width: clsDeviceSize.getDeviceWidth(context),
                child:
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _search.text.isNotEmpty
                      ? filterList.length
                      : pvCateogryController.cateoryList.length,
                  itemBuilder: (context, index) {
clsCategoryModle _category =_search.text.isNotEmpty?filterList[index]: pvCateogryController.cateoryList[index];
   print(_category.name);
                    return clsCategoryShape(
                      context: context,
                      image: pvCateogryController.categoryImage[index],
                      modle: _category,
                      onClick: () {
                        switch (_category.id) {
                          case 33:
                            {
                              _search.clear();
                              Navigator.of(context).push(
                                  clsRithSlideAnimation(
                                      page: clsNumberAndPhoneScrean(
                                        modle: _category,)));
                            }
                          case 34:
                            {
                              _search.clear();
                              Navigator.of(context).push(
                                  clsRithSlideAnimation(
                                      page: clsLinkAndSiteScrean(
                                        modle: _category,)));
                            }
                          case 36:
                            {
                              _search.clear();
                              Navigator.of(context).push(
                                  clsRithSlideAnimation(
                                      page: clsFileAndDocumentScrean(
                                        modle: _category,)));
                            }
case 2:
  {
    Navigator.of(context).push(
        clsRithSlideAnimation(
            page: clsPasswordAndAccountScrean()));
  }
                        }
                      },
                    );
                  },
                ),
              )
            ,
            SizedBox(height: 70,)
          ],
        ),
      ),


    );
  }
}
