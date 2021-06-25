import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.data,
    this.token,
  });

  String status;
  Data data;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    this.version,
    this.force,
    this.serviceStatus,
    this.maintenanceImageUrl,
    this.stagingWebserviceUrl,
    this.liveWebserviceUrl,
    this.devWebserviceUrl,
    this.baseUrl,
    this.appStoreUrl,
  });

  String version;
  String force;
  String serviceStatus;
  String maintenanceImageUrl;
  String stagingWebserviceUrl;
  String liveWebserviceUrl;
  String devWebserviceUrl;
  String baseUrl;
  String appStoreUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    version: json["version"],
    force: json["force"],
    serviceStatus: json["service_status"],
    maintenanceImageUrl: json["maintenance_image_url"],
    stagingWebserviceUrl: json["staging_webservice_url"],
    liveWebserviceUrl: json["live_webservice_url"],
    devWebserviceUrl: json["dev_webservice_url"],
    baseUrl: json["base_url"],
    appStoreUrl: json["app_store_url"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "force": force,
    "service_status": serviceStatus,
    "maintenance_image_url": maintenanceImageUrl,
    "staging_webservice_url": stagingWebserviceUrl,
    "live_webservice_url": liveWebserviceUrl,
    "dev_webservice_url": devWebserviceUrl,
    "base_url": baseUrl,
    "app_store_url": appStoreUrl,
  };
}
