
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/p_phan_anh_da_nhan.dart';
import 'package:demo_quanly/Widgets/trang_ca_nhan/p_trang_ca_nhan.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/p_trang_chu.dart';
import 'package:flutter/material.dart';

class ThanhTabBar extends StatefulWidget {
  @override
  ThanhTabBarState createState() => new ThanhTabBarState();
}

class ThanhTabBarState extends State<ThanhTabBar>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

        // Tạo menu bar
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: new Material(
            shape: Border.all(width: 1, color: Color(0xff30919195)),
            child: new TabBar(
                controller: controller,
                indicatorColor: Color(0xff8E8E93),
                labelColor: Color(0xff3F36AE),
                unselectedLabelColor: Color(0xff8E8E93),
                tabs: <Tab>[
                  // Nút Trang chủ
                  new Tab(
                    icon: new Icon(
                      Icons.home,
                      size: 30,
                    ),
                    text: "Trang chủ",
                  ),

                  // Nút đã nhận
                  new Tab(
                    icon: new Icon(Icons.content_paste, size: 30),
                    text: "Đã nhận",
                  ),

                  // Trang cá nhân
                  new Tab(
                    icon: new Icon(Icons.person, size: 30),
                    text: "Trang cá nhân",
                  )
                ])),
        body: new TabBarView(controller: controller, children: <Widget>[
          new TrangChu(),
          new Phananhdanhan(),
          new TrangCaNhan(),
        ]));
  }
}
