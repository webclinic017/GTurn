import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:gturn/constant/ColorComman.dart';
class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  bool profitLossSelectState = true;
  bool tradesSelectState = false;
  List<String> _option = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedOption;
  List<String> _date = ['4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reports', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            profitLossSelectState = true;
                            tradesSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Profit & Loss Summary",
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 15,
                                color: profitLossSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: profitLossSelectState == true
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
                            profitLossSelectState = false;
                            tradesSelectState = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Trades",
                              style: TextStyle(
                                fontSize: 15,
                                color: tradesSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: tradesSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                      sw30,
                    ],
                  ),
                ),
                if (profitLossSelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                              EdgeInsets.only(left: 0.0,top: 10.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 45,
                                                width: 45,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0,top: 10.0),
                                              child: new Text("3000",  style: TextStyle(
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
                                              EdgeInsets.only(left: 0.0,top: 10.0),
                                              child: Image.asset(
                                                "assets/rupees.png",
                                                height: 45,
                                                width: 45,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 10.0,top: 10.0),
                                              child: new Text("1000",  style: TextStyle(
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
                                            child: new Text("Current Month Profit",
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
                          sh10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            'From',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                                        ),
                                        Padding(padding:EdgeInsets.only(top: 10.0),
                                          child:
                                          Container(
                                            padding: EdgeInsets.only(left: 10, right: 10),
                                            width: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(5),
                                              color: whitecolor,
                                            ),
                                            child: TextFormField(
                                              cursorColor: greycolor,
                                              decoration: InputDecoration(
                                                hintText: "21/04/2020",
                                                hintStyle: TextStyle(color: greycolor),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                              ),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),)

                                      ],
                                    ),
                                  ))
                              ,
                              Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            'To',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                                        ),
                                        Padding(padding:EdgeInsets.only(top: 10.0),
                                          child:
                                          Container(
                                            padding: EdgeInsets.only(left: 10, right: 10),
                                            width: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(5),
                                              color: whitecolor,
                                            ),
                                            child: TextFormField(
                                              cursorColor: greycolor,
                                              decoration: InputDecoration(
                                                hintText: "21/05/2020",
                                                hintStyle: TextStyle(color: greycolor),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                              ),
                                              keyboardType: TextInputType.text,
                                            ),
                                          ),)

                                      ],
                                    ),
                                  ))
                              ,
                            ],
                          ),
                          sh10,
                        Container(




                          child:
                          Padding(padding: EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (context, int index) {
                              return cartItems(index);
                            },
                          ),)
                          ,
                        )

                        ],
                      ),
                    ),
                  )
                ,
                if (tradesSelectState == true)
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'From',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                                      ),
                                      Padding(padding:EdgeInsets.only(top: 10.0),
                                      child:
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                    width: 150,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(5),
                                          color: whitecolor,
                                        ),
                                        child: TextFormField(
                                          cursorColor: greycolor,
                                          decoration: InputDecoration(
                                            hintText: "21/04/2020",
                                            hintStyle: TextStyle(color: greycolor),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),)

                                    ],
                                  ),
                                ))
                              ,
                    Padding(padding: EdgeInsets.only(top: 15.0,left: 10.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  'To',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                              ),
                              Padding(padding:EdgeInsets.only(top: 10.0),
                                child:
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                    color: whitecolor,
                                  ),
                                  child: TextFormField(
                                    cursorColor: greycolor,
                                    decoration: InputDecoration(
                                      hintText: "21/05/2020",
                                      hintStyle: TextStyle(color: greycolor),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),)

                            ],
                          ),
                        ))
                    ,
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 20.0,left: 0.0,right: 0.0,bottom: 0.0)
                                ,child:
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      columnSpacing: 30.0,
                                      columns: [
                                        DataColumn(label: Text(
                                            'Stock Name',
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                        )),
                                        DataColumn(label: Text(
                                            'Quantity',
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                        )),
                                        DataColumn(label: Text(
                                            'Entry Price',
                                            softWrap: true,
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                        )),
                                        DataColumn(label: Text(
                                            'Action',
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                                        )),
                                      ],
                                      rows: [
                                        DataRow(cells: [
                                          DataCell(Text('BHEL')),
                                          DataCell(Text('400')),
                                          DataCell(Text('455')),
                                          DataCell(Text('Buy',style: TextStyle(color: yellowcolor))),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(Text('AirIndia')),
                                          DataCell(Text('400')),
                                          DataCell(Text('455')),
                                          DataCell(Text('Sell', style: TextStyle(color: yellowcolor))),
                                        ]),
                                      ],


                                    ),
                                  )
                                ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
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
      height: 50,
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
                          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 0.0),
                          child: Text(
                            "P&L Report "+_date[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),

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
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight:  Radius.circular(20.0),bottomLeft:  Radius.circular(20.0),bottomRight:  Radius.circular(20.0)),
            border: Border.all(
              color: Colors.white,
              width: 2,

            )
        ),
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
