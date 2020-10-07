import 'dart:convert';

import 'package:demo_trangchu/Util/sqflite/service_id_pa_dang_theo_doi.dart';
import 'package:demo_trangchu/Widgets/dang_theo_doi/model_pa_dang_theo_doi.dart';
import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:http/http.dart' as http;

class ServicePhanAnhDangTheoDoi {
  List<int> dsId = [];
  //khai bao link api
  static final uri =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/theo-doi';
  //api yeu cau p lay header moi chay dc.
  static final headers = <String, String>{
    'Content-type': 'application/json',
    'app-key': 'PHANANH'
  };

  ///input: danh sách id đang theo dõi
  Future<List<PhanAnh>> taoDanhSachPhanAnhDangTheoDoi(List<int> dsId) async {
    try {
      //truyền lên danh sách id đang theo dõi
      // List<int> dsId = [750,751, 753, 754];
      Map<String, List<int>> request = {"list_id": dsId};
      final response = await http.post(ServicePhanAnhDangTheoDoi.uri,
          headers: ServicePhanAnhDangTheoDoi.headers, body: json.encode(request));
      //truong hop thanh cong thi tra ve ds PA.
      if (response.statusCode == 200) {
        print('Gửi API thành công');
        return phanAnhFromJson(response.body);
      } else
        print('Gửi API thất bại');
    } catch (ex) {
      print('Lỗi api');

      print(ex);
      throw ex;
    }
  }

  // add id vào db
  void addId(id) async {
    final db = TasksDB();
    final idTask = new IdDangTheoDoi(
      id_phan_anh: id,
    );
    await db.insert(idTask);
  }


    // add id vào db
  void deleteId(id) async {
    final db = TasksDB();
    await db.delete(id);
  }
  

  // hàm lấy dữ liệu từ sqflite
  // Trả về dữ liệu dạng dynamic
  Future getIds() async {
    final db = TasksDB();

    // lấy dữ liệu cho từ sqflite vào jsonTuDb
    List<IdDangTheoDoi> jsonTuDb = await db.getIds();

    // Chạy forEach, lấy từng cái id_phan_anh add vào dsId( kiểu List<int> )
    jsonTuDb.forEach((f) {
      dsId.add(f.id_phan_anh);
    });
    return dsId;
  }
  
  // Hàm kiểm tra xem phản ánh có ảnh hay không
  // có thì return true, không thì return false
  bool ktTonTaiHinh(pa) {
    if (pa.hinhnguoidung1.isEmpty &&
        pa.hinhnguoidung2.isEmpty &&
        pa.hinhnguoidung3.isEmpty &&
        pa.hinhnguoidung4.isEmpty)
      return true;
    else
      return false;
  }
}
