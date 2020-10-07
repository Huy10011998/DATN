class DangNhapResponse {
  final int code;
  final String messager;
  final String nhanVienID;
  final String nhanVienGuid;
  final String contactId;
  final String hoTen;
  final String image;
  final String loai;
  final String email;
  final String khoaVietTat;

  DangNhapResponse(
      {this.code,
      this.messager,
      this.nhanVienID,
      this.nhanVienGuid,
      this.contactId,
      this.hoTen,
      this.image,
      this.loai,
      this.email,
      this.khoaVietTat});

  factory DangNhapResponse.fromJson(Map<String, dynamic> json) {
    return DangNhapResponse(
      code: json['code'],
      messager: json['messager'],
      nhanVienID: json['NhanVienID'],
      nhanVienGuid: json['NhanVienGuid'],
      contactId: json['contact_id'],
      hoTen: json['Ho_Ten'],
      image: json['image  '],
      loai: json['loai'],
      email: json['email'],
      khoaVietTat: json['khoa_viet_tat'],
    );
  }
}

class DangNhapThatBaiResponse {
  final int code;
  final String message;

  DangNhapThatBaiResponse({this.code, this.message});

  factory DangNhapThatBaiResponse.fromJson(Map<String, dynamic> json) {
    return DangNhapThatBaiResponse(
      code: json['code'],
      message: json['message'],
    );
  }
}
