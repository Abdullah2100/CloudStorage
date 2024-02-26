import 'dart:io';

import 'package:cloudapp/Helper/clsImages.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsCategoryModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum enCategoryFilter {
  Expense,
  FileDocument,
  LinksSite,
  MemosNotes,
  Messages,
  NamePassword,
  NumberName,
  OrderMarket
}

class clsCategoryController extends ChangeNotifier {

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


  void getAllCategory() async {
    String url = clsNetworkCall.pasd_url + clsNetworkCall.getcategory_url;
    // String? token = await clsShardPrefHelper.getDataFromShared(
    //     clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??""??"";
    print("this the token : ${token ?? 0} =====================");
    var dio = Dio();
    try {
      Response result = await dio.get(
          url, options: Options(headers: {
        HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      if (result.statusCode == 200) {
        List<dynamic> jsCategory = result.data['0']['data'];
        jsCategory.forEach((value) {
          cateoryList.add(clsCategoryModle.fromJson(value));
        });
      }
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "";
    }
  }


}