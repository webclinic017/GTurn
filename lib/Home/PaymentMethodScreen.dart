import 'package:flutter/material.dart';
import 'package:gturn/constant/Widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
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
            "Add Money",
            style: TextStyle(
              color: blackcolor,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.cancel_sharp,
                color: blackcolor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          backgroundColor: whitecolor,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select a payment method",
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  sh20,
                  Text(
                    "Recommended",
                    style: TextStyle(color: greycolor, fontSize: 14),
                  ),
                  sh20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/credit-card.png",
                            height: 50,
                            width: 50,
                          ),
                          sw20,
                          Text(
                            "Bank cards",
                            style: TextStyle(
                                color: blackcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/tickmark.png",
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/bhim.png",
                            height: 50,
                            width: 50,
                          ),
                          sw20,
                          Text(
                            "UPI",
                            style: TextStyle(
                                color: blackcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                      // Image.asset(
                      //   "assets/tickmark.png",
                      //   height: 20,
                      //   width: 20,
                      // ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/mouse.png",
                            height: 50,
                            width: 50,
                          ),
                          sw20,
                          Text(
                            "Net Banking",
                            style: TextStyle(
                                color: blackcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                      // Image.asset(
                      //   "assets/tickmark.png",
                      //   height: 20,
                      //   width: 20,
                      // ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
