import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constant/Widget.dart';
import 'package:gturn/constant/ColorComman.dart';
class ChooseYourPlanScreen extends StatefulWidget {
  @override
  _ChooseYourPlanScreenState createState() => _ChooseYourPlanScreenState();
}

class _ChooseYourPlanScreenState extends State<ChooseYourPlanScreen> {
  List _items = [
    'Momentum Plan',
    'Monthly Hedging Plan',
    'Complete Wealth Plan',
  ];

  planList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return planItem(
          index,
        );
      },
    );
  }

  planItem(index) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, bottom: 10, top: 10),
      child: Container(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Equity",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: greycolor),
              ),
              sh10,
              Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  sw5,
                  Text(
                    _items[index],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                  sw5,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    width: 55,
                    height: 20,
                    child: Center(
                      child: Text(
                        "Low Risk",
                        style: TextStyle(
                          color: whitecolor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              sh10,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum Investment",
                        style: TextStyle(color: greycolor, fontSize: 12),
                      ),
                      sh5,
                      Text("20+ Lakhs",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: blackcolor)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Return Period",
                        style: TextStyle(color: greycolor, fontSize: 12),
                      ),
                      sh5,
                      Text("Monthly",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: blackcolor)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CAGR",
                        style: TextStyle(color: greycolor, fontSize: 12),
                      ),
                      sh5,
                      Text(
                        "20+ Lakhs",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackcolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Choose your Plan!",
            style: TextStyle(
              color: blackcolor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: false,
          backgroundColor: HexColor("#F8F8F8"),
        ),
        body: Container(
          color: HexColor("#F8F8F8"),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              planList(),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () async {},
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
              // sh20,
            ],
          ),
        ),
      ),
    );
  }
}
