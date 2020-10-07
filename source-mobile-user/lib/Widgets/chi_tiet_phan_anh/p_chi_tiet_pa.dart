import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/modal_chi_tiet_pa.dart';
import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/service_chi_tiet_pa.dart';
import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/w_noi_dung_pa.dart';
import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/w_tinh_trang_pa.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/service_pa_dang_theo_doi.dart';
import 'package:demo_trangchu/ba-image.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:status_alert/status_alert.dart';

class ChiTietPhanAnh extends StatefulWidget {
  int idPhanAnh;
  ChiTietPhanAnh(this.idPhanAnh);
  @override
  _ChiTietPhanAnhState createState() => _ChiTietPhanAnhState();
}

class _ChiTietPhanAnhState extends State<ChiTietPhanAnh> {
  Future<ChiTietPhanAnhModel> phanAnh;
  ServicePhanAnhDangTheoDoi servicePa;
  List<int> ids;
  bool ktra = false;
  bool xoaTheoDoi = false;

  @override
  void initState() {
    super.initState();
    phanAnh = ServiceChiTiet(widget.idPhanAnh).fetchChiTietPa();
    servicePa = ServicePhanAnhDangTheoDoi();
    getId();
  }

  getId() async {
    ids = await servicePa.getIds();
    // nếu id phản ánh này tồn tại trong db rồi thì ktra = true
    ids.contains(widget.idPhanAnh) == true ? ktra = true : ktra = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ChiTietPhanAnhModel>(
        future: phanAnh,
        builder: (context, snapshot) {
          // Có data
          if (snapshot.hasData) {
            return Scaffold(
                // Thanh  tiêu đề
                appBar: AppBar(
                  // icon back
                  leading: GestureDetector(
                    onTap: () {
                      /* truyền xoaTheoDoi khi nhấn back để xử lý trong db
                      */
                      Navigator.pop(context, xoaTheoDoi);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3F36AE),
                      size: 26,
                    ),
                  ),
                  // dòng tiêu đề
                  title: Text(
                    'Chi tiết phản ánh',
                    style: TextStyle(color: Color(0xff3F36AE)),
                  ),
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    // icon bookmark
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                        // ktra bằng true (có trong db) thì nút bookmark sáng và ngược lại
                        child: ktra == true
                            ? Image.asset(
                                'images/bookmark.png',
                                width: 26,
                              )
                            : Image.asset(
                                'images/bookmark1.png',
                                width: 26,
                              ),
                        onTap: () {
                          // = true la co trong db
                          ktra == true
                              ? {
                                  /* kiểm tra hành động bấm vào nút bookmark này là xoá hay là thêm,
                              *  nếu là xoá thì set xoaTheoDoi là true
                              */
                                  xoaTheoDoi = true,
                                  StatusAlert.show(context,
                                      duration: Duration(seconds: 1),
                                      title: 'Đã bỏ theo dõi',
                                      configuration: IconConfiguration(
                                          icon: Icons.bookmark_border,
                                          size: 100),
                                      margin: EdgeInsets.all(
                                          MediaQuery.of(context).size.width/2 - 100 ),
                                      padding: EdgeInsets.all(10)),
                                }
                              :  StatusAlert.show(context,
                                      duration: Duration(seconds: 1),
                                      title: 'Đã theo dõi',
                                      configuration: IconConfiguration(
                                          icon: Icons.bookmark,
                                          size: 100),
                                      margin: EdgeInsets.all(
                                          MediaQuery.of(context).size.width/2 - 100 ),
                                      padding: EdgeInsets.all(10));

                          // = false là chưa có trong db, nhấn vào thì add, ngược lại thì xoá
                          ktra == false
                              ? servicePa.addId(widget.idPhanAnh)
                              : servicePa.deleteId(widget.idPhanAnh);

                          /* bấm vào thì đổi trạng thái  */
                          setState(() {
                            ktra = !ktra;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                body: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Stack(
                    children: <Widget>[
                      //  background mấy toà chung cư ở dưới cùng
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: 0,
                        child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              'images/586.png',
                            )),
                      ),
                      SingleChildScrollView(
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                BAMultiImage(
                                  data: [
                                    // set before after cho hình 1
                                    snapshot.data.hinhnguoidung1.isNotEmpty
                                        ? {
                                            "bfImage":
                                                '${snapshot.data.hinhnguoidung1}',
                                            "afImage": snapshot
                                                    .data.hinhtraloi1.isNotEmpty
                                                ? '${snapshot.data.hinhtraloi1}'
                                                : ''
                                          }
                                        : {"bfImage": '', "afImage": ''},

                                    // set before after cho hình 2
                                    snapshot.data.hinhnguoidung2.isNotEmpty
                                        ? {
                                            "bfImage":
                                                '${snapshot.data.hinhnguoidung2}',
                                            "afImage": snapshot
                                                    .data.hinhtraloi2.isNotEmpty
                                                ? '${snapshot.data.hinhtraloi2}'
                                                : ''
                                          }
                                        : {"bfImage": '', "afImage": ''},

                                    // set before after cho hình 3
                                    snapshot.data.hinhnguoidung3.isNotEmpty
                                        ? {
                                            "bfImage":
                                                '${snapshot.data.hinhnguoidung3}',
                                            "afImage": snapshot
                                                    .data.hinhtraloi3.isNotEmpty
                                                ? '${snapshot.data.hinhtraloi3}'
                                                : ''
                                          }
                                        : {"bfImage": '', "afImage": ''},

                                    // set before after cho hình 4
                                    snapshot.data.hinhnguoidung4.isNotEmpty
                                        ? {
                                            "bfImage":
                                                '${snapshot.data.hinhnguoidung4}',
                                            "afImage": snapshot
                                                    .data.hinhtraloi4.isNotEmpty
                                                ? '${snapshot.data.hinhtraloi4}'
                                                : ''
                                          }
                                        : {"bfImage": '', "afImage": ''},
                                  ],
                                ),
                                NoiDung(snapshot.data),
                                TinhTrang(snapshot.data),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // còn lại
          return Center(
              child: JumpingText(
            'Đang tải phản ánh...',
            style: TextStyle(color: Color(0xff3F36AE)),
          ));
        },
      ),
    );
  }
}
