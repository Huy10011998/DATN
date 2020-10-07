class ChiTietPhanAnhModel {
  final String noiDungPa;
  final String viTri;
  final String moTaViTri;
  final String thoiGianXayRaPa;
  final String thoiGianTaoPa;
  final String chuDe;
  final String tinhTrangPa;
  final String anhNguoiDung1;
  final String anhNguoiDung2;
  final String anhNguoiDung3;
  final String anhNguoiDung4;

  ChiTietPhanAnhModel(
      {this.noiDungPa,
      this.viTri,
      this.moTaViTri,
      this.thoiGianXayRaPa,
      this.thoiGianTaoPa,
      this.chuDe,
      this.tinhTrangPa,
      this.anhNguoiDung1,
      this.anhNguoiDung2,
      this.anhNguoiDung3,
      this.anhNguoiDung4
      });

  factory ChiTietPhanAnhModel.fromJson(Map<String, dynamic> json) => ChiTietPhanAnhModel(
        noiDungPa: json['noi_dung'],
        viTri: json['ten_vi_tri'],
        moTaViTri: json['dia_diem'],
        thoiGianXayRaPa: json['time_xay_ra_pa'],
        thoiGianTaoPa: json['time_tao_pa'],
        chuDe: json['ten_chu_de'],
        tinhTrangPa: json['tinh_trang_pa'],
        anhNguoiDung1: json['anh_nguoi_dung1'],
        anhNguoiDung2: json['anh_nguoi_dung2'],
        anhNguoiDung3: json['anh_nguoi_dung3'],
        anhNguoiDung4: json['anh_nguoi_dung4'],
      );
}



class LiDoTraPhanAnh {
  String liDo;
  int index;
  LiDoTraPhanAnh({this.liDo, this.index});
}
