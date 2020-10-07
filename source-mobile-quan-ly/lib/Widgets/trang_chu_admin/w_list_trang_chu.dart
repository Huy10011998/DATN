import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/p_chi_tiet_phan_anh.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_chu_de.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_noi_dung.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_pa_hinh.dart';
import 'package:demo_quanly/Widgets/trang_chu_admin/w_thoi_gian_tinh_trang_pa.dart';
import 'package:flutter/material.dart';

class ListTrangChu extends StatefulWidget {
  @override
  _ListTrangChuState createState() => _ListTrangChuState();
  // tao 1 ham chua list de truyen qa trang chu
  static Widget buildListView(List<PhanAnhModel> ds, bool isLoadMore) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemCount: ds.length,
          itemBuilder: (BuildContext context, int index) {
            PhanAnhModel pa = ds[index];
            if (index == ds.length - 1) {
              print("asd: " + isLoadMore.toString());
              return Container(
                  height: isLoadMore ? 40.0 : 0,
                  color: Colors.transparent,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ));
            }
            return new InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pa.tinhTrangXuLy != '3'
                            ? ChiTietPhanAnh(pa.phanAnhId, false, false)
                            : ChiTietPhanAnh(pa.phanAnhId, false, true)));
              },
              child: pa.anhnguoidung1 != "" ||
                      pa.anhnguoidung2 != "" ||
                      pa.anhnguoidung3 != "" ||
                      pa.anhnguoidung4 != ""
                  ? Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: new Card(
                          child: new Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              width: 260,
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ThoiGianTinhTrangPa(
                                      thoigiantinhtrangpa: pa,
                                    ),
                                    NoiDung(
                                      noiDungPa: pa,
                                    ),
                                    Container(
                                      height: 65,
                                      padding:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Text(
                                        pa.noiDung,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Container(child: ChuDePa(chuDePa: pa)),
                                  ])),
                        ),
                        Container(child: AnhPhanAnh(anhPhanAnh: pa))
                      ])))
                  : Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Card(
                          child: Row(children: <Widget>[
                        Container(
                            width: 260,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  ThoiGianTinhTrangPa(
                                    thoigiantinhtrangpa: pa,
                                  ),
                                  NoiDung(
                                    noiDungPa: pa,
                                  ),
                                  Container(
                                    height: 65,
                                    width: 250,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      pa.noiDung,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(child: ChuDePa(chuDePa: pa)),
                                ])),
                      ]))),
            );
          }),
    );
  }
}

class _ListTrangChuState extends State<ListTrangChu> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
