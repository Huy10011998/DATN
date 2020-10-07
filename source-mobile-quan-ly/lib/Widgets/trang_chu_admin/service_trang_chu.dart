// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:demo_quanly/Widget/trang_chu_admin/model_trang_chu.dart';

// class ServicePhanAnh {
//   int perPage = 10;
//   int totalItem = 0;
//   int currentPage = 1;
//   bool isLoadMore = false;
//   double scroll;
//   //khai bao link api
//   final uri =
//       "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/admin/load-phong";
//   //api yeu cau lay header ms chay duoc
//   final headers = <String, String>{
//     'Content-type': 'application/json',
//     'app-key': 'PHANANH'
//   };
//   List<PhanAnhModel> listPhanAnh = new List<PhanAnhModel>();

//   //gui yeu cau lay ds api
//   Future<dynamic> layDSPhanAnh(
//     //int page
//     ) async {
//     dynamic data = {};
//     String listcount;

//     // await new Future.delayed(new Duration(seconds: 2));
//     Map<String, int> request = {"page": currentPage, "per_page": perPage};
//     final response =
//         await http.post(uri, headers: headers, body: json.encode(request));
//     if (response.statusCode == 200) {
//       List responseJson = json.decode(response.body)['result'];
//       listcount = json.decode(response.body)['count'];
//       if (listPhanAnh.length == 0 ||
//           listPhanAnh.length < totalItem && isLoadMore) {
//         responseJson.forEach(
//             (item) => {listPhanAnh.add(new PhanAnhModel.fromJson(item))});
//         isLoadMore = false;
//       }
//     }
//     data["result"] = listPhanAnh;
//     data["count"] = listcount;

//     return data;
//   }

//   //gui yeu cau lay so luong ds trong api.
//   // Future getTotalItem() async {
//   //   Map<String, int> request = {"page": currentPage, "per_page": perPage};
//   //   var body = json.encode(request);
//   //   final response = await http.post(uri, headers: headers, body: body);
//   //   return json.decode(response.body)['count'];
//   // }

// //bien dung de load more.
//   getTotalPage() {
//     var diviner = (totalItem / perPage) == 1
//         ? (totalItem ~/ perPage)
//         : (totalItem ~/ perPage) + 1;
//     return diviner;
//   }
// }
import 'dart:convert';
import 'package:demo_quanly/Widgets/trang_chu_admin/model_trang_chu.dart';
import 'package:http/http.dart' as http;

class ServicePhanAnh {
  int perPage = 10;
  int totalItem = 0;
  int currentPage = 1;
  bool isLoadMore = false;
  double scroll;
  //khai bao link api
  final uri =
      "http://apidemo.lamgigio.net/cong-phan-anh/100//api/phan-anh/admin/load-phong";
  //api yeu cau lay header ms chay duoc
  final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };
  //gui yeu cau lay ds api
  List<PhanAnhModel> listPhanAnh = new List<PhanAnhModel>();
  Future<List<PhanAnhModel>> layDSPhanAnh() async {
    await new Future.delayed(new Duration(milliseconds: 500));
    Map<String, int> request = {"page": currentPage, "per_page": perPage};
    final response =
        await http.post(uri, headers: headers, body: json.encode(request));
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body)['result'];
      if (listPhanAnh.length == 0 ||
          listPhanAnh.length < totalItem && isLoadMore) {
        responseJson.forEach(
            (item) => {listPhanAnh.add(new PhanAnhModel.fromJson(item))});
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
