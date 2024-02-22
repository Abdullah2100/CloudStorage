import 'package:cloudapp/Modle/clsDateModle.dart';

class clsDateShape{
  List<String>lDate=[];

  clsDateShape(String sDate){
    sDate.split("-").forEach((element) {
      lDate.add(element);
    });
  }

   String customDate(){
    if(lDate.isNotEmpty){
      clsDateModle dateModle = clsDateModle(lDate);
      return dateModle.year+'-'+dateModle.month+'-'+dateModle.year;
    }
    return "";
  }

}