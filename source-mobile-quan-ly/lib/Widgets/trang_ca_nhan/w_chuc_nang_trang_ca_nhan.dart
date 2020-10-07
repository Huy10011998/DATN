import 'package:demo_quanly/Widgets/dang_nhap/p_dang_nhap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChucNangTrangCaNhan extends StatefulWidget {
  @override
  _ChucNangTrangCaNhanState createState() => _ChucNangTrangCaNhanState();
}

class _ChucNangTrangCaNhanState extends State<ChucNangTrangCaNhan> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(children: <Widget>[
              //
              ListTile(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Chức năng này đang tạm đóng !')));
                  },
                  title: Text('Thống kê',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                  leading: SvgPicture.asset(
                    'assets/images/analytics.svg',
                    width: 23,
                    color: Colors.black87,
                  )),

              //
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.2, color: Colors.black12)),
                ),
                height: 1,
              ),

              //

              ListTile(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Chức năng này đang tạm đóng !')));
                  },
                  title: Text('Cài đặt',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                  leading: SvgPicture.asset(
                    'assets/images/settings.svg',
                    width: 23,
                  )),

              //
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.2, color: Colors.black12)),
                ),
                height: 1,
              ),

              //

              ListTile(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Chức năng này đang tạm đóng !')));
                  },
                  title: Text('Đổi mật khẩu',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                  leading: SvgPicture.asset(
                    'assets/images/locked.svg',
                    width: 23,
                    color: Colors.black,
                  )),

              //
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.2, color: Colors.black12)),
                ),
                height: 1,
              ),

              //

              ListTile(
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Chức năng này đang tạm đóng !')));
                  },
                  title: Text('Sửa thông tin',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                  leading: SvgPicture.asset(
                    'assets/images/edit.svg',
                    width: 23,
                    color: Colors.black54,
                  )),
            ]),
            Container(
              child: ListTile(
                  onTap: () {
                    _onAlertButtonsPressed(context);
                  },
                  title: Text('Đăng xuất',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0)),
                  leading: SvgPicture.asset(
                    'assets/images/logout.svg',
                    width: 23,
                    color: Colors.black54,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // show thông báo
  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Xác nhận",
      desc: "Bạn muốn đăng xuất ?",
      buttons: [
        DialogButton(
          child: Text(
            "Huỷ",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xff808D8D8D),
        ),
        DialogButton(
            child: Text(
              "Đồng ý",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DangNhapPage()),
                  (Route<dynamic> route) => false,
                ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff441CB0), Color(0xff6C18A4)]))
      ],
    ).show();
  }
}
