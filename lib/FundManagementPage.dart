import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:gturn/constant/ColorComman.dart';
class FundManagementPage extends StatefulWidget {
  @override
  _FundManagementPageState createState() => _FundManagementPageState();
}

class _FundManagementPageState extends State<FundManagementPage> {
  bool summarySelectState = true;
  bool addFundSelectState = false;
  bool withdrawalSelectState = false;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List _items = ["BHEL", "APCL", "CGCL", "INFY"];
  List<String> _option = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fund Management', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            summarySelectState = true;
                            addFundSelectState = false;
                            withdrawalSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Summary",
                              style: TextStyle(
                                fontSize: 15,
                                color: summarySelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: summarySelectState == true
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
                            summarySelectState = false;
                            addFundSelectState = true;
                            withdrawalSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Add Fund",
                              style: TextStyle(
                                fontSize: 15,
                                color: addFundSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: addFundSelectState == true
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
                            summarySelectState = false;
                            withdrawalSelectState = true;
                            addFundSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Request Withdrawal",
                              style: TextStyle(
                                fontSize: 15,
                                color: withdrawalSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: withdrawalSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (summarySelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    color: yellowcolor,
                                    child: new Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 0.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0),
                                              child: new Text("7000",  style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0,top: 20.0),
                                            child: new Text("Initial capital",
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    color: yellowcolor,
                                    child: new Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 00.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0),
                                              child: new Text("7000",  style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0,top: 20.0),
                                            child: new Text("Overall capital",
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    color: yellowcolor,
                                    child: new Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 0.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0),
                                              child: new Text("7000",  style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0,top: 20.0),
                                            child: new Text("Overall Profit Booked",
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    color: yellowcolor,
                                    child: new Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 0.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 65,
                                                width: 65,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0),
                                              child: new Text("7000",  style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              )),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0,top: 20.0),
                                            child: new Text("Available for Withdrawal",
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
Padding(padding: EdgeInsets.only(top: 10.0,left: 5.0,right: 5.0,bottom: 10.0)
,child: DataTable(
    columnSpacing: 15.0,
    columns: [
      DataColumn(label: Text(
          'Amount',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      )),
      DataColumn(label: Text(
          'Date',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      )),
      DataColumn(label: Text(
          'Transaction Type',
          softWrap: true,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      )),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text('Rs.3000')),
        DataCell(Text('4/3/2020')),
        DataCell(Text('Request',textAlign: TextAlign.center,)),
      ]),
      DataRow(cells: [
        DataCell(Text('Rs.4000')),
        DataCell(Text('4/3/2020')),
        DataCell(Text('withdraw')),
      ]),
      DataRow(cells: [
        DataCell(Text('Rs.3000')),
        DataCell(Text('4/3/2020')),
        DataCell(Text('Added')),
      ]),
      DataRow(cells: [
        DataCell(Text('Rs.4000')),
        DataCell(Text('4/3/2020')),
        DataCell(Text('Requested')),
      ]),
    ],


  ),),
                        ],
                      ),
                    ),
                  )
                  ,
                if (withdrawalSelectState == true)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, bottom: 10, top: 70.0),
                            child: Text('Under Construction',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                        ,
                      ],
                    ),
                  ),
                if (addFundSelectState == true)
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: new Column(
                      children: [
                        sh30,
                        Text(
                          "You can transfer fund directly to your brokerage account. Please find more details here: ",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                          ),
                        ),
                        sh40,
                        Text(
                          "https://zerodha.com/fund-transfer/#tab-deposit_funds https://www.angelbroking.com/knowledge-center/trading-account/how-to-transfer-funds-into-your-trading-account",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cartItems(int index) {
    return RoundedContainer(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 150,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, right: 0.0, bottom: 0.0),
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
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          "Strategy : ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            "Option Compounding",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                    child: Text(
                      "Strategies and tactics that create strong while expanding your",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: yellowcolor,
                              ),
                              width: 40,
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  print("Button Pressed");
                                },
                                color: Colors.white,
                                icon: Icon(Icons.info),
                                iconSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(10.0),
    this.margin,
    this.borderRadius,
    this.alignment,
    this.elevation,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(0),
      color: color,
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
            border: Border.all(
              color: Colors.white,
              width: 2,
            )),
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
