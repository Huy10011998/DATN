import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:flutter/material.dart';

class AnhPhanAnh extends StatefulWidget {
  final PhanAnhModel anhPhanAnh;
  const AnhPhanAnh({
    Key key,
    this.anhPhanAnh,
  }) : super(key: key);
  @override
  _AnhPhanAnhState createState() => _AnhPhanAnhState();
}

class _AnhPhanAnhState extends State<AnhPhanAnh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 100,
      height: 120,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Image.network(
              widget.anhPhanAnh.anhnguoidung1,
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
          ]),
    );
  }
}
