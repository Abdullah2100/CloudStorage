import 'package:cloudapp/Helper/clsColors.dart';
import 'package:cloudapp/Helper/clsFontStyle.dart';
import 'package:flutter/material.dart';

class clsButtonsheppItmeShap extends StatelessWidget {
  Function() onClick;
  String image;
  String title;
  int itumIndex;
  int currentIndex;

  clsButtonsheppItmeShap(
      {super.key,
      required this.onClick,
      required this.image,
      required this.title,
      required this.currentIndex,
      required this.itumIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onClick,
        child: Container(
          height: 50,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                this.image,
                height: 24,
                width: 24,
                color: this.currentIndex == this.itumIndex
                    ? clsColors.primary
                    : clsColors.gray,
              ),
              if(this.currentIndex == this.itumIndex)
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    this.currentIndex == this.itumIndex?this.title:"",
                    style: clsFontStyle.regularStyle
                        .copyWith(color: clsColors.primary, fontSize: 12),
                  ),
                )
            ],
          ),
        ));
  }
}
