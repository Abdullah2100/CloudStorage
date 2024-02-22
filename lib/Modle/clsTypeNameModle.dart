class clsTypeNameModle{
  int _id = 0;
  String _name ="";

  int get  id => _id;
  String get name => _name;

  clsTypeNameModle(int id ,String name){
    this._id = id;
    this._name = name;
  }
  clsTypeNameModle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }


}