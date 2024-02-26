import 'dart:io';

import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Modle/clsProfileMdodle.dart';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class clsProfileContoller extends ChangeNotifier{

   clsProfileModle? profile;

  void getProfileData()async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.getprofileData_url;
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
        profile = clsProfileModle.fromJson(result.data['data'][0]);
      }
      print(profile);

    } on DioException catch(e) {
      String message = e.response?.data['message'] ?? "";
    }
  }






}