import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());


class ProfileModel {
  String status;
  String message;
  Data data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String firstName;
  String lastName;
  String mobile;
  String email;
  String profileImg;
  String accUsername;
  String accPsw;
  String accAmt;
  String amtLimit;
  String withdraw;
  String total;
  String availWithdraw;
  String lastLogin;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.profileImg,
        this.accUsername,
        this.accPsw,
        this.accAmt,
        this.amtLimit,
        this.withdraw,
        this.total,
        this.availWithdraw,
        this.lastLogin,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    profileImg = json['profile_img'];
    accUsername = json['acc_username'];
    accPsw = json['acc_psw'];
    accAmt = json['acc_amt'];
    amtLimit = json['amt_limit'];
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
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['profile_img'] = this.profileImg;
    data['acc_username'] = this.accUsername;
    data['acc_psw'] = this.accPsw;
    data['acc_amt'] = this.accAmt;
    data['amt_limit'] = this.amtLimit;
    data['withdraw'] = this.withdraw;
    data['total'] = this.total;
    data['avail_withdraw'] = this.availWithdraw;
    data['last_login'] = this.lastLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}