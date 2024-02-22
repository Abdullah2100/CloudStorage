import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';

class clsOnBoardShape extends StatelessWidget {
  String title ;
  String image;
  clsOnBoardShape({super.key,this.title="",this.image="" });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: clsDeviceSize.getDeviceWidth(context)-20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,height:360 ,width: 355,),
         const SizedBox(height: 50,),
          Text(
            title,
            textAlign: TextAlign.center,
            style:clsFontStyle.bloodStyle.copyWith(fontSize: 20,color: clsColors.onbardingColor), ),

        ],
      ),
    );
  }
}
