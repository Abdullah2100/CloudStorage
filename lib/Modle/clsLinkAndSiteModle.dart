class clsLinkAndSiteModle {
  int? _id = 0;
  String? _name = "";
  String? _createdAt = "";
  String? _url="";
  bool? _isStarNumber = false;

  String? _typeId = null;

  int? get id => _id;

  String? get typeId => _typeId;

  String? get name => _name;

  String? get url => _url;


  bool? get isStarNumber => _isStarNumber;

  String? get createdAt => _createdAt;
  void isStartNumberSetter(){
    _isStarNumber = _isStarNumber!=null?!_isStarNumber!:null;
  }
  void setName(String? name){
    _name = name;
  }

  void setTypID(String? typeID){

    _typeId = typeID;
  }

  clsLinkAndSiteModle(
    int? id,
    String? name,
    String? url,
    String? contactTypeID,
    bool isStrNumber,
    String? createdAt,
  ) {
    this._id = id;
    this._name = name;
    this._url = url;
    this._typeId = contactTypeID;
    this._createdAt = createdAt;
    this._isStarNumber= isStrNumber;
  }

  clsLinkAndSiteModle.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    if(json['distinction_between']!=null) _isStarNumber = json['distinction_between']=="false"?false:true;
    if(json['type_id']!=null)_typeId = json['type_id'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _url = json['url'];
  }
}
