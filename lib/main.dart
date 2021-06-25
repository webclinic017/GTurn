import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gturn/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  var page = SplashScreen();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => page,
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'G Turns',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: null);
  }
}
/*
return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
     */
