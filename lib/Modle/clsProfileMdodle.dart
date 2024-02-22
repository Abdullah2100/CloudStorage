class clsProfileModle {
  int? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _code;
  String? _cupon;
  String? _idNumber;
  String? _typeUser;
  String? _resetToken;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id=>_id;
  String? get name =>_name;
  String? get email =>_email;
  String? get phone =>_phone;
  String? get code =>_code;
  String? get cupon =>_cupon;
  String? get idNumber =>_idNumber;
  String? get typeUser =>_typeUser;
  String? get resetToken =>_resetToken;
  String? get emailVerifiedAt =>_emailVerifiedAt;
  String? get createdAt =>_createdAt;
  String? get updatedAt =>_updatedAt;

  clsProfileModle(
      { required int id,
        required String name,
        required String email,
        required String  phone,
        required String code,
        required String cupon,
        required String idNumber,
        required String typeUser,
        required String resetToken,
        required String emailVerifiedAt,
        required String createdAt,
        required String  updatedAt});

  clsProfileModle.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _code = json['code'];
    _cupon = json['cupon'];
    _idNumber = json['id_number'];
    _typeUser = json['type_user'];
    _resetToken = json['reset_token'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['code'] = this._code;
    data['cupon'] = this._cupon;
    data['id_number'] = this._idNumber;
    data['type_user'] = this._typeUser;
    data['reset_token'] = this._resetToken;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}