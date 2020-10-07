import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:flutter/material.dart';

class ChuDePaDaNhan extends StatefulWidget {
  final PhanAnhDaNhan chuDePaDaNhan;
  const ChuDePaDaNhan({
    Key key,
    this.chuDePaDaNhan,
  }) : super(key: key);
  @override
  _ChuDePaDaNhanState createState() => _ChuDePaDaNhanState();
}

class _ChuDePaDaNhanState extends State<ChuDePaDaNhan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.chuDePaDaNhan.tenChuDe,
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[400]),
            ),
            Text(
              ' • ',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              widget.chuDePaDaNhan.thoigiantaoPA,
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
