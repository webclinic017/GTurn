// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String status;
  String message;
  Data data;

  Login({this.status, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
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
  String id;
  String userName;
  String email;
  String profileImg;
  String withdraw;
  String total;
  String availWithdraw;
  String lastLogin;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.userName,
        this.email,
        this.profileImg,
        this.withdraw,
        this.total,
        this.availWithdraw,
        this.lastLogin,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    profileImg = json['profile_img'];
    withdraw = json['withdraw'];
    total = json['total'];
    availWithdraw = json['avail_withdraw'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['profile_img'] = this.profileImg;
    data['withdraw'] = this.withdraw;
    data['total'] = this.total;
    data['avail_withdraw'] = this.availWithdraw;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
