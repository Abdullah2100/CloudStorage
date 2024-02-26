
import 'package:flutter/cupertino.dart';
class clsOnBoardingController extends ChangeNotifier {

   int _currentIndex=0;


   int get currentIndex =>_currentIndex;

     void increaseIndex({int index =1 }){
      if(_currentIndex<2) {
        _currentIndex+=index;
        notifyListeners();
      }

    }
   void decreasing() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  }
