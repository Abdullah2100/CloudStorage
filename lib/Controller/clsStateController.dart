import 'package:flutter/cupertino.dart';

class clsStateController extends ChangeNotifier{
  bool _isChageLanguage =false;
  bool _isLogin =false;

  bool get isChagenLanguage => _isChageLanguage;

  bool get isChagneLoanguage => _isChageLanguage;

  void changeLanguseState(){
    _isChageLanguage = !_isChageLanguage;
    notifyListeners();
  }

}