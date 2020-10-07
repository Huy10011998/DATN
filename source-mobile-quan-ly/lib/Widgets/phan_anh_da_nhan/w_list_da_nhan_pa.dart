import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/p_chi_tiet_phan_anh.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_anh_pa_da_nhan.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_chu_de_pa_da_nhan.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_noi_dung.dart';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_thoi_gian_tinh_trang_pa_da_nhan.dart';
import 'package:flutter/material.dart';

class ListDaNhanPA extends StatefulWidget {
  @override
  _ListDaNhanPAState createState() => _ListDaNhanPAState();
  static Widget buildListViewPaDaNhan(List<PhanAnhDaNhan> ds, bool isLoadMore) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: ds.length,
            itemBuilder: (BuildContext context, int index) {
              PhanAnhDaNhan pa = ds[index];
              if (index == ds.length - 1) {
                print("kkk: " + isLoadMore.toString());
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
                          builder: (context) => pa.tinhTrangXuLy == '3'
                              ? ChiTietPhanAnh(pa.phanAnhId, true, true)
                              : ChiTietPhanAnh(pa.phanAnhId, true, false)));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ThoiGianTinhTrangPaDaNhan(
                                          thoigiantinhtrangpadanhan: pa,
                                        ),
                                        NoiDungPaDaNhan(
                                          noiDungPaDaNhan: pa,
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
                                        Container(
                                            child: ChuDePaDaNhan(
                                                chuDePaDaNhan: pa)),
                                      ]))),
                          Container(
                              child: AnhPhanAnhDaNhan(anhPhanAnhDaNhan: pa))
                        ])))
                    : Container(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Card(
                            child: Row(children: <Widget>[
                          Container(
                              //width: 260,
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ThoiGianTinhTrangPaDaNhan(
                                      thoigiantinhtrangpadanhan: pa,
                                    ),
                                    NoiDungPaDaNhan(
                                      noiDungPaDaNhan: pa,
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
                                    Container(
                                        child:
                                            ChuDePaDaNhan(chuDePaDaNhan: pa)),
                                  ]))
                        ]))),
              );
            }));
  }
}

class _ListDaNhanPAState extends State<ListDaNhanPA> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
