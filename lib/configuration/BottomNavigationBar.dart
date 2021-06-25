import 'package:flutter/material.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:gturn/constant/ColorComman.dart';

Widget menu() {
  var currentIndex = 0;
  return TabBar(
    isScrollable: true,
    labelColor: yellowcolor,
    unselectedLabelColor: greycolor,
    unselectedLabelStyle:
        TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: yellowcolor),
    labelStyle: TextStyle(
        fontSize: 8, fontWeight: FontWeight.w700, color: Colors.black),
    indicatorColor: Colors.transparent,
    onTap: (value) {
      print(value);
      currentIndex = value;
    },
    tabs: [
      Tab(
        text: "Home",
        icon: Image.asset(
          "assets/home_icon.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Messages",
        icon: Image.asset(
          "assets/messages_icon.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "My Portfolio",
        icon: Image.asset(
          "assets/myportfolio_icon.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Performance",
        icon: Image.asset(
          "assets/Performance_icon.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Plans",
        icon: Image.asset(
          "assets/plans.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Funds",
        icon: Image.asset(
          "assets/fund.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Communication",
        icon: Image.asset(
          "assets/communication.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Reports",
        icon: Image.asset(
          "assets/report.png",
          height: 25,
          width: 25,
        ),
      ),
      Tab(
        text: "Profile",
        icon: Image.asset(
          "assets/Profile_icon.png",
          height: 25,
          width: 25,
        ),
      ),
    ],
  );
}
