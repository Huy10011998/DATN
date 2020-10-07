import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:flutter/material.dart';

class NoiDungPa extends StatefulWidget {
  // tao ra 1 doi tuong de lay model
  final PhanAnh pAnh;
  const NoiDungPa({Key key, this.pAnh}) : super(key: key);
  @override
  _NoiDungPaState createState() => _NoiDungPaState();
}

class _NoiDungPaState extends State<NoiDungPa> {
  @override
  Widget build(BuildContext context) {
    // hien thi noi dung pa.
    return Container(
      child: widget.pAnh.hinhnguoidung1 != "" &&
              widget.pAnh.hinhnguoidung2 != "" &&
              widget.pAnh.hinhnguoidung3 != "" &&
              widget.pAnh.hinhnguoidung4 != ""
          ? Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.pAnh.noiDung,
                    style: TextStyle(fontSize: 17),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )))
          : Container(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 10.0,
              ),
              child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.pAnh.noiDung,
                    style: TextStyle(fontSize: 17, letterSpacing: .5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ))
                  ),
    );
  }
}
