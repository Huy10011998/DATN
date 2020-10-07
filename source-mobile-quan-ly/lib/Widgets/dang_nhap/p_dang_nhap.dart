import 'package:demo_quanly/Widgets/dang_nhap/w_box_dang_nhap.dart';
import 'package:flutter/material.dart';

class DangNhapPage extends StatefulWidget {
  DangNhapPage({Key key}) : super(key: key);

  @override
  _DangNhapPageState createState() => _DangNhapPageState();
}

class _DangNhapPageState extends State<DangNhapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // Chia thanh 2 phan, 1 phan la banner, con lai la background
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // phan banner
                  Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.07),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        children: <Widget>[
                          // Ten app
                          Text(
                            'Cổng phản ánh',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff442EB5)),
                          ),

                          // Hinh banner
                          Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.06),
                              width: MediaQuery.of(context).size.width * 0.68,
                              
                              child: Image(
                                image: AssetImage('assets/images/678.png'),
                              )),

                          //text nho
                          Container(
                            padding: EdgeInsets.only(top: 13),
                            child: Text(
                              'Xử lý phản ánh nhanh chóng, dễ dàng',
                              style: TextStyle(
                                  fontSize: 13.3,
                                  wordSpacing: -1,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),

                  // phan bg
                  Container(
                    child: Image.asset(
                      "assets/images/bg.png",
                      fit: BoxFit.fitWidth,
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.08,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xff103D4043)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: BoxDangNhap(),
                  ),
                ))
          ],
        ));
  }
}
