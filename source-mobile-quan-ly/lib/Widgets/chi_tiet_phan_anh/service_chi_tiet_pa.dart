import 'dart:convert';

import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/model_chi_tiet_pa.dart';
import 'package:http/http.dart' as http;

class ServiceChiTiet {
  int id;
  ServiceChiTiet(this.id);
  static final urlChiTietPa =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/chi-tiet-pa?phan_anh_id=';

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<ChiTietPhanAnhModel> fetchChiTietPa() async {
    final response = await http.get(ServiceChiTiet.urlChiTietPa + id.toString(),
        headers: ServiceChiTiet.headers);

    if (response.statusCode == 200) {
      return ChiTietPhanAnhModel.fromJson(json.decode(response.body)["result"]);
    } else {
      throw Exception('Lỗi khi láy chi tiết phản ánh');
    }
  }
}

class ServiceNhanPa {

  static final urlNhanPa =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/admin/nhan-phan-anh';

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<int> nhanPhanAnh(int id, int nhanVienId) async {
    Map<String, int> body = {"phan_anh_id": id, "nhan_vien_id": 3};


    final response = await http.post(ServiceNhanPa.urlNhanPa.toString(),
        headers: ServiceNhanPa.headers, body: json.encode(body));

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Nhận phản ánh thành công');
    } else {
      throw Exception('Nhận phản ánh thất bại');
    }
    return response.statusCode;
  }
}

class ServiceTraPa {

  static final urlTraPa =
      'http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/admin/tra-phan-anh';

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<int> traPa(int itemId, int phanAnhId, String giaiThich) async {

    Map<String, dynamic> body = {
    "item_id": itemId,
    "phan_anh_id": phanAnhId,
    "giai_thich": "$giaiThich"
  };

    final response = await http.post(ServiceTraPa.urlTraPa.toString(),
        headers: ServiceTraPa.headers, body: json.encode(body));

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Trả phản ánh thành công');
    } else {
      throw Exception('Trả phản ánh thất bại');
    }
    return response.statusCode;
  }
}


class ServiceHuyNhanPa {

  static final urlHuyNhanPa =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/admin/huy-nhan-phan-anh';

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<int> huyNhanPhanAnh(int id) async {
    // Map<String, int> body = {"nhan_vien_id": id, "phan_anh_id": nhanVienId};
    Map<String, int> body = {"phan_anh_id": id};

    final response = await http.post(ServiceHuyNhanPa.urlHuyNhanPa.toString(),
        headers: ServiceHuyNhanPa.headers, body: json.encode(body));

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Huỷ nhận phản ánh thành công');
    } else {
      throw Exception('Huỷ nhận phản ánh thất bại');
    }
    return response.statusCode;
  }
}
