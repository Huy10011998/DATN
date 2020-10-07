import 'package:demo_quanly/Widgets/menu_bar/w_menu_bar.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/p_trang_chu.dart';
import 'package:flutter/material.dart';

class PopUpTraPaThanhCong extends StatefulWidget {
  @override
  _PopUpTraPaThanhCongState createState() => _PopUpTraPaThanhCongState();
}

class _PopUpTraPaThanhCongState extends State<PopUpTraPaThanhCong> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      // padding: EdgeInsets.all(20),
      child: new Wrap(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                // lbl
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Hoàn thành !',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),

                // img
                Image.asset(
                  'assets/images/2524.png',
                  width: MediaQuery.of(context).size.width * .6,
                ),

                // btn
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ThanhTabBar()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff441CB0), Color(0xff6C18A4)])),
                    margin: EdgeInsets.only(top: 0, bottom: 40),
                    height: 43,
                    width: 250,
                    child: Center(
                        child: Text(
                      'Xong',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
