class TrangCaNhanModel {
  final anhDaiDien;
  final tenPhongBan;
  final tenNhanVien;

  TrangCaNhanModel({
    this.anhDaiDien,
    this.tenNhanVien,
    this.tenPhongBan,
  });

  factory TrangCaNhanModel.fromJson(Map<String, dynamic> json) =>
      TrangCaNhanModel(
        anhDaiDien: json['anh_dai_dien'],
        tenPhongBan: json['ten_phong_ban'],
        tenNhanVien: json['ten_nhan_vien'],
      );
}
