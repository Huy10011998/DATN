import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/popup_tra_pa_thanh_cong.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/popup_tra_pa_that_bai.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/service_chi_tiet_pa.dart';
import 'package:flutter/material.dart';

class PopUpTraPa extends StatefulWidget {
  int id;
  PopUpTraPa(this.id);
  @override
  _PopUpTraPaState createState() => _PopUpTraPaState();
}

enum ListLiDo { khong_thuoc_trach_nhiem, khong_du_tham_quyen, ly_do_khac }

class _PopUpTraPaState extends State<PopUpTraPa> {
  bool moTaTrong = false;
  bool hopLe = false;
  // item mặc định
  int radioItem = 3;
  TextEditingController moTa = new TextEditingController();
  String text;

  ListLiDo _character = ListLiDo.ly_do_khac;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      // padding: EdgeInsets.all(20),
      child: new Wrap(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Trả lại phản ánh',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .8),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                child: Text(
                  'Vui lòng cho biết vì sao bạn muốn trả lại phản ánh này',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      letterSpacing: -.5),
                ),
              ),

              // các radio button
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 25,
                child: Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Color(0xff441CB0),
                      groupValue: radioItem,
                      value: 1,
                      onChanged: (val) {
                        setState(() {
                          hopLe = true;
                          radioItem = val;
                        });
                      },
                    ),
                    Text(
                      'Không thuộc trách nhiệm của phòng',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              // item
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 25,
                child: Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Color(0xff441CB0),
                      groupValue: radioItem,
                      value: 2,
                      onChanged: (val) {
                        hopLe = true;
                        setState(() {
                          radioItem = val;
                        });
                      },
                    ),
                    Text('Không đủ thẩm quyền để xử lý',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),

              // item
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 25,
                child: Row(
                  children: <Widget>[
                    Radio(
                      activeColor: Color(0xff441CB0),
                      groupValue: radioItem,
                      value: 3,
                      onChanged: (val) {
                        setState(() {
                          hopLe = false;
                          radioItem = val;
                        });
                      },
                    ),
                    Text('Lý do khác', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),

              // Khung nhập lý do
              radioItem == 3
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: moTaTrong == true
                                    ? Color(0xffff0005)
                                    : Color(0xff441CB0))),
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 70,
                        height: 70,
                        child: TextField(
                            onChanged: (t) {
                              setState(() {
                                hopLe = true;
                                moTaTrong = false;
                              });
                            },
                            controller: moTa,
                            maxLines: null,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 0, right: 10),
                                hintText: moTaTrong == false
                                    ? 'Mô tả rõ hơn về vấn đề'
                                    : 'Vui lòng nhập lí do',
                                hintStyle: moTaTrong == false
                                    ? TextStyle(
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic)
                                    : TextStyle(
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.red))),
                      ),
                    )
                  : Container(),

              // btn
              Center(
                child: InkWell(
                  onTap: () async {
                    // Chạy hàm trả phản ánh rồi chờ phản hồi lại
                    // nếu trả lại sttcode 200 tức là trả pa thành công
                    if (moTa.text.isEmpty) {
                      setState(() {
                        moTaTrong = true;
                      });
                    }

                    // id = 3 là lý do khác, phải kèm theo lí do nhập tay
                    if (radioItem == 3 && moTaTrong == false) {
                      await ServiceTraPa()
                          .traPa(radioItem, widget.id, text)
                          .then((onValue) {
                        onValue == 200
                            ? _popUpTraPaThanhCong(context)
                            : _popUpTraPaThatBai(context);
                      });
                    }

                    // còn lại k cần lí do, truyền vào ""
                    else if (radioItem == 1 || radioItem == 2) {
                      await ServiceTraPa()
                          .traPa(radioItem, widget.id, "")
                          .then((onValue) {
                        onValue == 200
                            ? _popUpTraPaThanhCong(context)
                            : _popUpTraPaThatBai(context);
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: hopLe == false
                                ? [Color(0xff8D8D8D),Color(0xff8D8D8D)]
                                : [Color(0xff441CB0), Color(0xff6C18A4)])),
                    margin: EdgeInsets.only(top: 30, bottom: 40),
                    height: 43,
                    width: 250,
                    child: Center(
                        child: Text(
                      'Đồng ý',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _popUpTraPaThanhCong(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return PopUpTraPaThanhCong();
        });
  }

  void _popUpTraPaThatBai(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return PopUpTraPaThatBai();
        });
  }
}
