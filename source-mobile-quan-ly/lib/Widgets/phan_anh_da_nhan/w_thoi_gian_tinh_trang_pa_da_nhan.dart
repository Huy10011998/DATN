import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:flutter/material.dart';

class ThoiGianTinhTrangPaDaNhan extends StatefulWidget {
  final PhanAnhDaNhan thoigiantinhtrangpadanhan;
  const ThoiGianTinhTrangPaDaNhan({
    Key key,
    this.thoigiantinhtrangpadanhan,
  }) : super(key: key);

  @override
  _ThoiGianTinhTrangPaDaNhanState createState() => _ThoiGianTinhTrangPaDaNhanState();
}

class _ThoiGianTinhTrangPaDaNhanState extends State<ThoiGianTinhTrangPaDaNhan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.thoigiantinhtrangpadanhan.tinhTrangXuLy == ""
            ? Container(
                padding: EdgeInsets.only(bottom: 5),
                width: 50,
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 3, color: Colors.orange)),
                ),
              )
            : widget.thoigiantinhtrangpadanhan.tinhTrangXuLy == '3'
                ? Container(
                    padding: EdgeInsets.only(bottom: 5),
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 3, color: Colors.green)),
                    ),
                  )
               
                    : widget.thoigiantinhtrangpadanhan.tinhTrangXuLy == '4'
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
