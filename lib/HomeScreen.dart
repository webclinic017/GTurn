import 'package:flutter/material.dart';
import 'package:gturn/ChoosePlanPage.dart';
import 'package:gturn/ChooseYourPlanScreen.dart';
import 'package:gturn/CommunicationPage.dart';
import 'package:gturn/DematAccountPage.dart';
import 'package:gturn/FundManagementPage.dart';
import 'package:gturn/Home/PerformanceScreen.dart';
import 'package:gturn/Home/ProfileScreen.dart';
import 'package:gturn/ReportsPage.dart';
import 'package:gturn/constant/Widget.dart';
import 'Home/DashboardScreen.dart';
import 'Home/Message/MessagesScreen.dart';
import 'Home/MyPortfolioScreen.dart';
import 'configuration/BottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          bottomNavigationBar: Container(color: whitecolor, child: menu()),
          body: TabBarView(
            children: [
              DashboardScreen(),
              MessagesScreen(),
              MyPortfolioScreen(),
              PerformanceScreen(),
              ChoosePlanPage(),
              FundManagementPage(),
              CommunicationPage(),
              ReportsPage(),
              ProfileScreen()
            ],
          ),
        ),
      ),
    );
  }
}
