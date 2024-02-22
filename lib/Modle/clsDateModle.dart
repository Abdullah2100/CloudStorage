class clsDateModle{
  String _year= "";
  String _month= "";
  String _day= "";
  String get year => _year;
  String get month => _month;
  String get day => _day;

  clsDateModle(List<String>lDate){
    if(lDate.isNotEmpty){
      _year = lDate[0];
      _month = lDate[1];
      _day = lDate[2];
    }
  }

}