
import 'dart:convert';
import 'dart:io';

import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:cloudapp/Modle/clsContactTypModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class clsContactTypController extends ChangeNotifier{

   List<clsContactTypModle> _contactTypeList = <clsContactTypModle>[];

   List<clsContactTypModle> get contactTypeList =>_contactTypeList;


   bool _isModify = false;
   bool get isModify => _isModify;

   int? _collectIndex;
   int? get collectIndex => _collectIndex;

   void selectContactType(int index ){
    if(index!=-1){
     _collectIndex = index;
     notifyListeners();}
   }

   void clearContactTypeIndex(){
     _collectIndex=null;
     notifyListeners();
   }


   Future<bool> addnewContactType(String name )async{
     bool isSeccsfulyAdd =false;
    String url = clsNetworkCall.pasd_url+clsNetworkCall.addContatTyp_url;
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
     String token =clsTokentHolder.token??""??"";
    var body = FormData.fromMap({
      'name': name,
    });
    var dio = Dio();
    try{
      _isModify =true;
      notifyListeners();
      Response result =await dio.post(
          url, data: body,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      if(result.statusCode==200){
        isSeccsfulyAdd=true;
      }

    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      print("this error is "+message);
     // handler(message, false);
    }
    _isModify =true;
    notifyListeners();
    return isSeccsfulyAdd;
  }


   void getTypeNames()async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.getContatTyp_url+1.toString();
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";
    var dio = Dio();
    try{
      Response result =await dio.get(
          url,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      if(result.statusCode==200) {
        List<dynamic> jsCategory = result.data['0']['data'];
        if(jsCategory.length>0){
          _contactTypeList = [];
          for(int i=0;i<jsCategory.length;i++){
            _contactTypeList.add(clsContactTypModle.fromJson(jsCategory[i]));
          }
        }

      }
    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      print("this error is "+message);
      // handler(message, false);
    }



  }



}