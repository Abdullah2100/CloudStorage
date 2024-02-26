import 'package:cloudapp/Modle/clsContactTypModle.dart';

class clsContactModle {
  int? _id = 0;
  String? _name = "";
  String? _number = "";
  String? _createdAt = "";
  clsContactTypModle? _contactTypeModle=null;

  bool? _isStarNumber = false;

  String? _typeId = null;

  int? get id => _id;

  String? get typeId => _typeId;

  String? get name => _name;

  String? get number => _number;

  bool? get isStarNumber => _isStarNumber;

  clsContactTypModle? get contactTypeModle => _contactTypeModle;


  String? get createdAt => _createdAt;
  void isStartNumberSetter(){
    _isStarNumber = _isStarNumber!=null?!_isStarNumber!:null;
  }
  void setName(String? name){
    _name = name;
  }
  void setNumber(String? number){
    _number = number;
  }
  void setTypID(String? typeID){

    _typeId = typeID;
  }

  clsContactModle(
    int? id,
    String? name,
    String? number,
    String? contactTypeID,
    bool isStrNumber,
    String? createdAt,
    clsContactTypModle?  contactTypeModle
  ) {
    this._id = id;
    this._name = name;
    this._number = number;
    this._typeId = contactTypeID;
    this._createdAt = createdAt;
    this._isStarNumber= isStrNumber;
    this._contactTypeModle= contactTypeModle;
  }

  clsContactModle.fromJson(Map<String, dynamic> json,{bool hasTyping=true}) {
    _name = json['name'];
    _number = json['number'];
    if(json['distinction_between']!=null) _isStarNumber = json['distinction_between']=="false"?false:true;
    if(json['type_id']!=null)_typeId = json['type_id'];
    _createdAt = json['created_at'];
    _id = json['id'];
    if(hasTyping) {
      if (json['typing'].length > 0) {
        _contactTypeModle = clsContactTypModle.fromJson(json['typing']);
      }
    }
  }
}
