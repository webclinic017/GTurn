import 'dart:async';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:gturn/HomeScreen.dart';
import 'package:gturn/LogInScreen.dart';
import 'package:gturn/SpecialListPage.dart';
import 'package:gturn/StartedPage.dart';
import 'package:gturn/model/splashScreenModel.dart';
import 'package:gturn/popupMenu.dart';
import 'RegistrationScreen.dart';
import 'constant/Widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<User> futureUser;
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String auth_token = "auth_token";
  final String app_version = "app_version";
  @override
  void initState() {

    super.initState();
   futureUser = fetchData();
  //   Timer(
  //     Duration(seconds: 0),
  //         () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => HomeScreen(),
  //       ),
  //     ),
  //   );
  }

  Future<User> fetchData() async {
    final String apiUrl = "https://globytex.com/g_turns/api/app/v1/application/version_check";
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    Map data = {
      "username": "rajesh",    "password": "1",   "app_platform": "android",   "app_version": "1.0"
    };
    var body = json.encode(data);
    final response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    if(response.statusCode == 200 ){

      final String responseString = response.body;
      print(responseString);
      Map<String, dynamic> map = jsonDecode(responseString);
      String status = map['status'];
      String token = map['token'];
      Map dataList = map["data"];
      String version = dataList["version"];
      String force = dataList["force"];
      String service_status = dataList["service_status"];
      String maintenance_image_url = dataList["maintenance_image_url"];
      String staging_webservice_url = dataList["staging_webservice_url"];
      String live_webservice_url = dataList["live_webservice_url"];
      String dev_webservice_url = dataList["dev_webservice_url"];
      String base_url = dataList["base_url"];
      String app_store_url = dataList["app_store_url"];
      print(status);
      print(version);
      print(token);
      if(status == 'true'){
        prefs.setString(this.auth_token, token);
        prefs.setString(this.app_version, version);

        if(version != '1.0'){

          showDialog(context: context,
              builder: (BuildContext context){
                return CustomDialogBox(
                  title: "Version Down",
                  descriptions: "Update Now!",
                  text: "Later",
                );
              }
          );
        }else if(force != 0){

        }else if(service_status != 'true'){
          showDialog(context: context,
              builder: (BuildContext context){
                return CustomDialogBox(
                  title: "Server Maintain",
                  descriptions: "please Use me Later",
                  text: "Later",
                );
              }
          );
        }else{

        }
        Timer(
          Duration(seconds: 2),
              () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          ),
        );

      }
    }
    else{
      throw Exception('Failed');
    }
  }
  @override
  Widget build(BuildContext con) {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   Timer(Duration(seconds: 5), () async {
    //     setState(() {
    //       Route route =
    //           MaterialPageRoute(builder: (context) => RegistrationScreen());
    //       Navigator.pushReplacement(context, route);
    //     });
    //   });
    // });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_image.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sh30,
              Text(
                "Welcome\nto G Turns",
                style: splashHeading,
                textAlign: TextAlign.center,
              ),
              sh10,
              liteboldwhitetext16("The Better Place to Start the Trade!")
            ],
          ),
        ),
      ),
    );
  }
}
