import 'package:flutter/cupertino.dart';

class clsCarsuolController extends ChangeNotifier{
  int index =0;

  void changeInde(int number){
    index=number;
    notifyListeners();
  }
}