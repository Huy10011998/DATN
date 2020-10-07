import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:flutter/material.dart';

class WidgetPhanAnhKhongHinh extends StatelessWidget {
  final PhanAnh phanAnh;
  const WidgetPhanAnhKhongHinh({Key key, this.phanAnh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // widget phản ánh
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 82,
     
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          //Các nội dung của phản ánh
          Container(
            height: 75,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            // Chiều rộng widget = chiều rộng của màn hình - cách lề 30 - hình 100 - sized box 10
            width: MediaQuery.of(context).size.width - 30 ,
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  phanAnh.noiDung,
                  // style: hiện 2 dòng, dư text thì hiện ...
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                phanAnh.tinhTrangPa == '1'
                    ? Text("Đang xử lý...",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xffF2A13C)))
                    : Text(
                        "Đã xử lý",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff3E8AF7)),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
