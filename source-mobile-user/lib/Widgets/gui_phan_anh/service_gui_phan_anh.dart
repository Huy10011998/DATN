import 'dart:convert';
import 'dart:ui';
import 'package:demo_trangchu/Widgets/gui_phan_anh/modal_gui_pa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


// Api tạo phản ánh mới
Future taoPhanAnh(String link1, link2, link3, link4, noiDung, chuDeId, timeXayRa,
    viTriId, moTa) async {
  String url =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/tao-pa';
  Map<String, String> headers = {
    'app-key': 'PHANANH'
  };

  var json = {
    "link_hinh_anh_1": link1,
    "link_hinh_anh_2": link2,
    "link_hinh_anh_3": link3,
    "link_hinh_anh_4": link4,
    "noi_dung": noiDung,
    "chu_de_id": chuDeId,
    "time_xay_ra_pa": timeXayRa, 
    "vi_tri_id": viTriId, 
    "mo_ta_dia_diem": moTa,
    "nhan_vien_id": "0"
  };

  Response response = await http.post(url, headers: headers, body: json).catchError((onError){
    print(onError);
  });
print(response);
  // Lấy id phản ánh mới tạo trong response
  Map<String, dynamic> res = jsonDecode(response.body);
  var id = res['result']['phan_anh_id'];

  int statusCode = response.statusCode;
  statusCode == 200
      ? print('Add thanh cong ! id: ' + id.toString() + '   stt code: ' + statusCode.toString())
      : print("Add that bai ! :" + response.body);
    return {"sttCode":200,"id":id};  
}

// Truyền vào biến kiểm tra xem textfield đã được nhập hay chưa,
// nếu chưa nhập thì trả về màu đỏ, nếu nhập rồi thì trả về màu chuẩn
Color getColor(bool kiemTraTrong) {
  if (kiemTraTrong == true)
    return Colors.red;
  else
    return Color(0xff442eb5);
}

// Lấy danh sách chủ đề từ api
Future<List<ChuDe>> fetchChuDe(http.Client client) async {
  final response = await http.get(
      "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/get-chu-de",
      headers: <String, String>{
        'Content-type': 'application/json',
        'app-key': 'PHANANH'
      });

  if (response.statusCode == 200) {
    final parsed =
        json.decode(response.body)["result"].cast<Map<String, dynamic>>();
    return parsed.map<ChuDe>((json) => ChuDe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load');
  }
}

// Lấy danh sách vị trí từ api
Future<List<ViTri>> fetchViTri(http.Client client) async {
  final response = await http.get(
      "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/get-vi-tri",
      headers: <String, String>{
        'Content-type': 'application/json',
        'app-key': 'PHANANH'
      });
  
  if (response.statusCode == 200) {
    final parsed =
        json.decode(response.body)["result"].cast<Map<String, dynamic>>();
    return parsed.map<ViTri>((json) => ViTri.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load');
  }
}
