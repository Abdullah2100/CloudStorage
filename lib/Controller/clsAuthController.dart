import 'dart:io';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsRigesterModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';

import '../Modle/clsLoginModle.dart';
import 'package:dio/dio.dart';

class clsAuthController extends ChangeNotifier {
  bool _isStartLoading = false;
 bool? _isValideAuth = true;
  bool get isStartLoading => _isStartLoading;
  bool? get isValideAuth => (clsTokentHolder.token!=null?true:_isValideAuth);

  Future<void> createNewUser(clsRigesterModle data, Function handler,
      {isPhone = false}) async {
    String url = clsNetworkCall.pasd_url + clsNetworkCall.rigister_url;
    var dio = Dio();
    var body = FormData.fromMap({
      'name': data.name,
      if (data.email != null) 'email': data.email!,
      if (data.phone != null) 'phone': data.phone!,
      'password': data.password
    });
    try {
      _isStartLoading = true;
      notifyListeners();

      Response result = await dio.post(url.trim(), data: body);
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;

      if (result.statusCode == 200&&state==true) {
        String? token = result.data['data']['token'];
        String? copune = result.data['data']['user']['cupon'];
       clsTokentHolder.token= token??"";
        _isStartLoading = false;
        notifyListeners();

        if (token != null&&copune!=null) {
          clsShardPrefHelper(clsShardName.token_shard).SaveDataToShard<String>(token);
          clsShardPrefHelper(clsShardName.cupune_shard).SaveDataToShard<String>(copune);
        }
        handler(message, true);
      } else {
        handler("", false);
      }

    } on DioException catch (e) {
      String message = e.response?.data['message']??"";
      _isStartLoading = false;
      notifyListeners();
      handler(message, false);

    }
  }

  void loginUser(clsLoginModle data, Function handler) async {
    String url = clsNetworkCall.pasd_url + clsNetworkCall.login_url;
    var dio = Dio();
    var body = FormData.fromMap({
      if (data.email != null) "email": data.email.toString(),
      if (data.phone != null) "phone": data.phone.toString(),
      "password": data.password.toString()
    });

    try {
      _isStartLoading = true;
      notifyListeners();

      var result = await dio.post(url.trim(), data: body);

      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      _isStartLoading = false;
      notifyListeners();

      if (result.statusCode == 200 && state == true) {
        String? token = result.data['data']['token'];
        String? copune = result.data['data']['user']['cupon'];
       clsTokentHolder.token=token??"";
        if(token!=null&&copune!=null){
          clsShardPrefHelper(clsShardName.token_shard).SaveDataToShard<String>(token);
          clsShardPrefHelper(clsShardName.cupune_shard).SaveDataToShard<String>(copune);

        }
        handler(message, true);
      } else {
        handler(message ?? "", false);
      }

    } on DioException catch (e) {
      String message = e.response?.data['message']??"";
      _isStartLoading = false;
      notifyListeners();
      handler(message, false);
    }
  }



  Future<bool> isValideToken()async{
    bool isValideToken =true;
    String url = clsNetworkCall.pasd_url+clsNetworkCall.getprofileData_url;
    String token = (await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?) ??"";
   clsTokentHolder.token= token;
    var dio = Dio();
    try{

      Response result =await dio.get(
          url,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer $token",
        Headers.acceptHeader: 'application/json',
      }));
      if(result.statusCode==401) {
        isValideToken = false;
        isValideToken = false;
      }
      notifyListeners();

    } on DioException catch(e){
      isValideToken = false;

      if(e.response?.statusCode==401){
        isValideToken = false;
      }
    }
    _isValideAuth = isValideToken;
    notifyListeners();

    return isValideToken;
  }



}
