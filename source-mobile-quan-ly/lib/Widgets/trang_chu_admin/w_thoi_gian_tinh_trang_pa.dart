import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:flutter/material.dart';

class ThoiGianTinhTrangPa extends StatefulWidget {
  final PhanAnhModel thoigiantinhtrangpa;
  const ThoiGianTinhTrangPa({
    Key key,
    this.thoigiantinhtrangpa,
  }) : super(key: key);

  @override
  _ThoiGianTinhTrangPaState createState() => _ThoiGianTinhTrangPaState();
}

class _ThoiGianTinhTrangPaState extends State<ThoiGianTinhTrangPa> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.thoigiantinhtrangpa.tinhTrangXuLy == '1'
            ? Container(
                padding: EdgeInsets.only(bottom: 5),
                width: 50,
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 3, color: Colors.orange)),
                ),
              )
            : widget.thoigiantinhtrangpa.tinhTrangXuLy == '2'
                ? Container(
                    padding: EdgeInsets.only(bottom: 5),
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 3, color: Color(0xff007AFF))),
                    ),
                  )
                : widget.thoigiantinhtrangpa.tinhTrangXuLy == '3'
                    ? Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 3, color: Color(0xff00CF00))),
                        ),
                      )
                    : widget.thoigiantinhtrangpa.tinhTrangXuLy == '4'
                        ? Container(
                            padding: EdgeInsets.only(bottom: 5),
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                  top:
                                      BorderSide(width: 3, color: Colors.red)),
                            ))
                        : Container());
  }
}
