import 'dart:convert';
import 'package:demo_quanly/Widgets/trang_ca_nhan/model_trang_ca_nhan.dart';
import 'package:http/http.dart' as http;

class ServiceTrangCaNhan {
  //khai bao link api
  final uri =
      "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/admin/thong-tin-ca-nhan";
  //api yeu cau lay header ms chay duoc
  Future<TrangCaNhanModel> layThongTin() async {
    await new Future.delayed(new Duration(milliseconds: 500));
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-type': 'application/json',
        'app-key': 'PHANANH'
      },
      body: jsonEncode(<String, int>{"nhan_vien_id": 3}),
    );

    if (response.statusCode == 200) {
      return TrangCaNhanModel.fromJson(json.decode(response.body)['result']);
      //  var responseJson = json.decode(response.body)['result'];
      //  return responseJson.map((m) => new TrangCaNhanModel.fromJson(m));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
