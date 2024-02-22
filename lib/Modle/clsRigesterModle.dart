import 'dart:convert';

class clsRigesterModle {
  String _name="";
  String? _email;
  String _password="";
  String? _phone;

  String get name => _name;

  String? get email => _email;

  String get password => _password;

  String? get phone => _phone;

  clsRigesterModle(String names, String? emails, String passwords,
      String? phones) {
    this._name = names;
    this._email = emails;
    this._phone = phones;
    this._password = passwords;
  }


  clsRigesterModle.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['password'] = this._password;
    data['phone'] = this._phone;
    return data;
  }

}