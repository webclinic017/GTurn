import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
class CommunicationPage extends StatefulWidget {
  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  bool activeSelectState = true;
  bool invoiceState = false;
  List<String> _option = ['A', 'B', 'C', 'D'];
  List<String> _name = ['Equity Fund Manager', 'Relationship Manager', 'Finance Team', 'Equity Fund Manager','Relationship Manager','Finance Team'];
  List<String> _date = ['4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020'];

  List<String> _invoiceDate = ['24/05/2021','24/04/2021','24/03/2021','24/02/2021','24/01/2021','24/06/2021'];
  List<String> _invoiceMsgDate = ['4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020','4/5/2020'];

  // Option 2
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Messages', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
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
                            activeSelectState = true;
                            invoiceState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Active",
                              style: TextStyle(
                                fontSize: 15,
                                color: activeSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: activeSelectState == true
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
                            activeSelectState = false;
                            invoiceState = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Invoices",
                              style: TextStyle(
                                fontSize: 15,
                                color: invoiceState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: invoiceState == true
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
                if (activeSelectState == true)
          Padding(
          padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, int index) {
          return cartItems(index);
        },
      ),
    ),

                if (invoiceState == true)
                Padding(
                padding: EdgeInsets.all(20.0),
    child: ListView.builder(
    physics: const BouncingScrollPhysics(
    parent: AlwaysScrollableScrollPhysics()),
    shrinkWrap: true,
    itemCount: 6,
    itemBuilder: (context, int index) {
    return cartItems1(index);
    },
    ),
    ),
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
      height: 90,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 0.0),
                          child: Text(
                            _name[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 10.0),
                          child: Text(
                            "Last Message: "+_date[index],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
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
  Widget cartItems1(int index) {
    return RoundedContainer(

      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 90,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 0.0),
                          child: Text(
                            "Tax Invoice - "+_invoiceDate[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 0.0,bottom: 10.0),
                          child: Text(
                            "Last Message: "+_invoiceMsgDate[index],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
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