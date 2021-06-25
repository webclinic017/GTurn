import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:gturn/ChooseYourPlanScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'constant/Widget.dart';
import 'package:gturn/constant/ColorComman.dart';
class LinkYourBroker extends StatefulWidget {
  @override
  _LinkYourBrokerState createState() => _LinkYourBrokerState();
}

class _LinkYourBrokerState extends State<LinkYourBroker> {
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
            "Link your broker",
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
          width: double.infinity,
          height: double.infinity,
          color: HexColor("#F8F8F8"),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseYourPlanScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    sh10,
                    Text(
                      "Choose a broker and start investing in, tracking and managing your investments seamlessly",
                      style: TextStyle(fontSize: 14),
                    ),
                    sh30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/zerodha-squarelogo_icon.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "Zerodha",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/Angel-Broking_icon.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "Angel Broking",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/Trustline.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "Trustline",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Dash(
                      direction: Axis.horizontal,
                      dashColor: greycolor,
                      length: MediaQuery.of(context).size.width / 1.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/5_paisa.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "5paisa",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/edelweiss.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "Edelweiss",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/alice.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "Alice Blue",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Dash(
                      direction: Axis.horizontal,
                      dashColor: greycolor,
                      length: MediaQuery.of(context).size.width / 1.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/HDFC_Bank_Logo.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "HDFC Sec",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/axis.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "AxisDirect",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Dash(
                              direction: Axis.vertical,
                              length: 130,
                              dashColor: greycolor),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/download.png",
                                height: 80,
                              ),
                              sh5,
                              Text(
                                "IIFL Sec",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
