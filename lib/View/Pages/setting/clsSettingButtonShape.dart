import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:flutter/material.dart';

class clsSettingButtonShape extends StatelessWidget {
  BuildContext context;
  String title;
  String image;
  bool isHasSwitch;
  bool isHasTextFeild;
  Function onTap;
   clsSettingButtonShape({super.key, required this.context,required this.image,required this.isHasSwitch,required this.isHasTextFeild,required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(children: [
Image.asset(this.image,height: 24,width: 24,color: clsColors.gray,),

Text(this.title,style: clsFontStyle.mediamStyle.copyWith(fontSize: 12),)
      
    ],),);
  }
}