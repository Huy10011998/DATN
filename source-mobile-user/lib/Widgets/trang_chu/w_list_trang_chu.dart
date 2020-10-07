import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/p_chi_tiet_pa.dart';
import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_noi_dung_pa.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_pa_1_hinh.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_pa_2_hinh.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_pa_3_hinh.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_pa_4_hinh.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_thoi_gian_tinh_trang_pa.dart';
import 'package:flutter/material.dart';
import 'model_trang_chu.dart';

class ListTrangChu extends StatelessWidget {
  final PhanAnh pa;
  const ListTrangChu(this.pa);
  // tao 1 ham chua list de truyen qa trang chu
  Widget buildListView() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(children: <Widget>[
        // lay cac truong cua api va hien thi thoi gian tinh trang pa.
        Container(
          child: ThoiGianTinhTrangPa(
            thoigiantinhtrangpa: pa,
          ),
        ),
        // lay cac truong cua api va hien thi noi dung pa.
        Container(
          child: NoiDungPa(
            pAnh: pa,
          ),
        ),
        //hien thi 1 anh nguoi dung phan anh.
        pa.hinhnguoidung1 == "" &&
                pa.hinhnguoidung2 == "" &&
                pa.hinhnguoidung3 == ""
            ? Container(
                child: PhanAnhCo1Anh(
                pACo1Anh: pa,
              ))
            : pa.hinhnguoidung1 == "" &&
                    pa.hinhnguoidung2 == "" &&
                    pa.hinhnguoidung4 == ""
                ? Container(
                    child: PhanAnhCo1Anh(
                    pACo1Anh: pa,
                  ))
                : pa.hinhnguoidung1 == "" &&
                        pa.hinhnguoidung3 == "" &&
                        pa.hinhnguoidung4 == ""
                    ? Container(
                        child: PhanAnhCo1Anh(
                        pACo1Anh: pa,
                      ))
                    : pa.hinhnguoidung2 == "" &&
                            pa.hinhnguoidung3 == "" &&
                            pa.hinhnguoidung4 == ""
                        ? Container(
                            child: PhanAnhCo1Anh(
                            pACo1Anh: pa,
                          ))
                        :
                        //hien thi 2 anh nguoi dung phan anh.
                        pa.hinhnguoidung1 == "" && pa.hinhnguoidung2 == ""
                            ? Container(
                                child: PhanAnhCo2Anh(
                                pACo2Anh: pa,
                              ))
                            : pa.hinhnguoidung1 == "" && pa.hinhnguoidung3 == ""
                                ? Container(
                                    child: PhanAnhCo2Anh(
                                    pACo2Anh: pa,
                                  ))
                                : pa.hinhnguoidung1 == "" &&
                                        pa.hinhnguoidung4 == ""
                                    ? Container(
                                        child: PhanAnhCo2Anh(
                                        pACo2Anh: pa,
                                      ))
                                    : pa.hinhnguoidung2 == "" &&
                                            pa.hinhnguoidung3 == ""
                                        ? Container(
                                            child: PhanAnhCo2Anh(
                                            pACo2Anh: pa,
                                          ))
                                        : pa.hinhnguoidung2 == "" &&
                                                pa.hinhnguoidung4 == ""
                                            ? Container(
                                                child: PhanAnhCo2Anh(
                                                pACo2Anh: pa,
                                              ))
                                            : pa.hinhnguoidung3 == "" &&
                                                    pa.hinhnguoidung4 == ""
                                                ? Container(
                                                    child: PhanAnhCo2Anh(
                                                    pACo2Anh: pa,
                                                  ))
                                                :
                                                //hien thi 3 anh nguoi dung phan anh.
                                                pa.hinhnguoidung1 == ""
                                                    ? Container(
                                                        child: PhanAnhCo3Anh(
                                                        pACo3Anh: pa,
                                                      ))
                                                    : pa.hinhnguoidung2 == ""
                                                        ? Container(
                                                            child:
                                                                PhanAnhCo3Anh(
                                                            pACo3Anh: pa,
                                                          ))
                                                        : pa.hinhnguoidung3 ==
                                                                ""
                                                            ? Container(
                                                                child:
                                                                    PhanAnhCo3Anh(
                                                                pACo3Anh: pa,
                                                              ))
                                                            : pa.hinhnguoidung4 ==
                                                                    ""
                                                                ? Container(
                                                                    child:
                                                                        PhanAnhCo3Anh(
                                                                    pACo3Anh:
                                                                        pa,
                                                                  ))
                                                                :
                                                                //hien thi 4 anh nguoi dung phan anh.
                                                                pa.hinhnguoidung1 != "" &&
                                                                        pa.hinhnguoidung2 !=
                                                                            "" &&
                                                                        pa.hinhnguoidung3 !=
                                                                            "" &&
                                                                        pa.hinhnguoidung4 !=
                                                                            ""
                                                                    ? Container(
                                                                        child:
                                                                            PhanAnhCo4Anh(
                                                                        pACo4Anh:
                                                                            pa,
                                                                      ))
                                                                    : Container(),

        Container(
          padding: EdgeInsets.only(top: 10),
          child: Divider(
            color: Colors.blueGrey[100],
            indent: 5.0,
            endIndent: 5.0,
            height: 0.0,
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChiTietPhanAnh(pa.phanAnhId)));
      },
      child: buildListView(),
    ));
  }
}
