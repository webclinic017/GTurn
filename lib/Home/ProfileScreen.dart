import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gturn/LinkYourBrokerScreen.dart';
import 'package:gturn/constant/ConstantClass.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:gturn/model/ProfileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gturn/constant/ColorComman.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  ConstantClass constantClass = new ConstantClass();
  String userName = "userName";
  String userId = "userId";
  String profileImg = "";
  ProfileModel profileValue;
  get http => null;

  logout() async {
    await _auth.signOut();
  }
  Future<ProfileModel> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(constantClass.auth_token);
    //String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJ1c2VybmFtZSI6InJhamVzaCIsImlhdCI6MTYyMjg4MTE0NSwiZXhwIjoxNjIyODk5MTQ1fQ.tbq9N-ZL9Uy3hC0hQ_JUEG7_Wt5jE11OPUWidX6vDtQ";
    String userId = prefs.getString(constantClass.userId);
    print("userId $userId");
    print("userId $token");
    final String apiUrl = "https://globytex.com/g_turns/api/app/v1/user/profile_view/${userId}";


    final response = await http.get(apiUrl,
        headers: {"Authorization":"Bearer $token"},

    );

    print("Bearer$token");
    print(response.statusCode);
    if(response.statusCode == 200 ){

      final String responseString = response.body;
      print(responseString);
      Map<String, dynamic> map = jsonDecode(responseString);

      profileValue=ProfileModel.fromJson(map);


      String status = profileValue.status;
      print(status);
      if(status == 'true'){
setState(() {
  userName = profileValue.data.firstName +profileValue.data.lastName;
  userId = profileValue.data.id;
});

      }else if(status == 'false'){

      }
    }
    else{
      throw Exception('Failed');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   elevation: 2,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: blackcolor,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   title: Text(
        //     "My Profile",
        //     style: TextStyle(
        //       color: blackcolor,
        //     ),
        //   ),
        //   centerTitle: false,
        //   actions: [
        //     Image.asset(
        //       "assets/notification.png",
        //       height: 25,
        //       width: 25,
        //     ),
        //     sw10
        //   ],
        //   backgroundColor: whitecolor,
        // ),

        body: Container(
          color: whitecolor,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/myprofile.png",
                            height: 100,
                            width: 100,
                          ),
                          sw20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$userName",
                                style: TextStyle(
                                    color: blackcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              sh5,
                              Row(
                                children: [
                                  Text(
                                    "User ID :",
                                    style: TextStyle(
                                        color: greycolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  sw5,
                                  Text(
                                    " $userId",
                                    style: TextStyle(
                                        color: bluecolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Column(
                        children: [
                          Text(
                            "50% pending",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          sh10,
                          Stack(
                            children: [
                              Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    color: bluecolor,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    sh10,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 10, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Complete Your Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          sh10,
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: greycolor, width: 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/verify_profile.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    "Verify Profile",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          sh20,
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 0, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LinkYourBroker(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "your account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: greycolor),
                                ),
                                sh10,
                                Text(
                                  "Brokerage Account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: blackcolor),
                                ),
                                sh10,
                                Text(
                                  "Plan (High Return) ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: greycolor),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/backArrow.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "settings & support",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: greycolor),
                              ),
                              sh10,
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: blackcolor),
                              ),
                              sh10,
                              Text(
                                "Edit your App Settings & Role Preferences",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: greycolor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/setting.png",
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Help",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: blackcolor),
                              ),
                              sh10,
                              Text(
                                "View FAQs or Customer Service",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: greycolor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/help.png",
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Give us Feedback",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: blackcolor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/feedback.png",
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: blackcolor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/round-info-button.png",
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Share the App",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: blackcolor),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/share.png",
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh5,
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10, right: 20),
                        child: InkWell(
                          onTap: () {
                            logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: bluecolor),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/logout.png",
                                height: 25,
                                width: 25,
                              ),
                            ],
                          ),
                        )),
                    sh10,
                    Divider(
                      thickness: 3,
                    ),
                    sh10,
                    Center(
                        child: Text(
                      "app version 1.01",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: greycolor),
                    )),
                    sh10,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
