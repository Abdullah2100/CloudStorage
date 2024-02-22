class clsLoginModle{
  String? _email;
  String? _password;
  String? _phone;


  String? get email => _email;

  String? get password => _password;

  String? get phone => _phone;

  clsLoginModle( String? emails, String? passwords,
      String? phones) {
    this._email = emails;
    this._phone = phones;
    this._password = passwords;
  }


  clsLoginModle.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['password'] = this._password;
    data['phone'] = this._phone;
    return data;
  }
}