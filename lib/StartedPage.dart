import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gturn/RegistrationScreen.dart';
import 'package:gturn/model/RegistrationModel.dart';

import 'constant/Widget.dart';

class StartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            sh40,
            sh40,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 40.0,
                ),
                child: Image.asset(
                  "assets/app_icon.png",
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            sh40,
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Expanded(
                  child: Text(
                "Strategies and tactics that create strong while expanding your and tactics that create strong while expanding your and tactics that create strong while expanding your and tactics that create strong while expanding your.and tactics that create strong while expanding your and tactics that create strong while expanding your and tactics that create strong expanding your and tactics that create strong while expanding your and tactics that create strong while expanding your",
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              )),
            ),
            sh40,
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen(),
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
                    'Let\'s get started',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                color: yellowcolor,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                      5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
