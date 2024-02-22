import 'dart:io';

import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class clsCategoryController extends ChangeNotifier{

  List<clsCategoryModle> cateoryList = <clsCategoryModle>[];

  List<String>categoryImage = <String>[
    clsImages.phonse,
    clsImages.link,
    clsImages.userAndPassword,
    clsImages.fileAndAssetIcon,
    clsImages.chate,
    clsImages.schesual,
    clsImages.shopping,
    clsImages.booket

  ];



  void getAllCategory(Function handler)async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.category_url;
    String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    var dio = Dio();
    try{
      Response result =await dio.get(
          url,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      if(result.statusCode==200){
       List<dynamic> jsCategory = result.data['0'];
       jsCategory.forEach((element) {
         cateoryList.add(clsCategoryModle.fromJson(element));
       });
      }

    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      handler(message, false);    }

  }


}