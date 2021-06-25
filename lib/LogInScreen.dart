import 'package:flutter/material.dart';
import 'package:gturn/Home/DashboardScreen.dart';
import 'package:gturn/HomeScreen.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/VerificationScreen.dart';
import 'package:gturn/model/loginModel.dart';
import 'package:gturn/popupMenu.dart';
import 'package:http/http.dart' as http;
import 'constant/Widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/ConstantClass.dart';

Future<Login> futureUser;
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String auth_token = "auth_token";
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  // Initially password is obscure
  bool _obscureText = true;
  ConstantClass constantClass = new ConstantClass();


  Future<Login> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(auth_token);

    final String apiUrl = "https://globytex.com/g_turns/api/app/v1/user/login";


    Map data = {
      "email": _emailController.text,    "password": _passwordController.text,   "app_platform": "android",   "app_version": "1.0"
    };

    var body = json.encode(data);
    final response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json","Authorization":"Bearer $token"},
        body: body
    );
    print(body);
    print("Bearer$token");
    print(response.statusCode);
    if(response.statusCode == 200 ){

      final String responseString = response.body;
      print(responseString);
      Map<String, dynamic> map = jsonDecode(responseString);

      var loginValue=Login.fromJson(map);


      String status = map['status'];
      Map dataList = map["data"];
      String message = map['message'];
      print(status);
      print(message);
      if(status == 'true'){
        prefs.setString(constantClass.userId, loginValue.data.id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeScreen(),
          ),
        );
      }else if(status == 'false'){
        showDialog(context: context,
            builder: (BuildContext context){
              return CustomDialogBox(
                title: "User Not Login",
                descriptions: message,
                text: "Done",
              );
            }
        );
      }
    }
    else{
      throw Exception('Failed');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Form(
        key: _formKey,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_image.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sh40,
                      sh10,
                      Image.asset(
                        "assets/app_icon.png",
                        height: 65,
                        width: 65,
                      ),
                      sh5,
                      liteboldwhitetext16("G TURNS"),
                      sh30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegistrationScreen(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                normalwhitetext14("Registration"),
                                sh5,
                                Container(
                                  color: Colors.transparent,
                                  height: 2,
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                          sw40,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalwhitetext14("Log in"),
                              sh5,
                              Container(
                                color: yellowcolor,
                                height: 2,
                                width: 30,
                              )
                            ],
                          )
                        ],
                      ),
                      sh30,
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whitecolor,
                        ),
                        child: TextFormField(
                          cursorColor: yellowcolor,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,

                        ),
                      ),
                      sh20,
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whitecolor,
                        ),
                        child: TextFormField(
                          cursorColor: yellowcolor,
                          decoration: InputDecoration(
                            suffixIcon:IconButton(icon: Icon(Icons.remove_red_eye
                            ),onPressed: ()
                            {
                              setState(() {
                                _obscureText = !_obscureText;
                                print(_obscureText);
                              });

                            },)
                            ,
                            hintText: "Password",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          obscureText:  _obscureText,
                          controller: _passwordController,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              "Forgot your password?",
                              style: TextStyle(color: yellowcolor),
                            )
                          ],
                        ),
                      ),
                      sh10,
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.all(20.0),
                              child: RaisedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         HomeScreen(),
                                  //   ),
                                  // );
                                  if (_formKey.currentState.validate()) {
                                    futureUser = fetchData();
                                    _formKey.currentState.save();

                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Enter',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                color: yellowcolor,
                                padding: EdgeInsets.all(10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(
                                      5.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius: BorderRadius
                                              .circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          "assets/zerodha-squarelogo_icon.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    sh5,
                                    normalwhitetext14("Zerodha")
                                  ],
                                ),
                                sw40,
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius: BorderRadius
                                              .circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          "assets/Angel-Broking_icon.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    sh5,
                                    normalwhitetext14("Angel Broking")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
