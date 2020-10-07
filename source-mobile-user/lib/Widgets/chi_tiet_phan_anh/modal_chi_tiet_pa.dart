class ChiTietPhanAnhModel {
  //khai bao cac truong data.
  final String timeXayRaPa;
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
  final int soluonghinh;
  final String diaDiem;
  final String tenChuDe;
  final String timeTaoPa;
  final String timeTlPa;
  final String noiDungTl;
  final String fileDinhKem;

  ChiTietPhanAnhModel(
      {this.timeXayRaPa,
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
      this.soluonghinh,
      this.diaDiem,
      this.tenChuDe,
      this.timeTaoPa,
      this.timeTlPa,
      this.noiDungTl,
      this.fileDinhKem
      });

//cach map cac truong ma api tra ve va gan vao bien da tao
  factory ChiTietPhanAnhModel.fromJson(Map<String, dynamic> json) => ChiTietPhanAnhModel(
        timeXayRaPa: json['time_xay_ra_pa'],
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
        diaDiem: json['dia_diem'],
        tenChuDe: json['ten_chu_de'],
        timeTaoPa: json['time_tao_pa'],
        timeTlPa: json['time_tl_pa'],
        noiDungTl: json['noi_dung_tl'],
        fileDinhKem: json['file_dinh_kem'],
      );
}
