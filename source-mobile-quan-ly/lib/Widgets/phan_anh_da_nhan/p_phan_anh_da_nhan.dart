import 'package:demo_quanly/Widgets/phan_anh_da_nhan/phan_anh_da_nhan_rong/p_phan_anh_da_nhan_rong.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_list_da_nhan_pa.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_service_pa_da_nhan.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_size_config.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'w_list_da_nhan_pa.dart';
import 'w_model_pa_da_nhan.dart';

class Phananhdanhan extends StatefulWidget {
  final String title;
  Phananhdanhan([Key key, this.title]) : super(key: key);
  @override
  _PhananhdanhanState createState() => _PhananhdanhanState();
}

class _PhananhdanhanState extends State<Phananhdanhan> {
  ServicePhanAnhDaNhan servicePhanAnhDaNhan;
  @override
  void initState() {
    servicePhanAnhDaNhan = ServicePhanAnhDaNhan();
    super.initState();
    //gan doi tuong do vao bien ser.
    servicePhanAnhDaNhan.getTotalItem().then((value) async {
      setState(() {
        servicePhanAnhDaNhan.totalItem = int.parse(value);
        print('Total: ' + servicePhanAnhDaNhan.totalItem.toString());
      });
    });
  }

  //bien dung de kiem tra load danh sach.
  onScrollDown() {
    if (servicePhanAnhDaNhan.currentPage <
        servicePhanAnhDaNhan.getTotalPage()) {
      setState(() {
        servicePhanAnhDaNhan.currentPage++;
        servicePhanAnhDaNhan.isLoadMore = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/Banner.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Phản ánh đã nhận',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfor) {
            if (!servicePhanAnhDaNhan.isLoadMore &&
                scrollInfor.metrics.pixels ==
                    scrollInfor.metrics.maxScrollExtent) {
              onScrollDown();
            }
            return true;
          },
          child: FutureBuilder<List<PhanAnhDaNhan>>(
            //phan hoi lai yeu cau khi gui len api
            future: servicePhanAnhDaNhan.layDSPhanAnhDaNhan() ?? [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PhanAnhDaNhan> ds = snapshot.data ?? [];
                if (ds.length == 0) {
                  return Phananhdanhanrong();
                } else {
                  return ListDaNhanPA.buildListViewPaDaNhan(
                      ds, servicePhanAnhDaNhan.isLoadMore);
                }
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
