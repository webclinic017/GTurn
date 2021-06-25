import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:gturn/Home/PaymentMethodScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:gturn/constant/ColorComman.dart';
class MyPortfolioScreen extends StatefulWidget {
  @override
  _MyPortfolioScreenState createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  bool myportfolioSelectState = true;
  bool addMoneySelectState = false;
  bool withdrawSelectState = false;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List _items = ["BHEL", "APCL", "CGCL", "INFY"];



  customTableViewList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return customTableViewItem(
          index,
        );
      },
    );
  }

  customTableViewItem(index) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: litegrey),
                  bottom: BorderSide(width: 1, color: litegrey),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      _items[index],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 50,
                      height: 40,
                      child: Sparkline(
                        lineColor: Colors.green,
                        pointsMode: PointsMode.none,
                        pointSize: 5.0,
                        pointColor: Colors.green,
                        data: data,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: litegrey),
                  bottom: BorderSide(width: 1, color: litegrey),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
                child: Text(
                  '765',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: litegrey),
                  bottom: BorderSide(width: 1, color: litegrey),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
                child: Text(
                  'Buy',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: litegrey)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
                child: Text(
                  "22,376.25",
                  style: TextStyle(
                      color: greycolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: HexColor("#F8F8F8"),
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
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
                              myportfolioSelectState = true;
                              addMoneySelectState = false;
                              withdrawSelectState = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "My portfolio",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: myportfolioSelectState == true
                                      ? blackcolor
                                      : greycolor,
                                ),
                              ),
                              sh5,
                              Container(
                                height: 3,
                                width: 35,
                                color: myportfolioSelectState == true
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
                              myportfolioSelectState = false;
                              addMoneySelectState = true;
                              withdrawSelectState = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Add Money",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: addMoneySelectState == true
                                      ? blackcolor
                                      : greycolor,
                                ),
                              ),
                              sh5,
                              Container(
                                height: 3,
                                width: 35,
                                color: addMoneySelectState == true
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
                              myportfolioSelectState = false;
                              withdrawSelectState = true;
                              addMoneySelectState = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Withdraw",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: withdrawSelectState == true
                                      ? blackcolor
                                      : greycolor,
                                ),
                              ),
                              sh5,
                              Container(
                                height: 3,
                                width: 35,
                                color: withdrawSelectState == true
                                    ? yellowcolor
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (myportfolioSelectState == true)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 10, right: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today's Trade",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: bluecolor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              width: 1, color: litegrey),
                                          bottom: BorderSide(
                                              width: 1, color: litegrey),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Instrument",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: greycolor,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              width: 1, color: litegrey),
                                          bottom: BorderSide(
                                              width: 1, color: litegrey),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Qty",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: greycolor,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              width: 1, color: litegrey),
                                          bottom: BorderSide(
                                              width: 1, color: litegrey),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Trade",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: greycolor,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: litegrey)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "Value",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: greycolor,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            customTableViewList(),
                            sh5,
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Companies that have been consistently increasing dividends for the last 10 years, Companies that have been consistently increasing dividends for the last 10 years.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: greycolor,
                                ),
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/questionmartk_icon.png",
                                      height: 20,
                                      width: 20,
                                      color: bluecolor,
                                    ),
                                    Text(
                                      "Questions to ask your expert",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: greycolor),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: bluecolor,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                    ),
                  if (withdrawSelectState == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 10, top: 20),
                                  child: Text(
                                    "Total",
                                    style: TextStyle(
                                        color: greycolor, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 10),
                                  child: Text(
                                    "USD 0.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blackcolor,
                                        fontSize: 18),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 10, top: 10),
                                  child: Text(
                                    "Available for withdrawal",
                                    style: TextStyle(
                                        color: greycolor, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 20),
                                  child: Text(
                                    "USD 0.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blackcolor,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  if (addMoneySelectState == true)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Amount",
                            style: TextStyle(color: greycolor, fontSize: 14),
                          ),
                          sh10,
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: whitecolor,
                                border: Border.all(color: greycolor)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: greycolor,
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(
                                      //   Icons.arrow_forward_ios,
                                      //   size: 20,
                                      // ),
                                      hintText: "Enter amount",
                                      hintStyle: TextStyle(color: greycolor),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/backArrow.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          sh20,
                          Text(
                            "Payment Methods",
                            style: TextStyle(color: greycolor, fontSize: 14),
                          ),
                          sh10,
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentMethodScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: whitecolor,
                                  border: Border.all(color: greycolor)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: greycolor,
                                      decoration: InputDecoration(
                                        // suffixIcon: Icon(
                                        //   Icons.arrow_forward_ios,
                                        //   size: 20,
                                        // ),
                                        hintText: "Bank Cards",
                                        hintStyle: TextStyle(color: greycolor),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/credit-card.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  sw10,
                                  Image.asset(
                                    "assets/backArrow.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          sh20,
                          Text(
                            "Category",
                            style: TextStyle(color: greycolor, fontSize: 14),
                          ),
                          sh10,
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: whitecolor,
                                border: Border.all(color: greycolor)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: greycolor,
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(
                                      //   Icons.arrow_forward_ios,
                                      //   size: 20,
                                      // ),
                                      hintText: "Category Option",
                                      hintStyle: TextStyle(color: greycolor),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/backArrow.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          sh20,
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {},
                                  ),
                                  Text("Save card")
                                ],
                              ),
                              sh10,
                              Text(
                                "You can make a payment with one click. Terms and conditions",
                                style:
                                    TextStyle(color: greycolor, fontSize: 14),
                              ),
                            ],
                          ),
                          sh30,
                          sh10,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Add',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
