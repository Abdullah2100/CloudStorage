import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clsCategoryCustomeAppBarShape extends StatelessWidget {
  String title;
  String? image;
  BuildContext context;

  clsCategoryCustomeAppBarShape(
      {super.key,
       this.image,
      required this.context,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: clsDeviceSize.getDeviceWidth(this.context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (image != null)
            Image.asset(
              image!,
              color: clsColors.black,
            )
            else
              Text("")
            ,
          Text(
            this.title,
            style: clsFontStyle.bloodStyle
                .copyWith(color: clsColors.black, fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(this.context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: clsColors.black,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
