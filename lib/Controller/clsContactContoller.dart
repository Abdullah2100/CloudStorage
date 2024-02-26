import 'dart:io';

import 'package:cloudapp/Controller/clsCategoryController.dart';
import 'package:cloudapp/Helper/clsNetworkCall.dart';
import 'package:cloudapp/Helper/clsShardName.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:cloudapp/Util/clsShardPrefHelper.dart';
import 'package:cloudapp/Util/clsTokenHolder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
class clsContactController extends ChangeNotifier {

  List<clsContactModle> _contactList = <clsContactModle>[];
  List<clsContactModle> _searchList = <clsContactModle>[];
  List<clsContactModle> _searchListDeligate = <clsContactModle>[];


  List<clsContactModle> _contactFilterListr = <clsContactModle>[];

  List<clsContactModle> get contactList =>_searchList+_contactList;
  List<clsContactModle> get contactFilterList =>_contactFilterListr;
  List<clsContactModle> get searchListDeligate =>_searchListDeligate;


  int _previuseFilterNumber=0;

  bool _isModify = false;
  bool _isLoading = false;
  bool _isFilter = false;
  bool _isPagination = false;
  bool get isModify => _isModify;
  bool get loading => _isLoading;
  bool get isFiltter => _isFilter;
  bool get isPagination => _isPagination;


  String _previuseSearch ="";
  int? _collectIndex;
  int? get collectIndex => _collectIndex;


  void getFilter(int filterNumber){
   if(_previuseFilterNumber!=filterNumber) {
     switch (filterNumber) {
       case 0:{
         _getAllFilter();
       }
       case 1:
         {
           _getSpicialNumberFilter();
         }
       default:
         {
           _getRepeatedNumber();
         }
     }
     _previuseFilterNumber = filterNumber;
   }
  }

  void _getSpicialNumberFilter()async{
    // if(_contactList.length!=contactList.length){
      _isModify =true;
      _isFilter =true;
      notifyListeners();
      _contactFilterListr.clear();
      _contactList.forEach((element) {
        if(element.isStarNumber==true){
          _contactFilterListr.add(element);
        }
      });
      await  Future.delayed(Duration(seconds: 2));

      _isModify=false;
      notifyListeners();
    // }
  }

  void _getRepeatedNumber()async{
    _isModify =true;
    _isFilter =true;
    notifyListeners();
    _contactFilterListr.clear();
    _contactList.forEach((element) {
      if(_contactList.where((e) => e.name ==element.name).toList().length>1){
        _contactFilterListr.add(element);
      }
    });
    await  Future.delayed(Duration(seconds: 2));

    _isModify=false;
    notifyListeners();
    // }
  }



  void _getAllFilter()async{
    _isModify =true;
    _isFilter =true;
    notifyListeners();
    _contactFilterListr.clear();
    await  Future.delayed(Duration(seconds: 1));
    _isModify=false;
    _isFilter =false;
    notifyListeners();
    // }
  }


/*
  void selectContact(int index ){
    _collectIndex = index;
    notifyListeners();
  }
*/
  void isPageLoading(){
    _isLoading=true;
    notifyListeners();
  }



  void  addnewContact(clsContactModle _contact ,int cateegoryID , Function handler )async{

  String url = clsNetworkCall.pasd_url + clsNetworkCall.addContact_url;
  // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
  String token =clsTokentHolder.token??""??"";
  var body = FormData.fromMap({

    'name': _contact.name,
    'number':
    _contact.number,
    if(_contact.typeId != null) 'type_id': _contact.typeId,
    'distinction_between': false,
    'catigory_id': cateegoryID
  });
  var dio = Dio();
  try {
    _isFilter=false;
    _isModify = true;
    notifyListeners();
    Response result = await dio.post(
        url, data: body, options: Options(headers: {
      HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
      Headers.acceptHeader: 'application/json',
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
    String message = e.response?.data['error']['number'][0]?? "";
    _isModify = false;
    notifyListeners();

    handler(message, false);
  }

  }



  void  updateContact(clsContactModle _contact ,int cateegoryID , Function handler )async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.updateContact_url;
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??"";
    var body = FormData.fromMap({
      'id':_contact.id,
      if(_contact.name!=null)'name': _contact.name,
      if(_contact.number!=null)'number': _contact.number,
      if(_contact.typeId!=null)'type_id': _contact.typeId,
      if(_contact.isStarNumber!=null)'distinction_between': _contact.isStarNumber,
    });
    var dio = Dio();
    try{
          _isFilter=false;
      _isModify =true;
      notifyListeners();
      Response result =await dio.post(
          url, data: body,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      _isModify=false;
      notifyListeners();
      if(result.statusCode==200&&state==true){

        handler(message,true);
      }else{

        handler(message,false);

      }

    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      _isModify=false;
      notifyListeners();
      handler(message, false);

    }
  }


  void  deleteContact(int contactID , Function handler )async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.deleteContact_url+contactID.toString();
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??""??"";

    var dio = Dio();
    try{
      _isModify =true;
      notifyListeners();
      Response result =await dio.get(
          url, options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      String? message = result.data["message"];
      bool state = result.data['status'] ?? false;
      _isModify=false;
      _isLoading=false;
      notifyListeners();
      if(result.statusCode==200&&state==true){

        handler(message,true);
      }else{

        handler(message,false);

      }

    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      _isModify=false;
      _isLoading=false;
      notifyListeners();
      handler(message, false);

    }
  }



  void getContacts()async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.getconatct_url+1.toString();
    // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
    String token =clsTokentHolder.token??""??"";
    var dio = Dio();
    try{
      // _isLoading=true;
      // notifyListeners();
      Response result =await dio.get(
          url,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      bool status = result.data['status']??false;
      if(result.statusCode==200&& status ==true) {
        List<dynamic> jsCategory = result.data['data'];
        if(jsCategory.length>0){
          _contactList = [];
          for(int i=0;i<jsCategory.length;i++){
            _contactList.add(clsContactModle.fromJson(jsCategory[i]));
          }
        }

      }
      _isLoading=false;
      notifyListeners();
    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      print("this error is "+message);
      _isLoading=false;
      notifyListeners();
      // handler(message, false);
    }
  }


void clearCheach(){
    _previuseSearch="";
    _searchListDeligate.clear();
}

 Future <void> getContactAndNumberBySearch(String name)async {

    if (name.isNotEmpty&&name!=_previuseSearch) {
      print("query start =              = =  == =  ==== ==");
      String url = clsNetworkCall.pasd_url + clsNetworkCall.generalSearch_url;
      // String? token = await clsShardPrefHelper.getDataFromShared(clsShardName.token_shard) as String?;
      String token =clsTokentHolder.token??""??"";
      var body = FormData.fromMap({
        'model': enCategoryFilter.NumberName.name,
        if(name.isNotEmpty)'text': name,

      });
      var dio = Dio();
      try {
        Response result = await dio.post(
            url, data: body, options: Options(headers: {
          HttpHeaders.authorizationHeader: "Bearer " + token.toString(),
          Headers.acceptHeader: 'application/json',
        }));
        bool status = result.data['status'] ?? false;
        if (result.statusCode == 200 && status == true) {
          List<dynamic> jsCategory = result.data['data'];
          if (jsCategory.length > 0) {
            _searchListDeligate = [];
            for (int i = 0; i < jsCategory.length; i++) {

              _searchListDeligate.add(clsContactModle.fromJson(jsCategory[i],hasTyping: false));
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


  bool addingSeachItemToSearchList(clsContactModle item){

    if(_searchList.where((element) => element.id == item.id).isEmpty){
      _searchList.add(item);
      return true;
    }
    return false;

  }

  void getContactByPagination(int index)async{
    String url = clsNetworkCall.pasd_url+clsNetworkCall.getconatct_url+index.toString();
    String token =clsTokentHolder.token??""??"";
    var dio = Dio();
    try{
      _isPagination=true;
      notifyListeners();
      Response result =await dio.get(
          url,options:Options(headers: {
        HttpHeaders.authorizationHeader:"Bearer "+ token.toString(),
        Headers.acceptHeader: 'application/json',
      }));
      bool status = result.data['status']??false;
      if(result.statusCode==200&& status ==true) {
        List<dynamic> jsCategory = result.data['data'];
        if(jsCategory.length>0){
          for(int i=0;i<jsCategory.length;i++){
            _contactList.add(clsContactModle.fromJson(jsCategory[i]));
          }
        }

      }
      _isPagination=false;
      notifyListeners();
    }on DioException catch(e){
      String message = e.response?.data['message']??"";
      print("this error is "+message);
      _isPagination=false;
      notifyListeners();
    }

  }


}