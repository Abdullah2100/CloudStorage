
import 'package:flutter/cupertino.dart';

class  clsDeviceSize{

  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static Size getDeviceSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}