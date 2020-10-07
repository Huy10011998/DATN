import 'dart:convert';
import 'package:demo_quanly/Widgets/phan_anh_da_nhan/w_model_pa_da_nhan.dart';
import 'package:http/http.dart' as http;

class ServicePhanAnhDaNhan {
  int perPage = 10;
  int totalItem = 0;
  int currentPage = 1;
  bool isLoadMore = false;

  //khai bao link api
  final uri =
      "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/admin/phan-anh-da-nhan";
  //api yeu cau lay header ms chay duoc
  final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };
  //gui yeu cau lay ds api
  List<PhanAnhDaNhan> listPhanAnh = new List<PhanAnhDaNhan>();
  Future<List<PhanAnhDaNhan>> layDSPhanAnhDaNhan() async {
    await new Future.delayed(new Duration(milliseconds: 500));
    Map<String, int> request = {
      "page": currentPage,
      "per_page": perPage,
      "nhan_vien_id": 3
    };
    final response =
        await http.post(uri, headers: headers, body: json.encode(request));
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body)['result'];
      if (listPhanAnh.length == 0 ||
          listPhanAnh.length < totalItem && isLoadMore) {
        responseJson.forEach(
            (item) => {listPhanAnh.add(new PhanAnhDaNhan.fromJson(item))});
        isLoadMore = false;
      }
    }
    return listPhanAnh;
  }

  //gui yeu cau lay so luong ds trong api.
  Future getTotalItem() async {
    Map<String, int> request = {"page": currentPage, "per_page": perPage};
    var body = json.encode(request);
    final response = await http.post(uri, headers: headers, body: body);
    return json.decode(response.body)['count'];
  }

//bien dung de load more.
  getTotalPage() {
    var diviner = (totalItem / perPage) == 1
        ? (totalItem ~/ perPage)
        : (totalItem ~/ perPage) + 1;
    return diviner;
  }
}
