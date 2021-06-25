import 'package:flutter/material.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:hexcolor/hexcolor.dart';

import 'ChatScreen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool viewSelectState = true;
  List _items = ['', '', ''];

  messageList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return messageItem(
          index,
        );
      },
    );
  }

  messageItem(index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: HexColor("#F5F5F5"),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trade (Buy)",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: greycolor),
                      ),
                      Text(
                        "10:17AM",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: greycolor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BHEL  (765 Units)",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: blackcolor),
                      ),
                      Text(
                        "Active",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: whitecolor,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BHEL  (765 Units)",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: blackcolor),
                      ),
                      Text(
                        "Active",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 10, bottom: 10),
                  child: Text(
                    "The railroad industry is one of the major components of the transportation sector and is closely tied to the economy's growth.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: greycolor),
                  ),
                ),
                Divider(),
              ],
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
          color: whitecolor,
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
                                "Recent",
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
                                width: 20,
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
                                "All",
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
                                width: 10,
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
                  messageList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
