// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

dashboard dashboardFromJson(String str) => dashboard.fromJson(json.decode(str));

String dashboardToJson(dashboard data) => json.encode(data.toJson());

class dashboard {
  String status;
  String message;
  Data data;

  dashboard({this.status, this.message, this.data});

  dashboard.fromJson(Map<String, dynamic> json) {
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
  UserDetails userDetails;
  List<WelcomeSms> welcomeSms;
  List<News> news;
  List<Traders> traders;

  Data({this.userDetails, this.welcomeSms, this.news, this.traders});

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    if (json['welcome_sms'] != null) {
      welcomeSms = new List<WelcomeSms>();
      json['welcome_sms'].forEach((v) {
        welcomeSms.add(new WelcomeSms.fromJson(v));
      });
    }
    if (json['News'] != null) {
      news = new List<News>();
      json['News'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
    if (json['Traders'] != null) {
      traders = new List<Traders>();
      json['Traders'].forEach((v) {
        traders.add(new Traders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails.toJson();
    }
    if (this.welcomeSms != null) {
      data['welcome_sms'] = this.welcomeSms.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
      data['News'] = this.news.map((v) => v.toJson()).toList();
    }
    if (this.traders != null) {
      data['Traders'] = this.traders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String id;
  String userName;
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

  UserDetails(
      {this.id,
        this.userName,
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

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
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
    data['user_name'] = this.userName;
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

class WelcomeSms {
  String mngSms;
  String afternoonSms;
  String ngtSms;
  String smsDate;

  WelcomeSms({this.mngSms, this.afternoonSms, this.ngtSms, this.smsDate});

  WelcomeSms.fromJson(Map<String, dynamic> json) {
    mngSms = json['mng_sms'];
    afternoonSms = json['afternoon_sms'];
    ngtSms = json['ngt_sms'];
    smsDate = json['sms_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mng_sms'] = this.mngSms;
    data['afternoon_sms'] = this.afternoonSms;
    data['ngt_sms'] = this.ngtSms;
    data['sms_date'] = this.smsDate;
    return data;
  }
}

class News {
  String news;
  String newsDate;
  String newsImg;

  News({this.news, this.newsDate, this.newsImg});

  News.fromJson(Map<String, dynamic> json) {
    news = json['news'];
    newsDate = json['news_date'];
    newsImg = json['news_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news'] = this.news;
    data['news_date'] = this.newsDate;
    data['news_img'] = this.newsImg;
    return data;
  }
}

class Traders {
  String title;
  String qty;
  String status;
  String value;

  Traders({this.title, this.qty, this.status, this.value});

  Traders.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    qty = json['qty'];
    status = json['status'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['value'] = this.value;
    return data;
  }
}