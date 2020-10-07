import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/btn_tra_loi_btn_huy_nhan.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/model_chi_tiet_pa.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/service_chi_tiet_pa.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/w_btn_nhan_phan_anh.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/w_list_hinh.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/w_noi_dung_phan_anh.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/w_thong_tin_xu_ly.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/w_tra_lai_phan_anh.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: must_be_immutable
class ChiTietPhanAnh extends StatefulWidget {
  int id;
  bool daNhan = false;
  bool daTraLoi = false;

  ChiTietPhanAnh(this.id, this.daNhan, this.daTraLoi);

  @override
  _ChiTietPhanAnhState createState() => _ChiTietPhanAnhState();
}

class _ChiTietPhanAnhState extends State<ChiTietPhanAnh> {
  Future<ChiTietPhanAnhModel> futureChiTietPa;

  @override
  void initState() {
    futureChiTietPa = ServiceChiTiet(widget.id).fetchChiTietPa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffD4D4D4),
        appBar: AppBar(
          // back button
          leading: BackButton(
            color: Colors.white,
          ),

          // banner
          flexibleSpace: Image.asset(
            'assets/images/Banner.png',
            fit: BoxFit.fitWidth,
          ),

          title: Text('Chi tiết'),
        ),

        //noi dung
        body: FutureBuilder(
          future: futureChiTietPa,
          builder: (context, snapshot) {
            var pa = snapshot.data;
            // api trả về có data
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: <Widget>[
                          /* slider hình ảnh
                          * kiểm tra xem phản ánh này có hình hay không, nếu có thì mới hiện list hình
                          * chỉ cần kiểm tra link đầu tiên, vì khi người dùng add sẽ được lưu hình theo thứ tự
                          */
                          pa.anhNguoiDung1 != ''
                              ? SliderHinhAnh([
                                  pa.anhNguoiDung1,
                                  pa.anhNguoiDung2,
                                  pa.anhNguoiDung3,
                                  pa.anhNguoiDung4
                                ])
                              : Container(),

                          // nội dung
                          NoiDung(
                            pa.chuDe,
                            pa.noiDungPa,
                            pa.viTri,
                            pa.moTaViTri,
                            pa.thoiGianXayRaPa,
                            pa.thoiGianTaoPa,
                          ),


                          widget.daTraLoi == false
                              ?
                              // thông tin
                              ThongTin("3 ngày")
                              : Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Phản ánh đã được xử lý',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Vui lòng chờ phê duyệt !'),
                                    ],
                                  ),
                                ),

                          /* Trả lại phản ánh
                          *  Nếu chưa nhận thì hiện
                          *  Còn nhận phản ánh rồi thì không hiện
                          */
                          widget.daTraLoi == false ?
                          widget.daNhan == false
                              ? Center(
                                  child: Padding(
                                  // Padding cái bottom để không bị dính lề
                                  padding: const EdgeInsets.only(bottom: 250),
                                  child: TraPhanAnh(widget.id),
                                ))
                              : Container()
                              : Container(),
                        ],
                      ),
                    ),
                  ),

                  /*  Nếu phản ánh chưa có ai nhận thì hiện nút slider
                  *  Nếu có người nhận rồi thì hiện nút trả lời và nút huỷ nhận
                  */
                  widget.daTraLoi == false
                      ? widget.daNhan == false
                          ? Positioned(
                              left:
                                  (MediaQuery.of(context).size.width - 300) / 2,
                              bottom: 40,
                              child: BtnNhanPhanAnh(widget.id))
                          : Positioned(
                              left:
                                  (MediaQuery.of(context).size.width - 300) / 2,
                              bottom: 40,
                              child: BtnTraLoiHuyNhan(widget.id),
                            )
                      : Container(),
                ],
              );
              // api trả về lỗi
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // Lúc chưa trả về gì cả thì hiện loading
            return Center(
                child: JumpingText(
              'Loading...',
              style: TextStyle(color: Color(0xff441CB0)),
            ));
          },
        ));
  }
}
