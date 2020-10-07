import 'package:demo_quanly/Widgets/trang_ca_nhan/model_trang_ca_nhan.dart';
import 'package:demo_quanly/Widgets/trang_ca_nhan/w_list_trang_ca_nhan.dart';
import 'package:demo_quanly/Widgets/trang_ca_nhan/w_service_trang_ca_nhan.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'model_trang_ca_nhan.dart';
import 'w_list_trang_ca_nhan.dart';

class TrangCaNhan extends StatefulWidget {
  @override
  _TrangCaNhanState createState() => _TrangCaNhanState();
}

class _TrangCaNhanState extends State<TrangCaNhan> {
  ServiceTrangCaNhan serviceTrangCaNhan;
  @override
  void initState() {
    serviceTrangCaNhan = ServiceTrangCaNhan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<TrangCaNhanModel>(
        //phan hoi lai yeu cau khi gui len api
        future: serviceTrangCaNhan.layThongTin() ?? [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TrangCaNhanModel tcn = snapshot.data ?? [];
            return ListTrangCaNhan.buidListview(tcn);
          } else {
            Container();
            return Center(
              child: CircularProgressIndicator(),
              // child: JumpingText(
              //   'Đang tải ...',
              //   style: TextStyle(color: Color(0xff3F36AE)),
              // ),
            );
          }
        },
      ),
    ));
  }
}
