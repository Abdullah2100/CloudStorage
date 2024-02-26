import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:flutter/material.dart';

class clsAvilablityExplinationShape extends StatelessWidget {
  String title;
  Color color;
   clsAvilablityExplinationShape({super.key,required this.color,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(4)
      ),height:20,width: 20, ),
      SizedBox(width: 4,),
      Text(
        title,
        style: clsFontStyle.mediamStyle.copyWith(
          fontSize: 14,
          color: this.color,

        ),
      ),
    ],);
  }
}
