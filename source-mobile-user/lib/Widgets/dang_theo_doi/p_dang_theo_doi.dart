import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/p_chi_tiet_pa.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/service_pa_dang_theo_doi.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/w_khong_co_pa.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/w_phan_anh_item.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/w_phan_anh_khong_hinh_item.dart';
import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class DangTheoDoi extends StatefulWidget {
  @override
  _DangTheoDoiPageState createState() => _DangTheoDoiPageState();
}

class _DangTheoDoiPageState extends State<DangTheoDoi> {
  List<int> danhSachIdDangTheoDoi = [];
  Future<List<PhanAnh>> _futureDanhSachPhanAnhDangTheoDoi;
  ServicePhanAnhDangTheoDoi servicePa;

  @override
  void initState() {
    servicePa = new ServicePhanAnhDangTheoDoi();

    // đợi thằng getIds chạy xong rồi trả về cái onValue,
    // là cái dsId được return ở trên
    // chạy xong thì chạy cái getData, truyền cái dsId qua xử lý API
    servicePa.getIds().then((onValue) {
      this.getDATA(onValue);

      setState(() {
        danhSachIdDangTheoDoi = onValue;
      });
      // nếu chạy lỗi thì in lỗi ra hoặc làm gì đó
    }).catchError((e) {
      print(e);
    });

    super.initState();
  }

  // value là cái onValue ở trên, trả về dsId
  getDATA(value) {
    _futureDanhSachPhanAnhDangTheoDoi =
        servicePa.taoDanhSachPhanAnhDangTheoDoi(value);
  }

  @override
  Widget build(BuildContext context) {
    print("trang chu : " + danhSachIdDangTheoDoi.toString());

    // Kiểm tra: nếu không có id đã lưu nào thì return màn hình KhongCoPhanAnh
    // ngược lại, return màn hình danh sách phản ánh đã lưu
    return danhSachIdDangTheoDoi.length == 0
        ? KhongCoPhanAnh()
        :

        // Danh sách phản ánh đang theo dõi
        Center(
            child: FutureBuilder<List<PhanAnh>>(
              // truyền vào 1 future
              future: servicePa.taoDanhSachPhanAnhDangTheoDoi(danhSachIdDangTheoDoi),
              builder: (context, snapshot) {
                // Kiểm tra xem dữ liệu trả về có data không
                if (snapshot.hasData) {
                  // nếu có data trả về thì hiện cái dòng tiêu đề và list phản ánh đang theo dõi
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // đây là dòng text
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Phản ánh đang theo dõi:",
                            style: TextStyle(
                                color: Color(0xff3F36AE),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          // Danh sách phản ánh
                          // Mỗi phản ánh trả về trong snapshot, gọi WidgetPhanAnh() để vẽ phản ánh
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              // Gọi hàm Kiểm tra xem phản ánh này có hình không
                              // và trả về widget tương ứng
                              return InkWell(
                                  onTap: () {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChiTietPhanAnh(
                                              snapshot.data[index].phanAnhId)),
                                    ).then((onValue) {
                                      /* khi bên chi tiết pop về có truyền tham số
                                      * nếu là true thì xoá cái id này trong list đi
                                      * false thì thôi không làm gì cả */
                                      if (onValue == true)
                                        setState(() {
                                          danhSachIdDangTheoDoi.remove(
                                              snapshot.data[index].phanAnhId);
                                        });
                                        print('object');
                                    });

                                    // print(result);
                                    // if (result == true)
                                    // setState(() {
                                    //   danhSachIdDangTheoDoi.remove(snapshot.data[index].phanAnhId);
                                    // });

                                    // .then((onValue){
                                    //   print(onValue);
                                    //   // setState(() {
                                    //   //   danhSachIdDangTheoDoi.remove(snapshot.data[index].phanAnhId);
                                    //   // });
                                    // });
                                    // // .catchError((e){
                                    // //   print(e);
                                    // // });
                                  },
                                  child: servicePa.ktTonTaiHinh(
                                              snapshot.data[index]) ==
                                          false
                                      ? WidgetPhanAnh(
                                          phanAnh: snapshot.data[index])
                                      : WidgetPhanAnhKhongHinh(
                                          phanAnh: snapshot.data[index]));
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }

                //truong hop loi
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // Trường hợp đang kết nối tới máy chủ thì hiện hiệu ứng
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return JumpingText(
                    'Đang tải...',
                    style: TextStyle(color: Color(0xff3F36AE)),
                  );
                }

                // Nếu không rơi vào các trường hợp trên thì chạy cái vòng tròn quay quay
                return CircularProgressIndicator();
              },
            ),
          );
  }
}
