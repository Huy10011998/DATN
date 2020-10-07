import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:flutter/material.dart';

class ChuDePa extends StatefulWidget {
  final PhanAnhModel chuDePa;
  const ChuDePa({
    Key key,
    this.chuDePa,
  }) : super(key: key);
  @override
  _ChuDePaState createState() => _ChuDePaState();
}

class _ChuDePaState extends State<ChuDePa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.chuDePa.tenChuDe,
              style: TextStyle(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[400]),
            ),
            Text(
              ' • ',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              widget.chuDePa.thoigiantaoPA,
              style: TextStyle(fontSize: 13, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
