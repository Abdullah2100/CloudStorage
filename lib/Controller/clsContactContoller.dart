import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
class clsContactController extends ChangeNotifier {
  static const platform = MethodChannel('contactPicChannel');

  List<String>  phoneHolder=<String>[] ;
   void collectPhoneFromContact()async{
    try{
      final result = await platform.invokeMethod<List<String>>('getBatteryLevel');
      phoneHolder = result??<String>[];
    }catch(e){
      print("this Eror"+e.toString());
    }
  }

}