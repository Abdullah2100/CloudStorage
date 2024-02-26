import 'package:shared_preferences/shared_preferences.dart';

class clsShardPrefHelper {

  String _name_key="";

  clsShardPrefHelper(String name){
    _name_key =name;
  }


    Future<bool> isNameSaved()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     bool result =prefs.get(this._name_key)!=null;
     return result;
  }

  void SaveDataToShard<T>( T value)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

   try{
     switch(value.runtimeType){
      case int:{
         prefs.setInt(_name_key,(value as int));
      }
      case double:{
         prefs.setDouble(_name_key,(value as double));
      }
      case String:{
         prefs.setString(_name_key,(value as String));
      }
      default:{
         prefs.setBool(_name_key,(value as bool));

      }

    }
    return;
   }catch(e){
     print("this the error from saving  ${e}");
    return ;
    }
  }

  static Future<Object?> getDataFromShared(String key_name)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      return prefs.get(key_name);
    }catch(e){
      print("this the error from saving  ${e}");
      return null;
    }
  }
static void clearShardData(String key_name)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key_name);
}

}