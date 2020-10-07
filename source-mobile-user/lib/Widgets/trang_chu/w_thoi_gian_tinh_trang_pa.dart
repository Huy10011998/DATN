import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:flutter/material.dart';

class ThoiGianTinhTrangPa extends StatefulWidget {
  final PhanAnh thoigiantinhtrangpa;
  const ThoiGianTinhTrangPa({Key key, this.thoigiantinhtrangpa})
      : super(key: key);
  @override
  _ThoiGianTinhTrangPaState createState() => _ThoiGianTinhTrangPaState();
}

class _ThoiGianTinhTrangPaState extends State<ThoiGianTinhTrangPa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.place,
                  color: Colors.blueGrey[200],
                  size: 20,
                ),
                Container(
                  padding: EdgeInsets.only(top: 2, left: 5),
                  child: Text(
                    // hien thi vi tri
                    widget.thoigiantinhtrangpa.tenViTri + "  •  ",
                    style:
                        TextStyle(color: Colors.blueGrey[200], fontSize: 13.0),
                  ),
                ),
                Icon(
                  Icons.access_time,
                  color: Colors.blueGrey[100],
                  size: 20,
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: 2,
                      left: 5,
                    ),
                    // hien thi thoi gian
                    child: Text(
                      widget.thoigiantinhtrangpa.timeXayRaPa,
                      style: TextStyle(
                          color: Colors.blueGrey[200], fontSize: 13.0),
                    )),
              ],
            ),
          ),
          //hien thi tinh trang pa
          Container(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    widget.thoigiantinhtrangpa.tinhTrangPa == '1'
                        ? Container(
                            child: Text(
                              'Đang xử lý',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffFF8800),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : widget.thoigiantinhtrangpa.tinhTrangPa == '2'
                            ? Container(
                                child: Text(
                                  'Phản ánh ảo',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : widget.thoigiantinhtrangpa.tinhTrangPa == '3'
                                ? Container(
                                    child: Text(
                                      'Đã xử lý',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff003CFF),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Container(),
                  ])),
        ],
      ),
    );
  }
}
