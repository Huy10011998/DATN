import 'dart:convert';
import 'package:demo_quanly/Widgets/dang_nhap/model_dang_nhap.dart';
import 'package:http/http.dart' as http;

class ServiceDangNhap {
  static final url =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/auth/login';

  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<dynamic> dangNhap(String userName, passWord) async {
    Map<String, String> body = {"username": userName, "password": passWord};

    final response = await http.post(ServiceDangNhap.url.toString(),
        headers: ServiceDangNhap.headers, body: json.encode(body));

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Đăng nhập thành công');
      return DangNhapResponse.fromJson(json.decode(response.body)["result"]);
    }
    if (response.statusCode == 500) {
      return DangNhapThatBaiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Có lỗi');
    }
  }
}
