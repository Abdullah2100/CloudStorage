import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';

class clsTextReqiured extends StatelessWidget {
  String value;
  TextStyle style;
  bool isShownStar=false;
   clsTextReqiured({super.key,this.value="",required this.style,this.isShownStar=true});

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Text(value,style: style,),
      const SizedBox(width: 3,),
      if(isShownStar)
      Text("*",style: clsFontStyle.bloodStyle?.copyWith(color: clsColors.red),)
    ],
    );
  }
}
