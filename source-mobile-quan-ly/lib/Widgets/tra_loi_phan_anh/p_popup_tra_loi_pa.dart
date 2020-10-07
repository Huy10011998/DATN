import 'dart:async';

import 'package:demo_quanly/Widgets/menu_bar/w_menu_bar.dart';
import 'package:demo_quanly/Widgets/multi_image_out.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/service_tra_loi_phan_anh.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/w_noi_dung.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/w_tep_dinh_kem.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/p_trang_chu.dart';
import 'package:demo_quanly/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:status_alert/status_alert.dart';

class PopUpTraLoiPhanAnh extends StatefulWidget {
  int id;
  int a = 1;
  PopUpTraLoiPhanAnh(this.id);

  @override
  _PopUpTraLoiPhanAnhState createState() => _PopUpTraLoiPhanAnhState();
}

class _PopUpTraLoiPhanAnhState extends State<PopUpTraLoiPhanAnh> {
  String noiDung = '';
  var links;
  var assetImg = [];
  var hihi = {
    'link0': "",
    'link1': "",
    'link2': "",
    'link3': "",
  };
  var lalala = [];
  StreamController<dynamic> _controller = StreamController<dynamic>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ScreenUtil.init(width: 411, height: 683);

    return Container(
      height: MediaQuery.of(context).size.height - 57,
      decoration: BoxDecoration(
          color: Color(0xffD4D4D4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Thanh chức năng
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),
              ),
              padding: EdgeInsets.only(top: 4, bottom: 4),

              // các nút
              child: Container(
                height: 35,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 15,
                      child: InkWell(
                        child: Text(
                          'Huỷ',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff016ADD)),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    // lbl trả lời
                    Center(
                      child: Container(
                          child: Text(
                        'Trả lời',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )),
                    ),

                    // nút hoàn thành
                    Positioned(
                      right: 15,
                      child: InkWell(
                        child: Text(
                          'Hoàn thành',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        onTap: () async {
                          if (noiDung == '') {
                            StatusAlert.show(
                              context,
                              duration: Duration(seconds: 1),
                              title: 'Có lỗi xảy ra',
                              subtitle: 'Vui lòng nhập nội dung',
                              configuration:
                                  IconConfiguration(icon: Icons.error),
                            );

                            print('Nội dung trống không gửi được !');
                          } else {
                            print(ViewMultiImageOut().valueImage);
                            _controller.add(lalala);

                            // gọi api gửi đi
                            ServiceTraLoiPa()
                                .traLoiPhanAnh(
                                    noiDung,
                                    hihi['link0'],
                                    hihi['link1'],
                                    hihi['link2'],
                                    hihi['link3'],
                                    widget.id)
                                .then((onValue) {
                              // GỌi api xong thì kiểm tra sttcode,
                              // 200 ra page gửi thành công
                              if (onValue == 200) {
                                StatusAlert.show(
                                  context,
                                  // cái alert này kích thước 200 px
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              100),
                                  duration: Duration(seconds: 1),
                                  title: 'Thành công',
                                  configuration: IconConfiguration(
                                      icon: Icons.done, size: 100),
                                );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThanhTabBar()),
                                  (Route<dynamic> route) => false,
                                );
                              }
                              // ngược lại ra page gửi thất bại
                              else
                                StatusAlert.show(
                                  context,
                                  // cái alert này kích thước 200 px
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              100),
                                  duration: Duration(seconds: 1),
                                  title: 'Vui lòng thử lại',
                                  configuration: IconConfiguration(
                                      icon: Icons.error, size: 100),
                                );
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Up hình đối chiếu
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // text
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        'Ảnh đối chiếu',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      )),

                  // w xử lý nút upload ảnh
                  ViewMultiImageOut(
                    valueImage: (valueImage) {
                      setState(() {
                        valueImage.asMap().forEach((i, f) {
                          hihi['link$i'] = f;
                        });
                      });
                      print(valueImage);
                    },
                    statusUpload: (STATUSUPLOAD2 status) {
                      print(status);
                    },
                    valueAsset: (asset) {
                      setState(() {
                        lalala = asset;
                      });
                    },
                    stream: _controller.stream,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),

            // Nội dung trả lời
            NoiDungTraLoi(
              onNoiDungThayDoi: (noiDungLayDc) {
                setState(
                  () {
                    noiDung = noiDungLayDc;
                  },
                );
              },
            ),

            SizedBox(
              height: 5,
            ),

            // Up Tệp đính kèm
            TepDinhKem(),
          ],
        ),
      ),
    );
  }
}
