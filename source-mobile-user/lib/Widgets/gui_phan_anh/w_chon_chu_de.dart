import 'package:demo_trangchu/Widgets/gui_phan_anh/modal_gui_pa.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/service_gui_phan_anh.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_button_tag.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

class ChonChuDe extends StatefulWidget {
  // Hàm trả ngược id được chọn qua bên pop_up_gui_phan_anh để gọi api
  ValueChanged<String> callBack;
  ChonChuDe({this.callBack});
  @override
  _ChonChuDeState createState() => _ChonChuDeState();
}

class _ChonChuDeState extends State<ChonChuDe> {
  // Khởi tạo list Các đối tượng ButtonTagModel
  List<ButtonTagModel> list = new List<ButtonTagModel>();
  int idChuDeDuocChon;

  @override
  Widget build(BuildContext context) {
    //Toàn bộ widget chủ đề
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),

      // Dạng cột, dòng text là 1 w, danh sách chủ đề là 1 w
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Dòng text
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                'Chủ đề (*):',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff442eb5)),
              )),

          // Lấy danh sách chủ đề từ API
          FutureBuilder(
              future: fetchChuDe(http.Client()),
              builder: (BuildContext context,AsyncSnapshot<List<ChuDe>> snapshot) {
                // Có lỗi thì in ra
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // Add các chủ đề lấy từ api vô List
                // Vì mỗi lần SetState nó chạy hàm này 1 lần
                // nên kiểm list có phải là list trống không,
                // đúng thì mới add
                // Đồng thời phải kiểm tra có data trong snapshot không,
                // Vì nếu lúc chạy mà data chưa kịp vào thì bị lỗi
                if (list.isEmpty && snapshot.hasData)
                  for (int i = 0; i < snapshot.data.length; i++) {
                    list.add(ButtonTagModel(
                        title: snapshot.data[i].ten_chu_de,
                        idChuDe: snapshot.data[i].id_chu_de,
                        // Theo thiết kế sẽ có 1 chủ đề được chọn mặc định
                        // nên set onSelected của chủ đề đầu tiên là true
                        onSelected: i == 0 ? true : false));
                  }

                //Kiểm tra xem có data không
                if (snapshot.hasData) {
                  if (idChuDeDuocChon == null) {
                    widget.callBack(list[0].idChuDe.toString());
                  }
                  // Có thì dùng wrap để hiển thị các chủ đề theo kiểu wrap
                  return Container(
                    child: Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      // map list thành widget để in ra màn hình
                      children: list
                          .map((e) => ButtonTag(
                                pa: e,
                                init: e.onSelected,
                                onSelected: (b) => _onSelected(
                                  b,
                                  e.title,
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }
                // Không có thì làm gì đó, tính sau
                else
                  Container();
                return Center(
                  child: JumpingText(
                    'Đang tải chủ đề...',
                    style: TextStyle(color: Color(0xff3F36AE)),
                  ),
                );
                
              }),
        ],
      ),
    );
  }

  _onSelected(bool b, String t) {
    /// Kết quả trả ra khi nhấn
    print('$t $b');

    // Tạo mảng mới
    List<ButtonTagModel> listUpdate = list
        // Nếu như nó là cái phản ánh vừa thay đổi trạng thái thì truyền cái b vào onSelected
        // Cái b này đã được xử lý bên kia, đại khái khi nhấn vào thì onSelected = !onSelected
        // Còn nếu nó k phải là phản ánh mới được click thì set onSelect cho nó là false
        .map((e) => e.title == t
            ? ButtonTagModel(title: e.title, idChuDe: e.idChuDe, onSelected: b)
            : ButtonTagModel(
                title: e.title, idChuDe: e.idChuDe, onSelected: false))
        .toList();

    setState(() {
      // gán list bằng cái cái list vừa update để vẽ lại giao diện
      list = listUpdate;
      listUpdate.forEach((f) => {
            if (f.onSelected == true)
              {
                // Lưu lại cái id này để gọi api
                idChuDeDuocChon = f.idChuDe,
              }
          });
    });
    // Đem cái id được chọn nhét vào callBack
    widget.callBack(
      idChuDeDuocChon.toString(),
    );
  }
}
