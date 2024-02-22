import 'package:cloudapp/Controller/clsProfileContoller.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:cloudapp/Helper/clsImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class clsProfileShape extends StatelessWidget {
  BuildContext context;

  clsProfileShape({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    var person = Provider.of<clsProfileContoller>(context).profile;
    return Container(
      height: 88,
      width: clsDeviceSize.getDeviceWidth(context),
      child:person==null?const Text(""): Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(clsImages.user, height: 55, width: 55)),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${person?.name??""}",
                    style: clsFontStyle.bloodStyle
                        .copyWith(fontSize: 16, color: clsColors.black),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID:${person?.id ?? ""}",
                        style: clsFontStyle.bloodStyle
                            .copyWith(fontSize: 12, color: clsColors.gray),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        clsImages.barcodScan,
                        height: 24,
                        width: 24,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 36,
            width: 88,
            decoration: BoxDecoration(
              color: clsColors.serviceTypeColorLight
                  ,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: clsColors.primary)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(clsImages.cloud),
                const SizedBox(
                  width: 4,
                ),
                Text(
                 // person?.typeUser ??
                      "مجاني",
                  style: clsFontStyle.regularStyle.copyWith(
                    fontSize: 12,
                    color: clsColors.primary
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
