import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceTraLoiPa {
  static final String url =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/admin/tra-loi';
  static final Map<String, String> headers = {
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  Future<int> traLoiPhanAnh(String noiDung, link1, link2, link3, link4, int id) async {
    print('its okkkkkk');
    Map<String, dynamic> body = {
      "noi_dung_tl": noiDung,
      "nhan_vien_id": "3",
      "file_dinh_kem": "",
      "anh1": link1,
      "anh2": link2,
      "anh3": link3,
      "anh4": link4,
      "phan_anh_id": id,
      "tinh_trang_xu_ly": "3"
    };

    final response = await http.post(ServiceTraLoiPa.url.toString(),
        headers: ServiceTraLoiPa.headers, body: json.encode(body));

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Trả lời pa thành công');
    } else {
      throw Exception('Trả lời pa thất bại');
    }
    return response.statusCode;
  }

  Color getColor(bool kiemTraTrong) {
    if (kiemTraTrong == true)
      return Colors.red;
    else
      return Colors.black;
  }

  Color getColorBorder(bool kiemTraTrong) {
    if (kiemTraTrong == true)
      return Colors.red;
    else
      return Colors.black12;
  }
}
