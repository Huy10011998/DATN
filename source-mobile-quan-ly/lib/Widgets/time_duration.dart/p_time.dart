import 'dart:async';
import 'package:demo_quanly/Widgets/dang_nhap/p_dang_nhap.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() {
    var ducation = Duration(seconds: 2);
    return Timer(ducation, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DangNhapPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset("assets/images/background.png"),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text(
            "Cổng Phản Ánh",
            style: TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 1,
          )
        ],
      ),
    ));
  }
}
