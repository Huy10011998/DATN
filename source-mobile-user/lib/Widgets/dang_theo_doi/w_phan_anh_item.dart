
import 'package:flutter/material.dart';

import '../trang_chu/model_trang_chu.dart';

class WidgetPhanAnh extends StatelessWidget {
  final PhanAnh phanAnh;
  const WidgetPhanAnh({Key key, this.phanAnh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // widget phản ánh
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 82,
      // Chia theo hàng, gồm 2 wigdet lớn là hình và nội dung
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Hình mô tả
          Container(
            width: 100,
            height: 75,
            // Tạo ảnh mặc định khi hình từ internet chưa load kịp 
            child: FadeInImage.assetNetwork(placeholder: 'images/apartment.png', image: '${phanAnh.hinhnguoidung1}') 
          ),

          SizedBox(
            width: 10,
          ),

          //Các nội dung của phản ánh
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            // Chiều rộng widget = chiều rộng của màn hình - cách lề 30 - hình 100 - sized box 10
            width: MediaQuery.of(context).size.width - 30 - 100 - 10,
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
                        "Đã xử lý ${phanAnh.thoi_gian_tra_loi}",
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
