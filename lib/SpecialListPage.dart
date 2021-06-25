import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialListPage extends StatelessWidget {
  final double cornerRadius = 100.0;
  final double circleRadius = 80.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
                child:Padding
                  (
                  padding: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, int index) {
                      return cartItems(index);
                    },
                  ),
                )

            ),
          ],
        ));
  }
  Widget cartItems(int index) {

     return Container(
      height:240,
      width: double.infinity,
      child: Stack(children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: circleRadius / 2.0,left: circleRadius/2.0 ),  ///here we create space for the circle avatar to get ut of the box
                child: Container(
                  height: 240.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              alignment:Alignment.center ,
                              margin: EdgeInsets.only(left: 50.0,top: 20.0,right: 0.0,bottom: 0.0),
                              child: Text(
                                "  Name:" ,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              alignment:Alignment.center ,
                              margin: EdgeInsets.only(left: 3.0,top: 20.0,right: 0.0,bottom: 0.0),
                              child: Text(
                                "Dr Lily MA MBA " ,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.only(left: 22.0,top: 20.0,right: 0.0,bottom: 0.0),
                              child:Icon(
                                Icons.star,
                                size: 14.0,
                                color:Colors.amber,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.0,top: 20.0,right: 3.0,bottom: 0.0),
                              child: Text(
                                "4.5",
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 58.0,top: 8.0,right: 0.0,bottom: 0.0),
                              child:    Text(
                                "Specialist : ",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 0.0,top: 8.0,right: 0.0,bottom: 0.0),
                                child:  Text(
                                  " Cardiologist",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13, fontWeight: FontWeight.w300),
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 25.0,top: 15.0,right: 0.0,bottom: 0.0),
                              child:Container(
                                width: 20,
                                child: IconButton(
                                  onPressed: () {
                                    print("Button Pressed");
                                  },
                                  color: Colors.black,
                                  icon: Icon(Icons.alarm),
                                  iconSize: 20,
                                ),
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(left: 14.0,top: 15.0,right: 0.0,bottom: 0.0),
                              child:Text('10:00 AM -12:00 AM',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  )),),

                          ],
                        ),

                        Padding(padding:  EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                                    child:Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight:  Radius.circular(0.0),bottomLeft:  Radius.circular(0.0),bottomRight:  Radius.circular(10.0)),
                                        color:Color(0xffED1590),
                                      ),
                                      width: 80,
                                      height: 30,
                                      child:Container(
                                        margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 0.0),
                                        child:Text("BOOK",textAlign:TextAlign.center, style: TextStyle(fontSize: 15,color: Colors.white)),
                                      ),
                                    ),
                                  )
                              ),

                            ],      ),
                        )


                      ],
                    ),
                  ),
                ),
              ),



              ///Image Avatar
              ///
              Padding(padding: EdgeInsets.only(left: 0),
                child:  Container(
                  width: circleRadius,
                  height: circleRadius,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                          'https://www.tutorialkart.com/img/hummingbird.png'),
                    ),
                  ),/// replace your image with the Icon
                ),)
              ,
            ],
          ),
        ),
      ]),
    );
  }
}

