import 'dart:convert';
import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gturn/constant/ApiUrl.dart';
import 'package:gturn/model/dashboardModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:gturn/NegativeScenarioScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../popupMenu.dart';
import 'package:gturn/constant/ColorComman.dart';

Future<dashboard> futureDashboard;
class DashboardScreen extends StatefulWidget{
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {

  final String auth_token = "auth_token";
  var datas = [0.1, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, 0.1, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5];
  List _items = ["BHEL", "APCL", "CGCL", "INFY"];
  List<dashboard> listModel = [];
  List<Traders> tradersModel = [];
  String welcomeMsg = 'Good Morning!';

  @override
  void initState() {
    super.initState();
    futureDashboard = fetchdashboardData();
  }

  Future<dashboard> fetchdashboardData() async {

    EasyLoading.show(status: 'Please wait...');
   debugPrint("fetchdashboardData method called");
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(auth_token);

    final String apiUrl = ApiUrl().dashBoard;

    Map data = {
      "user_id": "24",
      "date": "2021-05-04",
      "app_platform": "android",
      "app_version": "1.0"
    };

    var body = json.encode(data);
    final response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json","Authorization":"Bearer $token"},
        body: body
    );
    print(body);
    print("Bearer$token");
    print(response.statusCode);
    if(response.statusCode == 200 ){


      final String responseString = response.body;
      print(responseString);

      final data = jsonDecode(response.body);
      Map<String, dynamic> map = jsonDecode(responseString);


      var dashboardvalue=dashboard.fromJson(map);

      String status = map['status'];
      Map dataList = map["data"];
      String message = map['message'];
      Map UserDetails = dataList["user_details"];




      // print(status);
      // print(message);
      print(UserDetails);
      if(status == 'true'){
        EasyLoading.dismiss();
        // List welcome_sms = dataList["welcome_sms"];


        var timeNow = DateTime.now().hour;
        if (timeNow <= 12) {
          setState(() {
            welcomeMsg = dashboardvalue.data.welcomeSms[0].mngSms;
          });


        } else if ((timeNow > 12) && (timeNow <= 16)) {
          setState(() {
            welcomeMsg = dashboardvalue.data.welcomeSms[0].afternoonSms;
          });

        } else if ((timeNow > 16) && (timeNow < 20)) {

         //eve
          setState(() {
            welcomeMsg = "Good Evening";
          });

        }
        else
          {
            setState(() {
              welcomeMsg = dashboardvalue.data.welcomeSms[0].ngtSms;
            });


          }
        print("gjhkfjdghkjgkjk"+'$welcomeMsg');

        setState(() {
          tradersModel = dashboardvalue.data.traders;
        });

        setState(() {
          for(Map i in data){

            listModel.add(dashboard.fromJson(i));

          }
        });

      }else if(status == 'false'){
        EasyLoading.dismiss();
        showDialog(context: context,
            builder: (BuildContext context){
              return CustomDialogBox(
                title: "something went wrong",
                descriptions: message,
                text: "Done",
              );
            }
        );
      }
    }
    else{
      throw Exception('Failed');
    }
  }

  customTableViewList() {

    return ListView.builder(

      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: tradersModel.length,
      itemBuilder: (context, i) {
        final nDataList = tradersModel[i];
        String data = "traders title"+nDataList.title;
        print(data);
        return  Container(
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
                    const EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          nDataList.title,
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: Sparkline(
                            lineColor: Colors.green,
                            pointsMode: PointsMode.none,
                            pointSize: 5.0,
                            pointColor: Colors.green,
                            data: datas,
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
                      nDataList.qty,
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
                      nDataList.status,
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
                      nDataList.value,
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
                    const EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "dd",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: Sparkline(
                        lineColor: Colors.green,
                        pointsMode: PointsMode.none,
                        pointSize: 5.0,
                        pointColor: Colors.green,
                        data: datas,
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

  todaysPortfolioNewsList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return todaysPortfolioNewsItem(
          index,
        );
      },
    );
  }

  todaysPortfolioNewsItem(index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NegativeScenarioScreen(),
            ),
          );
        },
        child: Container(
            child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "News ( Market )",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: greycolor),
                ),
                sh10,
                Text(
                  "Top Railroad Stocks for Q4 2020",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: blackcolor),
                ),
                sh10,
                Text(
                  "The railroad industry is one of the major components of the transportation sector and is closely tied to the economy's growth.",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: greycolor),
                ),
                sh10,
                Text(
                  "Read now",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: bluecolor),
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
                          color: greycolor,
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
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Hello, Rahul!",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: blackcolor,
              ),
              onPressed: () {},
            ),
            sw10,
          ],
          backgroundColor: HexColor("#F8F8F8"),
        ),
        body: Container(

          color: HexColor("#F8F8F8"),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "$welcomeMsg",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),)


                  ],
                )
               ,
                sh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: HexColor("#DFF4CA"),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "3,337",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: HexColor("#00AB31"),
                                  fontWeight: FontWeight.bold),
                            ),
                            sh5,
                            Text(
                              "Realized Profit",
                              style: TextStyle(
                                  fontSize: 15,
                                  // color: HexColor("#00AB31"),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sw20,
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                      decoration: BoxDecoration(
                          color: HexColor("#FAEEC5"),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "600",
                              style: TextStyle(
                                  fontSize: 25,
                                  // color: HexColor("#00AB31"),
                                  fontWeight: FontWeight.bold),
                            ),
                            sh5,
                            Text(
                              "Total Deposit",
                              style: TextStyle(
                                  fontSize: 15,
                                  // color: HexColor("#00AB31"),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                sh20,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Image.asset("assets/user_image.png"),
                        ),
                      ),
                      sw10,
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                              color: whitecolor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: greycolor, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today's Market Review",
                                      style: TextStyle(
                                          color: greycolor, fontSize: 10),
                                    ),
                                    Text(
                                      "10:17AM",
                                      style: TextStyle(
                                          color: greycolor, fontSize: 10),
                                    )
                                  ],
                                ),
                                sh10,
                                Text(
                                  "Sensex to face resistance at 19,905 After last week's ouster of directors, including the interim CEO and statutory auditors",
                                  style: TextStyle(fontSize: 12),
                                ),
                                sh10,
                                Text(
                                  "Read More >",
                                  style:
                                      TextStyle(color: bluecolor, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Today's Trade",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
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
                                      right:
                                          BorderSide(width: 1, color: litegrey),
                                      bottom:
                                          BorderSide(width: 1, color: litegrey),
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
                                      right:
                                          BorderSide(width: 1, color: litegrey),
                                      bottom:
                                          BorderSide(width: 1, color: litegrey),
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
                                      right:
                                          BorderSide(width: 1, color: litegrey),
                                      bottom:
                                          BorderSide(width: 1, color: litegrey),
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
                        )
                      ],
                    ),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: HexColor("#E4E4E4"),
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 10, bottom: 10),
                    child: Text(
                      "Today's Portfolio News",
                      style:
                          TextStyle(color: HexColor("#7D7D7D"), fontSize: 12),
                    ),
                  ),
                ),
                sh20,
                todaysPortfolioNewsList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
