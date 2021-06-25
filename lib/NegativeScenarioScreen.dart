import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'constant/Widget.dart';

class NegativeScenarioScreen extends StatefulWidget {
  @override
  _NegativeScenarioScreenState createState() => _NegativeScenarioScreenState();
}

class _NegativeScenarioScreenState extends State<NegativeScenarioScreen> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List _items = ["BHEL", "APCL", "CGCL", "INFY"];

  newsList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return newsItem(
          index,
        );
      },
    );
  }

  newsItem(index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/maxresdefault.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 30,
            child: Text(
              "What are G Turns?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 60,
            child: Image.asset(
              "assets/youtube.png",
              height: 35,
              // width: 35,
            ),
          )
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
            "Welcome, Rahul!",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackcolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: HexColor("#F8F8F8"),
        ),
        body: Container(
          color: HexColor("#F8F8F8"),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.red, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "You are yet to link your equity account!",
                                  style: TextStyle(
                                      fontSize: 12, color: whitecolor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: whitecolor,
                                )
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
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: newsList(),
                  ),
                ),
                todaysPortfolioNewsList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
