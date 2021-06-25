import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gturn/DematAccountPage.dart';
import 'package:gturn/constant/Widget.dart';
class CustomDialogBox extends StatefulWidget {

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  List<String> _option = ['5 Years', '10 Years', '15 Years', '20 Years']; // Option 2
  String _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height -  220,
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child:
      SingleChildScrollView(
        child: new Column(
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/checkmark.png",
                  height: 30,
                  width: 30,
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 0.0),
                    child: Text(
                      "High Reward (70% YoY)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
            sh5,
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0,top: 8.0,right: 0.0,bottom: 0.0),
                  child:    Text(
                    "Strategy : ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(left: 0.0,top: 8.0,right: 0.0,bottom: 0.0),
                    child:  Text(
                      "Option Compounding",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15, fontWeight: FontWeight.w300),
                    )
                ),
              ],
            ),
            sh5,
            Padding(
              padding: EdgeInsets.only(left: 10.0,top: 8.0,right: 0.0,bottom: 0.0),
              child:
              Text(
                "Strategies and tactics that create strong while expanding your",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ),
            sh5,
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 0.0),
                    child: Text(
                      "RoI Calculator: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
            sh10,
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: whitecolor,
              ),
              child: TextFormField(
                cursorColor: yellowcolor,
                decoration: InputDecoration(
                  hintText: "Enter Your Amount",
                  hintStyle: TextStyle(color: greycolor),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            sh10,
            Container(
              width: 230,
                margin: EdgeInsets.only(left: 10, right:10),
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('Num of years'),
                    // Not necessary for Option 1
                    value: _selectedOption,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption = newValue;
                      });
                    },
                    items: _option.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            sh5,
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 8.0,right: 20.0,bottom: 0.0),
                  child:  Expanded(
                    child:  Text(
                      "An average compunded return of 70% YoY",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ) ,
                ),
              ],
            ),
            sh10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                  child:  Container(
                    margin: EdgeInsets.all(0.0),
                    child: RaisedButton(
                      onPressed: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Calculate',
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
                  ),)
                ,
                Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                  child:  Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 0, right: 0),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: whitecolor,
                    ),
                    child: TextFormField(
                      cursorColor: yellowcolor,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "RoI",
                        hintStyle: TextStyle(color: greycolor),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),)
              ],
            ),
            sh40,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20.0,right: 10.0)
                ,child:  Icon(
                    Icons.check_box,
                    color: yellowcolor,
                  ),)
               ,
                Text('I have read terms and condition',
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            sh5,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20.0,right: 10.0)
                  ,child:  Icon(
                    Icons.check_box,
                    color: yellowcolor,
                  ),),
               Expanded(child: Text('Click here to Gturn read terms and condition',
                   softWrap: true,
                   style: TextStyle(
                       color: Colors.grey,
                       fontSize: 12,
                       fontWeight: FontWeight.bold))) ,
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DematAccountPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Next',
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
      )
      ,
    );
  }
}