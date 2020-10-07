import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThongTin extends StatefulWidget {

  String thoiHanHoanThanh;
  ThongTin(this.thoiHanHoanThanh);

  @override
  _ThongTinState createState() => _ThongTinState();
}

class _ThongTinState extends State<ThongTin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Thời hạn hoành thành:',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(widget.thoiHanHoanThanh,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
        ],
      ),
    );
  }
}
