

import 'dart:convert';

Registration registrationFromJson(String str) => Registration.fromJson(json.decode(str));

String registrationToJson(Registration data) => json.encode(data.toJson());

class Registration {
  String status;
  String message;
  Data data;

  Registration({this.status, this.message, this.data});

  Registration.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userName;
  String mobile;
  String dob;
  String password;

  Data({this.userName, this.mobile, this.dob, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    mobile = json['mobile'];
    dob = json['dob'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['password'] = this.password;
    return data;
  }
}