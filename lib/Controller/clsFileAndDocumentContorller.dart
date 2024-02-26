import 'dart:io';

import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:cloudapp/Modle/clsFileAndDocuemtnModle.dart';
import 'package:cloudapp/Modle/clsLinkAndSiteModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class clsFileAndDocumentContorller extends ChangeNotifier {
  List<clsLinkAndSiteModle> _linkAndSiteList = <clsLinkAndSiteModle>[];
  List<clsLinkAndSiteModle> _searchList = <clsLinkAndSiteModle>[];
  List<clsLinkAndSiteModle> _searchListDeligate = <clsLinkAndSiteModle>[];

  List<clsLinkAndSiteModle> _linkAndSiteFilterListr =
      <clsLinkAndSiteModle>[];

  List<clsLinkAndSiteModle> get linkAndSiteList =>
      _searchList + _linkAndSiteList;
  List<clsLinkAndSiteModle> get linkAndSiteFilterList =>
      _linkAndSiteFilterListr;
  List<clsLinkAndSiteModle> get searchListDeligate => _searchListDeligate;

  int _previuseFilterNumber = 0;

  bool _isModify = false;
  bool _isLoading = false;
  bool _isFilter = false;
  bool _isPagination = false;
  bool _isModifyInSearch = false;
  bool get isModify => _isModify;
  bool get loading => _isLoading;
  bool get isFiltter => _isFilter;
  bool get isPagination => _isPagination;
  bool get isModifyInSearch => _isModifyInSearch;


  String _previuseSearch = "";
  int? _collectIndex;
  int? get collectIndex => _collectIndex;

  void changeModifyState(){
    _isModifyInSearch=!_isModifyInSearch;
    notifyListeners();
  }

  void getFilter(int filterNumber) {
    if (_previuseFilterNumber != filterNumber) {
      switch (filterNumber) {
        case 0:
          {
            _getAllFilter();
          }

        default:
          {
            _getSpicialGeoLocationFilter();
          }
      }
      _previuseFilterNumber = filterNumber;
    }
  }

  void _getSpicialGeoLocationFilter() async {
    // if(_contactList.length!=contactList.length){
    _isModify = true;
    _isFilter = true;
    notifyListeners();
    _linkAndSiteFilterListr.clear();
    _linkAndSiteList.forEach((element) {
      if (element.isStarNumber == true) {
        _linkAndSiteFilterListr.add(element);
      }
    });
    await Future.delayed(Duration(seconds: 2));

    _isModify = false;
    notifyListeners();
    // }
  }

  
  void _getAllFilter() async {
    _isModify = true;
    _isFilter = true;
    notifyListeners();
    _linkAndSiteFilterListr.clear();
    await Future.delayed(Duration(seconds: 1));
    _isModify = false;
    _isFilter = false;
    notifyListeners();
  }

  void isPageLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void addFileAndDocuemtn(
      clsFileAndDocuemtnModle _fileAndDocumentHolder,File? file, int cateegoryID, Function handler) async {
    String url = clsNetworkCall.pasd_url + clsNetworkCall.postLinkAndSite_url;
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";
    var body = FormData.fromMap({
      'name': _fileAndDocumentHolder.name,
     if(file!=null)'file': await MultipartFile.fromFile(file.path, filename: file.absolute.path), 
      if (_fileAndDocumentHolder.typeId != null)
      //'type_id': _linkAndSiteHolder.typeId,
      //'distinction_between': false,
      'catigory_id': cateegoryID
    });
    var dio = Dio();
    try {
      _isFilter = false;
      _isModify = true;
      notifyListeners();
      Response result = await dio.post(url,
          data: body,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
            Headers.acceptHeader: 'multipart/form-data',
          }));
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;

      if (result.statusCode == 200 && state == true) {
        handler(message, true);
      } else {
        handler(message, false);
      }
      _isModify = false;
      notifyListeners();
    } on DioException catch (e) {
      String message = e.response?.data['error']['number'][0] ?? "";
      _isModify = false;
      notifyListeners();

      handler(message, false);
    }
  }

  void updateLinkAndList(
      clsLinkAndSiteModle _linkAndSiteHolder, int cateegoryID, Function handler) async {
    String url = clsNetworkCall.pasd_url + clsNetworkCall.updateLinkAndSite_url;
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";
    var body = FormData.fromMap({
      'id': _linkAndSiteHolder.id,
      if (_linkAndSiteHolder.name != null) 'name': _linkAndSiteHolder.name,
      if (_linkAndSiteHolder.typeId != null) 'type_id': _linkAndSiteHolder.typeId,
      if (_linkAndSiteHolder.isStarNumber != null)
        'distinction_between': _linkAndSiteHolder.isStarNumber,
      'catigory_id':cateegoryID
    });
    var dio = Dio();
    try {
      _isFilter = false;
      _isModify = true;
      notifyListeners();
      Response result = await dio.post(url,
          data: body,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
            Headers.acceptHeader: 'application/json',
          }));
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      _isModify = false;
      notifyListeners();
      if (result.statusCode == 200 && state == true) {
        handler(message, true);
      } else {
        handler(message, false);
      }
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "";
      _isModify = false;
      notifyListeners();
      handler(message, false);
    }
  }

  void deleteLinkAndList(int contactID
      , Function handler) async {
    String url = clsNetworkCall.pasd_url +
        clsNetworkCall.deleteLinkAndSite_url +
        contactID.toString();
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";

    var dio = Dio();
    try {
      _isModify = true;
      notifyListeners();
      Response result = await dio.get(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
            Headers.acceptHeader: 'application/json',
          }));
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      _isModify = false;
      _isLoading = false;
      notifyListeners();
      if (result.statusCode == 200 && state == true) {
        handler(message, true);
      } else {
        handler(message, false);
      }
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "";
      _isModify = false;
      _isLoading = false;
      notifyListeners();
      handler(message, false);
    }
  }

  void getLinnkAndLists() async {
    String url =
        clsNetworkCall.pasd_url + clsNetworkCall.getLinkAndSite_url + 1.toString();
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";
    var dio = Dio();
    try {
      _isLoading=true;
      notifyListeners();
      Response result = await dio.get(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
            Headers.acceptHeader: 'application/json',
          }));
      bool status = result.data['status'] ?? false;
      if (result.statusCode == 200 && status == true) {
        List<dynamic> jsCategory = result.data['0']['data'];
        if (jsCategory.length > 0) {
          _linkAndSiteList = [];
          for (int i = 0; i < jsCategory.length; i++) {
            _linkAndSiteList.add(clsLinkAndSiteModle.fromJson(jsCategory[i]));
          }
        }
      }
      _isLoading = false;
      notifyListeners();
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "";
      print("this error is " + message);
      _isLoading = false;
      notifyListeners();
      // handler(message, false);
    }
  }

  void clearCheach() {
    _previuseSearch = "";
    _searchListDeligate.clear();
  }

  Future<void> getLinkAndSiteBySearch(String name) async {
    if (name.isNotEmpty && name != _previuseSearch) {
      print("query start =              = =  == =  ==== ==");
      String url = clsNetworkCall.pasd_url + clsNetworkCall.generalSearch_url;
      // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
      String token =clsTokentHolder.token??"";
      var body = FormData.fromMap({
        'model': enCategoryFilter.LinksSite.name,
        if (name.isNotEmpty) 'text': name,
      });
      var dio = Dio();
      try {
        Response result = await dio.post(url,
            data: body,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
              Headers.acceptHeader: 'application/json',
            }));
        bool status = result.data['status'] ?? false;
        if (result.statusCode == 200 && status == true) {
          List<dynamic> jsCategory = result.data['data'];
          if (jsCategory.length > 0) {
            _searchListDeligate = [];
            for (int i = 0; i < jsCategory.length; i++) {
              _searchListDeligate.add(clsLinkAndSiteModle.fromJson(jsCategory[i]));
            }
          }
        }
        _isLoading = false;
      } on DioException catch (e) {
        String message = e.response?.data['message'] ?? "";
        print("this error is " + message);
      }
      _previuseSearch = name;
    }
    else if(name.isEmpty){
      _searchListDeligate.clear();
    }
  }

  bool addingSeachItemToSearchList(clsLinkAndSiteModle item) {
    if (_searchList.where((element) => element.id == item.id).isEmpty) {
      _searchList.add(item);
      return true;
    }
    return false;
  }

  void getLinkAndSiteByPagination(int index) async {
    String url = clsNetworkCall.pasd_url +
        clsNetworkCall.getLinkAndSite_url +
        index.toString();
    String token =clsTokentHolder.token??"";
    var dio = Dio();
    try {
      _isPagination = true;
      notifyListeners();
      Response result = await dio.get(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
            Headers.acceptHeader: 'application/json',
          }));
      bool status = result.data['status'] ?? false;
      if (result.statusCode == 200 && status == true) {
        List<dynamic> jsCategory = result.data['0']['data'];
        if (jsCategory.length > 0) {
          for (int i = 0; i < jsCategory.length; i++) {
            _linkAndSiteList.add(clsLinkAndSiteModle.fromJson(jsCategory[i]));
          }
        }
      }
      _isPagination = false;
      notifyListeners();
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "";
      print("this error is " + message);
      _isPagination = false;
      notifyListeners();
    }
  }


}
