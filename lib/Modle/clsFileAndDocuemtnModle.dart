class clsFileAndDocuemtnModle {
  int? _id = 0;
  String? _name = "";
  String? _createdAt = "";
  String? _fileUrl="";
  bool? _isStarNumber = false;

  String? _typeId = null;

  int? get id => _id;

  String? get typeId => _typeId;

  String? get name => _name;

  String? get fileUrl => _fileUrl;


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

  clsFileAndDocuemtnModle(
    int? id,
    String? name,
    String? url,
    String? contactTypeID,
    bool isStrNumber,
    String? createdAt,
  ) {
    this._id = id;
    this._name = name;
    this._fileUrl = url;
    this._typeId = contactTypeID;
    this._createdAt = createdAt;
    this._isStarNumber= isStrNumber;
  }

  clsFileAndDocuemtnModle.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    if(json['distinction_between']!=null) _isStarNumber = json['distinction_between']=="false"?false:true;
    if(json['type_id']!=null)_typeId = json['type_id'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _fileUrl = json['url'];
  }
}
