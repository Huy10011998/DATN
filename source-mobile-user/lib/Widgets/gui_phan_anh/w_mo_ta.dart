import 'package:demo_trangchu/Widgets/gui_phan_anh/service_gui_phan_anh.dart';
import 'package:flutter/material.dart';

class MoTaVanDe extends StatefulWidget {
  final ValueChanged<bool> onChangedText;
  MoTaVanDe({Key key, this.onChangedText}) : super(key: key);

  @override
  _MoTaVanDeState createState() => _MoTaVanDeState();
}

bool moTaTrong = false;
var moTaController = TextEditingController();

class _MoTaVanDeState extends State<MoTaVanDe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Dòng Text
          Container(
              margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text(
                'Mô tả vấn đề (*):',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: getColor(moTaTrong)),
              )),

          //Chỗ nhập nội dung
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: getColor(moTaTrong))),
                  height: 150,
                  child: TextFormField(
                    controller: moTaController,
                    // onTap: () {
                    //   setState(() {
                    //     moTaTrong = false;
                    //   });
                    // },
                    onChanged: (value) {
                      value == ''
                          ? setState(() {
                              moTaTrong = true;
                              widget.onChangedText(true);
                            })
                          : setState(() {
                              moTaTrong = false;
                              widget.onChangedText(false);
                            });
                    },
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 2,
                        hintText:
                            'Xin vui lòng mô tả chi tiết vấn đề để được hỗ trợ sớm nhất.',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    textInputAction: TextInputAction.done,
                  )),

              // Kiểm tra text field đã được nhập chưa,
              // nếu chưa thì xuất hiện thông báo
              moTaTrong == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        '* Vui lòng mô tả vấn đề',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}
