// import 'package:demo_quanly/Widget/trang_chu_admin/model_trang_chu.dart';
// import 'package:demo_quanly/Widget/trang_chu_admin/service_trang_chu.dart';
// import 'package:demo_quanly/Widget/trang_chu_admin/w_list_trang_chu.dart';
// import 'package:demo_quanly/Widget/trang_chu_admin/w_logo.dart';
// import 'package:demo_quanly/Widget/trang_chu_admin/w_size_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TrangChu extends StatefulWidget {
//   final String title;
//   TrangChu([Key key, this.title]) : super(key: key);
//   @override
//   _TatcaphananhState createState() => _TatcaphananhState();
// }

// class _TatcaphananhState extends State<TrangChu> {
//   //khai bao doi tuong list de dung
//   ServicePhanAnh servicePhanAnh;
//   @override
//   void initState() {
//     servicePhanAnh = ServicePhanAnh();
//     super.initState();
//     setState(() {
//       servicePhanAnh.scroll = 75;
//     });
//     // servicePhanAnh.getTotalItem().then((value) async {
//   }

//   //bien dung de kiem tra load danh sach.
//   onScrollDown() {
//     if (servicePhanAnh.currentPage < servicePhanAnh.getTotalPage()) {
//       setState(() {
//         servicePhanAnh.currentPage++;
//         servicePhanAnh.isLoadMore = true;
//       });
//     }
//   }

//   //phuong thuc dung de hien thi giao dien.
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Stack(children: <Widget>[
//       LogoTrangChu(),
//       Positioned(
//         child: AnimatedPadding(
//           curve: Curves.easeInOut,
//           duration: const Duration(milliseconds: 300),
//           padding: EdgeInsets.only(top: servicePhanAnh.scroll),
//           child: NotificationListener<ScrollNotification>(
//             onNotification: (ScrollNotification scrollInfor) {
//               // if (scrollInfor.metrics.pixels > 50) {
//               //   print(scrollInfor.metrics.pixels);
//               //   setState(() {
//               //     servicePhanAnh.scroll = 0;
//               //   });
//               // }

//               // if (scrollInfor.metrics.pixels ==
//               //     scrollInfor.metrics.minScrollExtent) {
//               //   setState(() {
//               //     servicePhanAnh.scroll = 75.0;
//               //   });
//               // }

//               if (!servicePhanAnh.isLoadMore &&
//                   scrollInfor.metrics.pixels ==
//                       scrollInfor.metrics.maxScrollExtent) {
//                 print('asdasdas');
//                 onScrollDown();
//               }
//               // return true;
//             },
//             //phan hoi lai yeu cau khi gui len api
//             child: new FutureBuilder<dynamic>(
//                 future: servicePhanAnh.layDSPhanAnh(),
//                 builder: (context, snapshot) {
//                   print(snapshot);

//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.hasData &&
//                       snapshot.data != null) {
//                     //return Container();
//                     List<PhanAnhModel> ds = snapshot.data['result'] ?? [];

//                     servicePhanAnh.totalItem =
//                         int.parse(snapshot.data['count']);

//                     return ListTrangChu.buildListView(
//                         ds, servicePhanAnh.isLoadMore);
//                   }

//                   return Center(child: CircularProgressIndicator());

//                   // if (snapshot.hasError){
//                   //   return Center(
//                   //       child: Text(
//                   //           "Something wrong with message: ${snapshot.error.toString()}"));
//                   // }

//                   // if(snapshot.hasData) {
//                   //   if(snapshot.data['result'].length>0){
//                   //       print(snapshot.data['result']);
//                   //   // return Container();
//                   // List<PhanAnhModel> ds = snapshot.data['result'] ?? [];

//                   //   servicePhanAnh.totalItem = int.parse(snapshot.data['count']);

//                   // return ListTrangChu.buildListView(
//                   //     ds, servicePhanAnh.isLoadMore);
//                   //   }else{
//                   //     return Container();
//                   //   }

//                   // }
//                 }),
//           ),
//         ),
//       ),
//     ]);
//   }
// }

import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/service_trang_chu.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_khong_co_data.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_list_trang_chu.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'model_trang_chu.dart';

class TrangChu extends StatefulWidget {
  final String title;
  TrangChu([Key key, this.title]) : super(key: key);
  @override
  _TatcaphananhState createState() => _TatcaphananhState();
}

class _TatcaphananhState extends State<TrangChu> {
  //khai bao doi tuong list de dung
  ServicePhanAnh servicePhanAnh;
  @override
  void initState() {
    servicePhanAnh = ServicePhanAnh();
    super.initState();
    //gan doi tuong do vao bien ser.
    servicePhanAnh.getTotalItem().then((value) async {
      setState(() {
        servicePhanAnh.totalItem = int.parse(value);
        print('Total: ' + servicePhanAnh.totalItem.toString());
      });
    });
  }

  //bien dung de kiem tra load danh sach.
  onScrollDown() {
    if (servicePhanAnh.currentPage < servicePhanAnh.getTotalPage()) {
      setState(() {
        servicePhanAnh.currentPage++;
        servicePhanAnh.isLoadMore = true;
      });
    }
  }

  @override
  //phuong thuc dung de hien thi giao dien.
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
        extendBody: true,
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/Banner.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: <Widget>[
              Container(
                width: 85,
                height: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/background.png"))),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Cổng phản ánh",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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

        //phan hoi lai yeu cau khi gui len api
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfor) {
            if (!servicePhanAnh.isLoadMore &&
                scrollInfor.metrics.pixels ==
                    scrollInfor.metrics.maxScrollExtent) {
              onScrollDown();
            }
            return true;
          },
          child: FutureBuilder<List<PhanAnhModel>>(
            //phan hoi lai yeu cau khi gui len api
            future: servicePhanAnh.layDSPhanAnh() ?? [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PhanAnhModel> ds = snapshot.data ?? [];
                if (ds.length == 0) {
                  return KhongCoData();
                } else {
                  return ListTrangChu.buildListView(
                      ds, servicePhanAnh.isLoadMore);
                }
              } else {
                Container();
                return Center(child: CircularProgressIndicator()
                    // child: JumpingText(
                    //   'Đang tải ...',
                    //   style: TextStyle(color: Color(0xff3F36AE)),
                    // ),
                    );
              }
            },
          ),
        ));
  }
}
