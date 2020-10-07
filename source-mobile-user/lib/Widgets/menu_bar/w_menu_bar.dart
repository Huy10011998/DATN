import 'package:demo_trangchu/Util/size_config.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/p_dang_theo_doi.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/p_pop_up_gui_phan_anh.dart';
import 'package:demo_trangchu/Widgets/trang_chu/p_trang_chu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../gui_phan_anh/p_pop_up_gui_phan_anh.dart';

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
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    ScreenUtil.init(context, width: 411, height: 683);
    return new Scaffold(

        // appbar chứa logo, tên và slogan ứng dụng
        appBar: AppBar(
          flexibleSpace: Image(
          image: AssetImage('images/Banner.png'),
          fit: BoxFit.cover,
        ),
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: <Widget>[
              //Logo ứng dụng
              Container(
                width: 85,
                height: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/hinh9.png"))),
              ),
              SizedBox(
                width: 10,
              ),

              // tên và sologan ứng dụng
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Cổng phản ánh",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Nhanh chóng - Tiện lợi - Bảo mật",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Nút tạo phản ánh trên menu bar
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff3F36AE),
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
           _popUpGuiPhanAnh(context);
          },
        ),

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

                  // Nút Đang theo dõi
                  new Tab(
                    icon: new Icon(Icons.rss_feed, size: 30),
                    text: "Đang theo dõi",
                  )
                ])),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[new TrangChu(), new DangTheoDoi()]));
  }
}


// Hàm gọi cửa sổ mở lên để tạo phản ánh
_popUpGuiPhanAnh(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return new PopUpGuiPhanAnh();
      });
}
