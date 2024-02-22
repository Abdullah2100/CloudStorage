import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsRigesterModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';

import '../Modle/clsLoginModle.dart';
import 'package:dio/dio.dart';

class clsAuthController extends ChangeNotifier {
  bool isStartLoading = false;

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
      isStartLoading = true;
      notifyListeners();

      Response result = await dio.post(url.trim(), data: body);
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;

      if (result.statusCode == 200&&state==true) {
        String? token = result.data['data']['token'];
        String? copune = result.data['data']['user']['cupon'];
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
      isStartLoading = true;
      notifyListeners();

      var result = await dio.post(url.trim(), data: body);

      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      if (result.statusCode == 200 && state == true) {
        String? token = result.data['data']['token'];
        String? copune = result.data['data']['user']['cupon'];

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
      handler(message, false);    }
    notifyListeners();
  }

  void changeLoadingState(bool state) {
    isStartLoading = false;
    notifyListeners();
  }
}
