// Tạo đối tượng Chủ đề
class ChuDe {
  final String ten_chu_de;
  final int id_chu_de;

  ChuDe({
    this.ten_chu_de,
    this.id_chu_de,
  });

  factory ChuDe.fromJson(Map<String, dynamic> json) {
    return ChuDe(
      ten_chu_de: json["ten_chu_de"],
      id_chu_de: json["chu_de_id"],
    );
  }
}

// Tạo đối tượng vị trí
class ViTri {
  final String ten_vi_tri;
  final String id_vi_tri;

  ViTri({
    this.ten_vi_tri,
    this.id_vi_tri,
  });

  factory ViTri.fromJson(Map<String, dynamic> json) {
    return ViTri(
      ten_vi_tri: json["ten_vi_tri"],
      id_vi_tri: json["vi_tri_id"],
    );
  }
}


// Đối tượng nút bấm
class ButtonTagModel {
  String title;
  int idChuDe;
  bool onSelected;

  ButtonTagModel({this.onSelected, this.title, this.idChuDe});
}
