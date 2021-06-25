import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:gturn/dialogs/CustomDialogBox.dart';

class ChoosePlanPage extends StatefulWidget {
  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  bool shortTermSelectState = true;
  bool longTermSelectState = false;
  bool customisedSelectState = false;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List _items = ["BHEL", "APCL", "CGCL", "INFY"];
  List<String> _option = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedOption;

  createNewMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Choose Your Plan', style: TextStyle(color: Colors.black)),
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
                            shortTermSelectState = true;
                            longTermSelectState = false;
                            customisedSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Short Term",
                              style: TextStyle(
                                fontSize: 15,
                                color: shortTermSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: shortTermSelectState == true
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
                            shortTermSelectState = false;
                            longTermSelectState = true;
                            customisedSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Long Term",
                              style: TextStyle(
                                fontSize: 15,
                                color: longTermSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: longTermSelectState == true
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
                            shortTermSelectState = false;
                            customisedSelectState = true;
                            longTermSelectState = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Customised",
                              style: TextStyle(
                                fontSize: 15,
                                color: customisedSelectState == true
                                    ? blackcolor
                                    : greycolor,
                              ),
                            ),
                            sh5,
                            Container(
                              height: 3,
                              width: 35,
                              color: customisedSelectState == true
                                  ? yellowcolor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (shortTermSelectState == true)
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
                if (customisedSelectState == true)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    'Our financial expert will call you at convenient time to go through ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 10, top: 40.0),
                          child: Text('Time Slot',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 10, top: 40),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('Please choose an option'),
                                // Not necessary for Option 1
                                value: _selectedOption,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedOption = newValue;
                                  });
                                },
                                items: _option.map((location) {
                                  return DropdownMenuItem(
                                    child: new Text(location),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 50.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(),
                                  ),
                                );
                                // if (_formKey.currentState.validate()) {
                                //   futureUser = fetchData();
                                //   _formKey.currentState.save();
                                //
                                // }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              color: yellowcolor,
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (longTermSelectState == true)
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
      height: 150,
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
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            "High Reward (70% YoY)",
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          "Strategy : ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            "Option Compounding",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                    child: Text(
                      "Strategies and tactics that create strong while expanding your",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: yellowcolor,
                              ),
                              width: 40,
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  print("Button Pressed");
                                },
                                color: Colors.white,
                                icon: Icon(Icons.info),
                                iconSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
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
      height: 150,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         DematAccountPage(),
          //   ),
          // );
          createNewMessage();
        },
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
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 0.0, bottom: 0.0),
                            child: Text(
                              "High Reward (70% YoY)",
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
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                          child: Text(
                            "Strategy : ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                            child: Text(
                              "Option Compounding",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, top: 8.0, right: 0.0, bottom: 0.0),
                      child: Text(
                        "Strategies and tactics that create strong while expanding your",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(0.0),
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: yellowcolor,
                                ),
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  onPressed: () {
                                    print("Button Pressed");
                                  },
                                  color: Colors.white,
                                  icon: Icon(Icons.info),
                                  iconSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
            border: Border.all(
              color: Colors.white,
              width: 2,
            )),
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
