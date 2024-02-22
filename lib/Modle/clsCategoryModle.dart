class clsCategoryModle {
  int? _id;
  String? _name;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  int? get  id => _id;
  String? get name =>_name;
  String? get deletedAt =>_deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  clsCategoryModle(
      int? id, String? name, String? deletedAt, String? createdAt, String? updatedAt){

    _id = id;
    _name = name;
    _deletedAt = createdAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  clsCategoryModle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}