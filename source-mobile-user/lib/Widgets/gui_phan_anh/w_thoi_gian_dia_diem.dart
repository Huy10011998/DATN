import 'package:demo_trangchu/Widgets/gui_phan_anh/modal_gui_pa.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/service_gui_phan_anh.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';

class ThoiGianDiaDiem extends StatefulWidget {
  ValueChanged<String> callBack;
  ThoiGianDiaDiem({this.callBack});
  @override
  _ThoiGianDiaDiemState createState() => _ThoiGianDiaDiemState();
}

bool viTriTrong = false;
String viTriToaNha;

final thoiGianController = TextEditingController();
final moTaThemController = TextEditingController();

class _ThoiGianDiaDiemState extends State<ThoiGianDiaDiem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Thời gian
        Container(
          padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text
              Container(
                margin: EdgeInsets.only(top: 5),
                width: 120,
                child: Text(
                  'Thời gian:',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff442eb5)),
                ),
              ),

              Container(
                  width: MediaQuery.of(context).size.width - 120 - 30,
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff442EB5))),
                  child: TextField(
                    controller: thoiGianController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 1,
                        hintText: 'Ví dụ: tối T6, ngày 16/6/2019...',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        )),
                  ))
            ],
          ),
        ),

        // Địa điểm
        Container(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text
              Container(
                margin: EdgeInsets.only(top: 5),
                width: 120,
                child: Text(
                  'Địa điểm (*):',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: getColor(viTriTrong)),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //drop down chọn địa điểm
                  Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: getColor(viTriTrong))),
                    child: FutureBuilder<List<ViTri>>(
                      future: fetchViTri(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return DropdownButton<String>(
                            underline: Container(),
                            hint: Text("Chọn toà nhà  "),
                            value: viTriToaNha,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            items: snapshot.data.map((item) {
                              return DropdownMenuItem<String>(
                                child: Text(item.ten_vi_tri),
                                value: item.id_vi_tri,
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                widget.callBack(
                                  newValue,
                                );
                                viTriToaNha = newValue;
                                viTriTrong = false;
                              });
                            },
                          );
                        if (snapshot.hasError) return Container();
                        return JumpingText(
                          'Đang tải vị trí...',
                          style: TextStyle(color: Color(0xff3F36AE)),
                        );
                      },
                    ),
                  ),

                  // mô tả thêm

                  Container(
                      margin: EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width - 120 - 30,
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xff442EB5))),
                      child: TextField(
                        controller: moTaThemController,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintMaxLines: 1,
                            hintText: 'Mô tả thêm về địa điểm',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                ],
              )
            ],
          ),
        ),
        viTriTrong == true
            ? Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 15, top: 5),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '* Vui lòng chọn toà nhà ',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
