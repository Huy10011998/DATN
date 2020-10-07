import 'package:demo_quanly/Widgets/tra_loi_phan_anh/p_popup_tra_loi_pa.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/service_tra_loi_phan_anh.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoiDungTraLoi extends StatefulWidget {
  ValueChanged<String> onNoiDungThayDoi, onTrangThaiThayDoi;
  NoiDungTraLoi({Key key, this.onNoiDungThayDoi, this.onTrangThaiThayDoi})
      : super(key: key);
  @override
  _NoiDungTraLoiState createState() => _NoiDungTraLoiState();
}

class _NoiDungTraLoiState extends State<NoiDungTraLoi> {
  bool moTaTrong = false;
  // TextEditingController noiDungController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text

          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Nội dung trả lời',
                style: TextStyle(
                    color: ServiceTraLoiPa().getColor(moTaTrong),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              )),

          Container(
              margin: EdgeInsets.fromLTRB(20, 17, 20, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: ServiceTraLoiPa().getColorBorder(moTaTrong))),
              height: 100,
              child: TextField(
                // controller: noiDungController,

                // lấy nội dung quăng qua bên trang popup
                onChanged: (value) {
                  widget.onNoiDungThayDoi(value);
                  if (value == '')
                    setState(() {
                      moTaTrong = true;
                    });
                  else
                    moTaTrong = false;
                },
                // onTap: () {
                //   setState(() {
                //     moTaTrong = false;
                //   });
                // },
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: 'Vui lòng ghi đầy đủ quá trình xử lý phản ánh.',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    )),
                textInputAction: TextInputAction.done,
              ))
        ],
      ),
    );
  }
}
