class clsContactModle{
  int _id =0;
  String _name ="";
  String _number ="";
  String _numberCategory ="";
  bool  _isStarNumber =false;

  int  get id => _id;
  String   get name => _name;
  String   get number => _number;
  String   get numberCategory => _numberCategory;
  bool   get isStarNumber => _isStarNumber;

  clsContactModle(int id,String name ,String number,String numberCategory,bool isStrNumber)
  {
    this._id = id;
    this._name = name;
    this._number = number;
    this._numberCategory = numberCategory;

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['number'] = this._number;
    data['type'] = this._numberCategory;
    data['distinction_between'] = this._isStarNumber;
    return data;
  }

}