import 'package:cloudapp/Helper/clsColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';

class clsNextAndSkipButtonShap extends StatelessWidget {
  String title;
  IconData? icon;
  String? image;
  Function() onclick;
  bool isNext=true;

  clsNextAndSkipButtonShap(
      {super.key,
      required this.title,
      this.image,
      this.icon,
      required this.onclick,
      this.isNext=true});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onclick,
        child: Container(
          child: Row(
            children: [

              if(!isNext)...[
                if (this.icon != null)...[
                  Icon(
                    this.icon,
                    size: 14,
                    color: clsColors.secondary,
                  )
        ]

                else...[
                  Image.asset(
                    image!,
                    height: 14,
                    width: 14,
                    color: clsColors.secondary,
                  ),
                ]
              ],

              Text(
                this.title,
                style: clsFontStyle.bloodStyle
                    .copyWith(color: clsColors.secondary, fontSize: 14),
              ),

            if(isNext)...[
              if (this.icon != null)
                Icon(
                  this.icon,
                  size: 14,
                  color: clsColors.secondary,
                )
              else
                Image.asset(
                  image!,
                  height: 14,
                  width: 14,
                  color: clsColors.secondary,
                ),
            ]

            ],
          ),
        ),
      ),
    );
  }
}
