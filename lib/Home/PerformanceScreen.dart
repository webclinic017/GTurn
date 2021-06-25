import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:hexcolor/hexcolor.dart';

class PerformanceScreen extends StatefulWidget {
  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  bool viewSelectState = true;
  var data = [-0.9, 1.0, -0.3, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.9];
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
                              viewSelectState = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Portfolio Performance",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: viewSelectState == true
                                      ? blackcolor
                                      : greycolor,
                                ),
                              ),
                              sh5,
                              Container(
                                height: 3,
                                width: 35,
                                color: viewSelectState == true
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
                              viewSelectState = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Market Performance",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: viewSelectState == true
                                      ? greycolor
                                      : blackcolor,
                                ),
                              ),
                              sh5,
                              Container(
                                height: 3,
                                width: 35,
                                color: viewSelectState == true
                                    ? Colors.transparent
                                    : yellowcolor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  viewSelectState == true
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: whitecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Portfolio",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          sw10,
                                          Text(
                                            "162.10 (1.50%)",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("1D"),
                                          sw5,
                                          Text("5D"),
                                          sw5,
                                          Text("1M"),
                                          sw5,
                                          Text(
                                            "3M",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: yellowcolor),
                                          ),
                                          sw5,
                                          Text("6M"),
                                          sw5,
                                          Text("1Y"),
                                        ],
                                      )
                                    ],
                                  ),
                                  sh20,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Open (Average)",
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                    sh5,
                                                    Text(
                                                      "10910.4",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Prev.Close",
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                    sh5,
                                                    Text(
                                                      "10805.55",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            sh10,
                                            Row(
                                              children: [
                                                Text(
                                                  "Key Area",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: greycolor),
                                                ),
                                              ],
                                            ),
                                            sh10,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Banks",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "IT Sector",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Chemical Industry",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            sh20,
                                            Row(
                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: greycolor),
                                                ),
                                                sw10,
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 1,
                                                        color: greycolor,
                                                      ),
                                                      sh5,
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "10854.58",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                          Text(
                                                            "11011.75",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            sh20,
                                            Row(
                                              children: [
                                                Text(
                                                  "52 Weeks",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: greycolor),
                                                ),
                                                sw10,
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 15,
                                                        child: Sparkline(
                                                          lineColor: HexColor(
                                                              "#E44701"),
                                                          pointsMode:
                                                              PointsMode.none,
                                                          pointSize: 5.0,
                                                          pointColor:
                                                              Colors.green,
                                                          data: data,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "10854.58",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                          Text(
                                                            "11011.75",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //graph
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/NicePng_grid-paper-png_2277724.png"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Sparkline(
                                              lineColor: HexColor("#E44701"),
                                              pointsMode: PointsMode.none,
                                              pointSize: 5.0,
                                              pointColor: Colors.green,
                                              data: data,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sh30,
                                  Row(
                                    children: [
                                      Text(
                                        "Analyst Review",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  sh20,
                                  Text(
                                    "Companies that have been consistently increasing dividends for the last 10 years, Companies that have been consistently increasing dividends for the last 10 years.\n\nCompanies that have been consistently increasing dividends for the last 10 years, Companies that have been consistently increasing dividends for the last 10 years.\n\nCompanies that have been consistently increasing dividends for the last 10 years.",
                                    style: TextStyle(
                                        fontSize: 14, color: greycolor),
                                  ),
                                  sh20,
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                color: bluecolor),
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
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: whitecolor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Nifty 50",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("1D"),
                                          sw5,
                                          Text("5D"),
                                          sw5,
                                          Text("1M"),
                                          sw5,
                                          Text(
                                            "3M",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: yellowcolor),
                                          ),
                                          sw5,
                                          Text("6M"),
                                          sw5,
                                          Text("1Y"),
                                        ],
                                      )
                                    ],
                                  ),
                                  sh10,
                                  Row(
                                    children: [
                                      Text(
                                        "10967.65",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      sw10,
                                      Text(
                                        "162.10 (1.50%)",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  sh20,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Open (Average)",
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                    sh5,
                                                    Text(
                                                      "10910.4",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Prev.Close",
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                    sh5,
                                                    Text(
                                                      "10805.55",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            sh10,
                                            Row(
                                              children: [
                                                Text(
                                                  "Key Area",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: greycolor),
                                                ),
                                              ],
                                            ),
                                            sh10,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Banks",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "IT Sector",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Chemical Industry",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            sh20,
                                            Row(
                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: greycolor),
                                                ),
                                                sw10,
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 1,
                                                        color: greycolor,
                                                      ),
                                                      sh5,
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "10854.58",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                          Text(
                                                            "11011.75",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            sh20,
                                            Row(
                                              children: [
                                                Text(
                                                  "52 Weeks",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: greycolor),
                                                ),
                                                sw10,
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 15,
                                                        child: Sparkline(
                                                          lineColor: HexColor(
                                                              "#E44701"),
                                                          pointsMode:
                                                              PointsMode.none,
                                                          pointSize: 5.0,
                                                          pointColor:
                                                              Colors.green,
                                                          data: data,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "10854.58",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                          Text(
                                                            "11011.75",
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    greycolor),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //graph
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/NicePng_grid-paper-png_2277724.png"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Sparkline(
                                              lineColor: HexColor("#E44701"),
                                              pointsMode: PointsMode.none,
                                              pointSize: 5.0,
                                              pointColor: Colors.green,
                                              data: data,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  sh30,
                                  Row(
                                    children: [
                                      Text(
                                        "Analyst Review",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  sh20,
                                  Text(
                                    "Companies that have been consistently increasing dividends for the last 10 years, Companies that have been consistently increasing dividends for the last 10 years.\n\nCompanies that have been consistently increasing dividends for the last 10 years, Companies that have been consistently increasing dividends for the last 10 years.\n\nCompanies that have been consistently increasing dividends for the last 10 years.",
                                    style: TextStyle(
                                        fontSize: 14, color: greycolor),
                                  ),
                                  sh20,
                                ],
                              ),
                            ),
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
