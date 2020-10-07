import 'dart:convert';

import 'package:demo_trangchu/Widgets/trang_chu/service_trang_chu.dart';

class PhanAnh {
  //khai bao cac truong data.
  final String timeXayRaPa;
  final String thoi_gian_tra_loi;
  final String noiDung;
  final String tinhTrangPa;
  final String tenViTri;
  final String hinhnguoidung1;
  final String hinhnguoidung2;
  final String hinhnguoidung3;
  final String hinhnguoidung4;
  final String hinhtraloi1;
  final String hinhtraloi2;
  final String hinhtraloi3;
  final String hinhtraloi4;
  final int phanAnhId;

  PhanAnh({
    this.timeXayRaPa,
    this.thoi_gian_tra_loi,
    this.noiDung,
    this.tinhTrangPa,
    this.tenViTri,
    this.hinhnguoidung1,
    this.hinhnguoidung2,
    this.hinhnguoidung3,
    this.hinhnguoidung4,
    this.hinhtraloi1,
    this.hinhtraloi2,
    this.hinhtraloi3,
    this.hinhtraloi4,
    this.phanAnhId,
  });

//cach map cac truong ma api tra ve va gan vao bien da tao
  factory PhanAnh.fromJson(Map<String, dynamic> json) => PhanAnh(
        timeXayRaPa: json['thoi_gian_tao_pa'],
        thoi_gian_tra_loi: json['thoi_gian_tra_loi'],
        noiDung: json['noi_dung'],
        tinhTrangPa: json['tinh_trang_pa'],
        phanAnhId: json['phan_anh_id'],
        tenViTri: json['ten_vi_tri'],
        hinhnguoidung1: json['anh_nguoi_dung1'],
        hinhnguoidung2: json['anh_nguoi_dung2'],
        hinhnguoidung3: json['anh_nguoi_dung3'],
        hinhnguoidung4: json['anh_nguoi_dung4'],
        hinhtraloi1: json['anh_nguoi_tl1'],
        hinhtraloi2: json['anh_nguoi_tl2'],
        hinhtraloi3: json['anh_nguoi_tl3'],
        hinhtraloi4: json['anh_nguoi_tl4'],
      );
}

//chuyen du lieu api tra ve thanh json va map vao list phan anh.
List<PhanAnh> phanAnhFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<PhanAnh>.from(
      data["result"].map((item) => PhanAnh.fromJson(item)));
}
