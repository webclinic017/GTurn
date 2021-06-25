import 'dart:convert';
import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gturn/HomeScreen.dart';
import 'package:gturn/LogInScreen.dart';
import 'package:gturn/VerificationScreen.dart';
import 'package:gturn/constant/ApiUrl.dart';
import 'package:gturn/model/RegistrationModel.dart';
import 'package:gturn/popupMenu.dart';
import 'constant/Widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gturn/constant/ColorComman.dart';
Future<Registration> futureUser;
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedValue="";
  List dropvalue = ["USD", "INR"];
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();


  final String auth_token = "auth_token";
  String _email = "";
  String _password = "";
  String _amountType ="";

  // Initially password is obscure
  bool _obscureText = true;
  bool _cObscureText = true;

  Future<Registration> fetchData() async {
    EasyLoading.show(status: 'Please wait...');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(auth_token);
    prefs.setString('phoneNum',_phoneNumberController.text);

    final String apiUrl = ApiUrl().registration;


    Map data = {
    "first_name" : _firstNameController.text, "last_name" : _lastNameController.text,"mobile" : _phoneNumberController.text,"email": _emailController.text, "password": _passwordController.text,   "app_platform": "android",   "app_version": "1.0"
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
      String status = map['status'];
      Map dataList = map["data"];
      String message = map['message'];
      print(status);
      print(message);
      if(status == 'true'){
        EasyLoading.dismiss();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20.0)), //this right here
                child: Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Registered Successfully",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        sh10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          VerificationScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: yellowcolor,
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            });

      }else if(status == 'false'){
        EasyLoading.dismiss();
        showDialog(context: context,
            builder: (BuildContext context){
              return CustomDialogBox(
                title: "User Not Registered",
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
      home: Form (
        key: _formKey,
        child:  Scaffold(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalwhitetext14("Registration"),
                              sh5,
                              Container(
                                color: yellowcolor,
                                height: 2,
                                width: 30,
                              )
                            ],
                          ),
                          sw40,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInScreen(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                normalwhitetext14("Log in"),
                                sh5,
                                Container(
                                  color: Colors.transparent,
                                  height: 2,
                                  width: 30,
                                )
                              ],
                            ),
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
                            hintText: "First Name",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter your first name";
                            else
                              return null;
                          },
                          controller: _firstNameController,
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
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter your last name";
                            else
                              return null;
                          },
                          controller: _lastNameController,
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
                            hintText: "Email",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter email";
                            else if (!EmailValidator.validate(val))
                              return "please enter a valid email";
                            else
                              return null;
                          },
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
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter phone number";
                            else if (val.length != 10 )
                              return "phone number must contain 10 digit";
                            else
                              return null;
                          },
                          controller: _phoneNumberController,
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
                            hintText: "Create Password",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          obscureText: _obscureText,
                            controller: _passwordController,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter password";
                            else if (val.length <= 5)
                              return "Your password should be more then 6 char long";
                            else
                              return null;
                          },

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
                                _cObscureText = !_cObscureText;
                                print(_cObscureText);
                              });

                            },)
                            ,
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: greycolor),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          obscureText: _cObscureText,
                          controller: _cPasswordController,
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter confirm password";
                            else if (_passwordController.text  != _cPasswordController.text)
                              return "password mismatch";
                            else
                              return null;
                          },

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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(children: [
                          Icon(
                            Icons.check_box,
                            color: yellowcolor,
                          ),
                          sw10,
                          Expanded(
                            child: normalwhitetext14(
                                "I am an adult and have reviewed and accept the service agreement"),
                          ),
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(20.0),
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         VerificationScreen(),
                            //   ),
                            // );


                            if (_formKey.currentState.validate()) {
                             fetchData();
                              _formKey.currentState.save();

                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          color: yellowcolor,
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sh40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(5)),
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
                                borderRadius: BorderRadius.circular(5)),
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
          ),
        ),
      ),
    );
  }
}
