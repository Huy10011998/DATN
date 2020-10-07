import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:flutter/material.dart';

class AnhPhanAnhDaNhan extends StatefulWidget {
  final PhanAnhDaNhan anhPhanAnhDaNhan;
  const AnhPhanAnhDaNhan({
    Key key,
    this.anhPhanAnhDaNhan,
  }) : super(key: key);
  @override
  _AnhPhanAnhDaNhanState createState() => _AnhPhanAnhDaNhanState();
}

class _AnhPhanAnhDaNhanState extends State<AnhPhanAnhDaNhan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 100,
      height: 120,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        Image.network(
          widget.anhPhanAnhDaNhan.anhnguoidung1,
          fit: BoxFit.fill,
          height: 100,
          width: 100,
        ),
      ]),
    );
  }
}
