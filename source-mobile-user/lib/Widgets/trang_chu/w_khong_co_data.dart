import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class KhongCoData extends StatefulWidget {
  KhongCoData({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<KhongCoData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 500,
      width: 350,
      child: EmptyListWidget(
          image: null,
          packageImage: PackageImage.Image_1,
          title: 'No Notification',
          subTitle: 'No  notification available yet',
          titleTextStyle: Theme.of(context)
              .typography
              .dense
              .display1
              .copyWith(color: Color(0xff9da9c7)),
          subtitleTextStyle: Theme.of(context)
              .typography
              .dense
              .body2
              .copyWith(color: Color(0xffabb8d6))),
    )));
  }
}
