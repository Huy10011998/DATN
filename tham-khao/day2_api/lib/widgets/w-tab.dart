import 'package:flutter/material.dart';
import './w-tab/FirstPage.dart' as first;
import './w-tab/SecondPage.dart' as second;
import './w-tab/ThirdPage.dart' as third;

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  //1. StatefulWidget là phần không thay đổi trong Widget Tree... khai bao truoc
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    );

    setState(() {
      
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //     title: new Text("Pages"),
        //     backgroundColor: Colors.deepOrange,
        //     bottom: new TabBar(controller: controller, tabs: <Tab>[
        //       new Tab(icon: new Icon(Icons.arrow_forward)),
        //       new Tab(icon: new Icon(Icons.arrow_downward)),
        //       new Tab(icon: new Icon(Icons.arrow_back))
        //     ])),
        bottomNavigationBar: new Material(
            color: Colors.deepOrange,
            child: new TabBar(controller: controller, tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back))
            ])),
        body: new TabBarView(controller: controller, children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ]));
  }
}
