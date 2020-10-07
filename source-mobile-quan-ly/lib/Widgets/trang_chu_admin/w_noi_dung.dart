import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:flutter/material.dart';

class NoiDung extends StatefulWidget {
  final PhanAnhModel noiDungPa;
  const NoiDung({
    Key key,
    this.noiDungPa,
  }) : super(key: key);
  @override
  _NoiDungState createState() => _NoiDungState();
}

class _NoiDungState extends State<NoiDung> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget.noiDungPa.tinhTrangXuLy == '5'
            ? Container(
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            child: Text(
                              'Đang xử lý',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                          // : widget.noiDungPa.tinhTrangXuLy == '2'
                          //     ? Container(
                          //         child: Text(
                          //           'Đợi phản hồi',
                          //           style: TextStyle(
                          //               fontSize: 15,
                          //               color: Colors.green,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       )
                          //     : widget.noiDungPa.tinhTrangXuLy == '3'
                          //         ? Container(
                          //             child: Text(
                          //               'Đợi xử lý',
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   color: Colors.blue,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           )
                          //         :

                          ),
                      Container(
                          padding: EdgeInsets.only(top: 2, right: 30),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('images/1.jpg'),
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 2, left: 10),
                                  child: Text(
                                    widget.noiDungPa.hotenNV,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ])),
                    ]),
              )
            : Container(
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: widget.noiDungPa.tinhTrangXuLy == '1'
                            ? Container(
                                child: Text(
                                  'Đợi phân phối',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : widget.noiDungPa.tinhTrangXuLy == '2'
                                ? Container(
                                    child: Text(
                                      'Đợi xử lý',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff007AFF),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : widget.noiDungPa.tinhTrangXuLy == '3'
                                    ? Container(
                                        child: Text(
                                          'Đợi phản hồi',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff00CF00),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : widget.noiDungPa.tinhTrangXuLy == '4'
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
                      ),
                    ]),
              )
      ],
    ));
  }
}
