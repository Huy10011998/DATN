import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:flutter/material.dart';

class NoiDungPaDaNhan extends StatefulWidget {
  final PhanAnhDaNhan noiDungPaDaNhan;
  const NoiDungPaDaNhan({
    Key key,
    this.noiDungPaDaNhan,
  }) : super(key: key);
  @override
  _NoiDungPaDaNhanState createState() => _NoiDungPaDaNhanState();
}

class _NoiDungPaDaNhanState extends State<NoiDungPaDaNhan> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              child: widget.noiDungPaDaNhan.tinhTrangXuLy == ''
                  ? Container(
                      child: Text(
                        'Đang xử lý',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : widget.noiDungPaDaNhan.tinhTrangXuLy == '3'
                      ? Container(
                          child: Text(
                            'Đợi phản hồi',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                     
                          : widget.noiDungPaDaNhan.tinhTrangXuLy == '4'
                              ? Container(
                                  child: Text(
                                    'Xử lý lại',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container(),
            )
            // Container(
            //     padding: EdgeInsets.only(top: 2, right: 30),
            //     child: Row(children: <Widget>[
            //       Container(
            //         padding: EdgeInsets.only(top: 12),
            //         child: new Text(
            //           "còn lại: 13 giờ",
            //           //'còn lại: ${widget.noiDungPaDaNhan.thoigiantaoPA}',
            //           style: TextStyle(
            //               fontStyle: FontStyle.italic,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ])),
          ]),
    ));
  }
}
