import 'package:demo_quanly/Widgets/trang_ca_nhan/model_trang_ca_nhan.dart';
import 'package:demo_quanly/Widgets/trang_ca_nhan/w_chuc_nang_trang_ca_nhan.dart';
import 'package:demo_quanly/Widgets/trang_ca_nhan/w_service_trang_ca_nhan.dart';
import 'package:flutter/material.dart';

class ListTrangCaNhan extends StatefulWidget {
  @override
  _ListTrangCaNhanState createState() => _ListTrangCaNhanState();
  static Widget buidListview(TrangCaNhanModel tcn) {
    return Container(
        child: Column(children: <Widget>[
      Stack(children: <Widget>[
        Container(
            height: 280.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image:
                    DecorationImage(
                      image: AssetImage('assets/images/bg.png'), fit: BoxFit.fitWidth)
                      ),
            child: Column(children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 7.0),
                    image: DecorationImage(
                      image: NetworkImage(tcn.anhDaiDien),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Text(
                tcn.tenNhanVien,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text(
                tcn.tenPhongBan,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              )),
            ])),
      ]),
      ChucNangTrangCaNhan(),
    ]));
  }
}

class _ListTrangCaNhanState extends State<ListTrangCaNhan> {
  ServiceTrangCaNhan serviceTrangCaNhan;

  void initState() {
    super.initState();
    serviceTrangCaNhan = ServiceTrangCaNhan();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
