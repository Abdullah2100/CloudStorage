class clsCategoryModle {
  int? _id;
  int? _totalSpace;
  int? _usedSpace;
  late String _name;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  int? get  id => _id;
  int? get  totalSpace => _totalSpace;
  int? get  useSpace => _usedSpace;
  String get name =>_name;
  String? get deletedAt =>_deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  clsCategoryModle(
      int? id, String name, String? deletedAt, String? createdAt, String? updatedAt,int?totalSpace,int?usedSpace){

    _id = id;
    _totalSpace = totalSpace;
    _usedSpace = usedSpace;
    _name = name;
    _deletedAt = createdAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  clsCategoryModle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _totalSpace =int.parse(json['total_space']);
    _usedSpace = int.parse(json['space']);
    _name = json['name'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['total_space'] = this._id;
    data['id'] = this._id;
    data['name'] = this._name;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}