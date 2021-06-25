import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:gturn/constant/ColorComman.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
class DematAccountPage extends StatefulWidget {
  @override
  _DematAccountPageState createState() => _DematAccountPageState();
}

class _DematAccountPageState extends State<DematAccountPage> {
  bool zerodhaSelectState = true;
  bool angelSelectState = false;
  bool createNewAccountSelectState = false;
  List<String> _option = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.0,left: 20.0,right: 20.0,bottom: 10.0),
                  child:
                  Text('Do you have an existing demat account with the following brokers?',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey,fontSize: 18)),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            zerodhaSelectState = true;
                            angelSelectState = false;
                            createNewAccountSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Zerodha",
                              style: TextStyle(
                                fontSize: 15,
                                color: zerodhaSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: zerodhaSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                      sw30,
                      InkWell(
                        onTap: () {
                          setState(() {
                            zerodhaSelectState = false;
                            angelSelectState = true;
                            createNewAccountSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Angel",
                              style: TextStyle(
                                fontSize: 15,
                                color: angelSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: angelSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                      sw30,
                      InkWell(
                        onTap: () {
                          setState(() {
                            zerodhaSelectState = false;
                            createNewAccountSelectState = true;
                            angelSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Create New",
                              style: TextStyle(
                                fontSize: 15,
                                color: createNewAccountSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: createNewAccountSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (zerodhaSelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/checkmark.png",
                                height: 30,
                                width: 30,
                              ),
                              Text('Zerodha',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          sh30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Please enter your credentials:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
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
                              cursorColor: greycolor,
                              decoration: InputDecoration(
                                hintText: "ID",
                                hintStyle: TextStyle(color: greycolor),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
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
                              cursorColor: greycolor,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: greycolor),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
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
                              cursorColor: greycolor,
                              decoration: InputDecoration(
                                hintText: "PIN",
                                hintStyle: TextStyle(color: greycolor),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          sh20,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Register',
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
                    ),
                  )
                ,
                if (createNewAccountSelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/checkmark.png",
                                height: 30,
                                width: 30,
                              ),
                              Text('Create New Account',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          sh10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Upload the following documents in jpeg/pdf format',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),

                          sh30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Aadhar Card',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'PAN Card',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Cancelled Cheque',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      '6 Months Bank Statement',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Digital Signature',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Email ID Confirmation',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              ),
                              Image.asset(
                                "assets/attach.png",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child:

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20.0,left: 5.0,right: 5.0),
                                child: RaisedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black
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
                              ),
                              Image.asset(
                                "",
                                height: 30,
                                width: 30,
                              ),

                            ],

                          ),

                        ],
                      ),
                    ),
                  ),
                if (angelSelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/checkmark.png",
                                height: 30,
                                width: 30,
                              ),
                              Text('Angel',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          sh30,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Please enter your credentials:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
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
                              cursorColor: greycolor,
                              decoration: InputDecoration(
                                hintText: "ID",
                                hintStyle: TextStyle(color: greycolor),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
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
                              cursorColor: greycolor,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: greycolor),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          sh20,
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

