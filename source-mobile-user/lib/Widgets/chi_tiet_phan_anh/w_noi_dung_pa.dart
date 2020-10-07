import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/modal_chi_tiet_pa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class NoiDung extends StatelessWidget {
  ChiTietPhanAnhModel phanAnh;
  NoiDung(this.phanAnh);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // container này tạo nền trắng cho nội dung phản ánh, 
        // k có nó là thấy luôn cái background image bên dưới màn hình
        Container(
          color: Colors.white,
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff3F36AE),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),

          // Toan bo noi dung
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Nội dung phản ánh
              Text(
                phanAnh.noiDung,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),

              SizedBox(
                height: 15,
              ),

              // Vi tri
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'images/location.svg',
                    width: 13,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    phanAnh.tenViTri + " - " + phanAnh.diaDiem,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),

              phanAnh.diaDiem.isNotEmpty
                  ?
                  // Thoi gian
                  Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'images/clock.svg',
                          width: 13,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          phanAnh.timeXayRaPa,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                        )
                      ],
                    )
                  : Container(),

              // Thong tin them
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white30))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Chủ đề:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                phanAnh.tenChuDe,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Mã phản ánh:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                phanAnh.phanAnhId.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Thời gian phản ánh:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                phanAnh.timeTaoPa,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
