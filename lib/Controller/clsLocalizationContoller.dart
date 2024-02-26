import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:flutter/cupertino.dart';

class clsLocalizationContoller extends ChangeNotifier{



  Locale? _local=Locale('en');

  Locale? get local => _local;

  bool _isChageLanguage =false;
  bool get isChagneLoanguage => _isChageLanguage;



  void loadLocalization()async{
    String? localCode = await clsShardPrefHelper.getDataFromShared(clsShardName.localization_shard) as String?;
    switch(localCode){
      case "en":{
        _local = Locale('en');
      }
      default:{
        _local = Locale('ar');

      }
    }
    notifyListeners();
  }

  void updateLocalization(){

    _isChageLanguage = true;
    notifyListeners();

    switch(_local==Locale('ar')){
      case true:{
        _local = Locale('en');
        clsShardPrefHelper(clsShardName.localization_shard).SaveDataToShard("en");
      }
      default:{
        _local = Locale('ar');
        clsShardPrefHelper(clsShardName.localization_shard).SaveDataToShard("ar");
      }
    }
    Future.delayed(Duration(seconds: 3));
    _isChageLanguage = false;
    notifyListeners();
  }




}