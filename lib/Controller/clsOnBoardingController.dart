
import 'package:flutter/cupertino.dart';
import 'package:cloudapp/Helper/clsImages.dart';

import '../Modle/clsOnBoardData.dart';
class clsOnBoardingController extends ChangeNotifier {

   int _currentIndex=0;


   int get currentIndex =>_currentIndex;

     void increaseIndex(){
      if(_currentIndex<2) {
        _currentIndex++;
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
