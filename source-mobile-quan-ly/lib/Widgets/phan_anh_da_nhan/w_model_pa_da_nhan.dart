class PhanAnhDaNhan {
  final String noiDung;
  final String tinhTrangXuLy;
  final String tenChuDe;
  final String thoigiantaoPA;
  final String timeTaoPA;
  final String hotenNV;
  final String tenViTri;
  final String anhnguoidung1;
  final String anhnguoidung2;
  final String anhnguoidung3;
  final String anhnguoidung4;
  final String anhtraloi1;
  final String anhtraloi2;
  final String anhtraloi3;
  final String anhtraloi4;
  final int phanAnhId;

  PhanAnhDaNhan({
    this.timeTaoPA,
    this.noiDung,
    this.tinhTrangXuLy,
    this.tenChuDe,
    this.thoigiantaoPA,
    this.hotenNV,
    this.tenViTri,
    this.anhnguoidung1,
    this.anhnguoidung2,
    this.anhnguoidung3,
    this.anhnguoidung4,
    this.anhtraloi1,
    this.anhtraloi2,
    this.anhtraloi3,
    this.anhtraloi4,
    this.phanAnhId
  });

  factory PhanAnhDaNhan.fromJson(Map<String, dynamic> json) => PhanAnhDaNhan(
        noiDung: json['noi_dung'],
        tinhTrangXuLy: json['tinh_trang_xu_ly'],
        timeTaoPA: json['time_tao_pa'],
        tenChuDe: json['ten_chu_de'],
        thoigiantaoPA: json['thoi_gian_tao_pa'],
        hotenNV: json['ho_ten'],
        tenViTri: json['ten_vi_tri'],
        anhnguoidung1: json['anh_nguoi_dung1'],
        anhnguoidung2: json['anh_nguoi_dung2'],
        anhnguoidung3: json['anh_nguoi_dung3'],
        anhnguoidung4: json['anh_nguoi_dung4'],
        anhtraloi1: json['anh_nguoi_tl1'],
        anhtraloi2: json['anh_nguoi_tl2'],
        anhtraloi3: json['anh_nguoi_tl3'],
        anhtraloi4: json['anh_nguoi_tl4'],
        phanAnhId: json['phan_anh_id'],
      );
}