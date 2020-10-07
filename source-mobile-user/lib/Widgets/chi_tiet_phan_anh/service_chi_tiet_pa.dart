import 'dart:convert';
import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/modal_chi_tiet_pa.dart';
import 'package:http/http.dart' as http;

class ServiceChiTiet {
  int id;
  ServiceChiTiet(this.id);
  static final uri =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/chi-tiet-pa?phan_anh_id=' ;

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<ChiTietPhanAnhModel> fetchChiTietPa() async{
    final response = await http.get(ServiceChiTiet.uri+id.toString(),
        headers: ServiceChiTiet.headers);

    if (response.statusCode == 200) {
      return ChiTietPhanAnhModel.fromJson(json.decode(response.body)["result"]);
    } else {
      throw Exception('Loi khi lay phan anh');
    }
  }
}
