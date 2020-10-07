
import 'package:demo_quanly/Widgets/menu_bar/w_menu_bar.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Phananhdanhanrong extends StatefulWidget {
  @override
  _PhananhdanhanrongState createState() => _PhananhdanhanrongState();
}

class _PhananhdanhanrongState extends State<Phananhdanhanrong> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Phản ánh đã nhận',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/hinh10.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Không tìm thấy !',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Mọi phản ánh đều được xử lý',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              child: Text(
                'Nhận thêm phản ánh ở trang chủ',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('Đi đến trang chủ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThanhTabBar()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
