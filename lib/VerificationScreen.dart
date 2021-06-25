import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gturn/HomeScreen.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:gturn/constant/ColorComman.dart';
import 'constant/Widget.dart';
import 'constant/Widget.dart';

enum MobileVerificationState { SHOW_MOBILE_FROM_STATE, SHOW_OTP_FROM_STATE }

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final otptxt = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _verificationId;
  final SmsAutoFill _autoFill = SmsAutoFill();
  bool showLoading = false;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FROM_STATE;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      showLoading = true;
    });
    try
    {
      final authCredential =  await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if(authCredential?.user != null)
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomeScreen(),
            ),
          );
          print("verification success");
        }
      else{
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text("Verification Failed")));
      }
    } on FirebaseAuthException catch(e)
    {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));

    }

  }

  verifyNumber() async {
    setState(() {
      showLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phoneNum');
    print("phone number"+phone);
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' +phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        setState(() {
          showLoading = false;
        });
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        //signInWithPhoneAuthCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) async {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        setState(() {
          showLoading = false;
        });
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(e.message)));
        // Handle other errors
      },
      codeSent: (String verificationId, int resendToken) async {
        setState(() {
          showLoading = false;
          currentState = MobileVerificationState.SHOW_OTP_FROM_STATE;
          this._verificationId = verificationId;
          print(_verificationId);

        });
        // Update the UI - wait for the user to enter the SMS code
        // String smsCode = 'xxxx';
        //
        // // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //     verificationId: verificationId, smsCode: smsCode);
        //
        // // Sign the user in (or link) with the credential
        // await _auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  verifyOtp() async {
    print(otptxt.text);
    if(otptxt.text.isEmpty)
      {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text("Please enter otp")));
      }
    else
      {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: _verificationId, smsCode: otptxt.text);
        signInWithPhoneAuthCredential(phoneAuthCredential);
      }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   verifyNumber();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Form(
          key: _formKey,
          child: Scaffold(
            key: _scaffoldKey,
            // appBar: AppBar(
            //   elevation: 0.0,
            //   centerTitle: false,
            //   // iconTheme: IconThemeData(color: Colors.white),
            //   backgroundColor: HexColor("#1D1001"),
            //   brightness: Brightness.light,
            //   leading: IconButton(
            //       icon: Icon(
            //         Icons.arrow_back,
            //         color: Colors.black,
            //       ),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       }),
            // ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: whitecolor,
                image: DecorationImage(
                    image: AssetImage("assets/background_image.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sh30,
                  sh20,
                  Image.asset(
                    "assets/app_icon.png",
                    height: 65,
                    width: 65,
                  ),
                  sh5,
                  liteboldwhitetext16("G TURNS"),
                  sh10,
                  Text(
                    "Enter OTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: whitecolor),
                  ),
                  sh20,
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Text(
                      "OTP has been sent to your Phone Number. Enter it below to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: whitecolor),
                    ),
                  ),
                  sh30,
                  Center(
                    child: PinCodeTextField(
                      wrapAlignment: WrapAlignment.center,
                      pinBoxWidth: 50,
                      pinBoxHeight: 50,
                      maxLength: 6,
                      hideCharacter: true,
                      maskCharacter: "*",
                      pinBoxBorderWidth: 2,
                      defaultBorderColor: whitecolor,
                      pinBoxColor: whitecolor,
                      highlightPinBoxColor:whitecolor,
                      hasTextBorderColor: yellowcolor,
                      controller: otptxt,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  sh30,
                  InkWell(
                    onTap: () {
                      verifyOtp();

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: yellowcolor),
                      child: Center(
                          child: Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                  Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: showLoading,
                      child: Container(
                          margin: EdgeInsets.only(top: 50, bottom: 30),
                          child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(yellowcolor),)
                      )
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
