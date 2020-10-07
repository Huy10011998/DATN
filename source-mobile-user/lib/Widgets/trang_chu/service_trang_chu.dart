import 'dart:convert';
import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:http/http.dart' as http;

class ServicePhanAnh {
  int perPage = 10;
  int totalItem = 0;
  int currentPage = 1;
  bool isLoadMore = true;
  bool canLoadMore = true;

  //khai bao link api
  static final uri =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/danh-sach';
  //api yeu cau p lay header moi chay dc.
  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };
  //gui yeu cau lay ds api.
  List<PhanAnh> listPhanAnh = List<PhanAnh>();
  Future<List<PhanAnh>> layDSPhanAnh() async {
    await new Future.delayed(new Duration(seconds: 2));
    Map<String, int> request = {"page": currentPage, "per_page": perPage};
    final response = await http.post(ServicePhanAnh.uri,
        headers: ServicePhanAnh.headers, body: json.encode(request));
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body)['result'];
      if (listPhanAnh.length == 0 ||
          listPhanAnh.length < totalItem && isLoadMore) {
        responseJson
            .forEach((item) => {listPhanAnh.add(new PhanAnh.fromJson(item))});
        isLoadMore = false;
      }
    }
    return listPhanAnh;
  }

  // ignore: missing_return
  // Future<List<PhanAnh>> layDSPhanAnh2() async {
  //   try {
  //     await new Future.delayed(new Duration(seconds: 2));
  //     Map<String, int> request = {"page": currentPage, "per_page": perPage};
  //     if (perPage <= 0) return [];
  //     final response = await http.post(ServicePhanAnh.uri,
  //         headers: ServicePhanAnh.headers, body: json.encode(request));
  //     //truong hop thanh cong thi tra ve ds PA.
  //     if (response.statusCode == 200) {
  //       print('Gửi API thành công');
  //       return phanAnhFromJson(response.body)
  //           .skip((currentPage - 1) * perPage)
  //           .take(perPage)
  //           .toList();
  //     } else
  //       print('Gửi API thất bại');
  //   } catch (ex) {
  //     print('Lỗi api');
  //     print(ex);
  //     throw ex;
  //   }
  // }

  //gui yeu cau lay so luong ds trong api.
  Future getTotalItem() async {
    Map<String, int> request = {"page": currentPage, "per_page": perPage};
    var body = json.encode(request);
    final response = await http.post(ServicePhanAnh.uri,
        headers: ServicePhanAnh.headers, body: body);
    return json.decode(response.body)['count'];
  }

//   //bien dung de load more
  getTotalPage() {
    var diviner = (totalItem / perPage) == 1
        ? (totalItem ~/ perPage)
        : (totalItem ~/ perPage) + 1;
    return diviner;
  }
}
