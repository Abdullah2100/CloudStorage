import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:flutter/material.dart';

class clsSearchButton extends StatelessWidget {
  BuildContext context;
  Function() navigateFun;
   clsSearchButton({super.key,required this.context,required this.navigateFun});

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      highlightColor: clsColors.backgroundColor,
      onTap: this.navigateFun,
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 0,
                child: Container(
                  color: clsColors.white,
                  alignment:Alignment.centerRight,
                  height: 48,
                  width: clsDeviceSize.getDeviceWidth(context)-100,
                  child: Text(
                    " إبحث عن شيء ما...",
                    style: clsFontStyle.regularStyle
                        .copyWith(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin:const EdgeInsets.only(left: 5),
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
    );

    ;
  }
}
