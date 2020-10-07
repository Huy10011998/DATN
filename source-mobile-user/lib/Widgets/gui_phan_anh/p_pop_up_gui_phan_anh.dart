import 'package:demo_trangchu/Widgets/gui_phan_anh/multi_image.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/service_gui_phan_anh.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_gui_thanh_cong.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_gui_that_bai.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_mo_ta.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_thanh_chuc_nang.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_thoi_gian_dia_diem.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_chon_chu_de.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_indicators/progress_indicators.dart';

class PopUpGuiPhanAnh extends StatefulWidget {
  @override
  _PopUpGuiPhanAnhState createState() => _PopUpGuiPhanAnhState();
}

class _PopUpGuiPhanAnhState extends State<PopUpGuiPhanAnh> {
  String idChuDe;
  bool isDone = false;
  int trangThai = 0;
  bool isEmpty = true;
  bool isNotChoose = true;

  @override
  void initState() {
    super.initState();
    // Xoá mô tả và vị trí đã chọn lúc trước
    moTaController.clear();
    viTriToaNha = null;
    // Cái check nhập, khi báo lỗi tắt bottom sheet mở lại vẫn còn, 
    // nên phải set cho nó luôn
    moTaTrong = false;
    viTriTrong = false;
  }

  var hihi = {
    'link0': "",
    'link1': "",
    'link2': "",
    'link3': "",
  };
  @override
  Widget build(BuildContext context) {
    // widget cửa sổ mở lên
    return Container(
      height: MediaQuery.of(context).size.height - 57,
      decoration: BoxDecoration(
          color: Color(0xfff4f3f3),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Thanh chức năng
            ThanhChucNang(),

            // Gọi wiget up hình
            ViewMultiImage(
              valueImage: (valueImage) {
                setState(() {
                  valueImage.asMap().forEach((i, f) {
                    hihi['link$i'] = f;
                  });
                });
                print(valueImage);
              },
              statusUpload: (STATUSUPLOAD status) {
                print(status);
                setState(() {
                  this.isDone = status == STATUSUPLOAD.DONE ? true : false;
                  if (status == STATUSUPLOAD.LOADING)
                      trangThai = 2;
                  else if ( status != STATUSUPLOAD.ERROR && this.isEmpty == false && this.isNotChoose == false)
                      trangThai = 1;
                });
              },
            ),

            // Gọi widget mô tả vấn đề
            MoTaVanDe(
              onChangedText: (value) {
                setState(() {
                  this.isEmpty = value;
                  if (this.isEmpty == false && this.isNotChoose == false)
                    trangThai = 1;
                });
              }, 
            ),

            // Gọi widget chủ đề, đồng thời gọi callBack để lấy id chủ đề được chọn
            // rồi gán nó vào idChuDe
            ChonChuDe(
              callBack: (value) {
                idChuDe = value;
                print("Id chủ đề được chọn:  " + value);
              },
            ),

            // Gọi widget nhập thời gian, địa điểm
            ThoiGianDiaDiem(
              callBack: (value) {
                setState(() {
                  if (value.isNotEmpty) this.isNotChoose = false;
                  if (this.isEmpty == false && this.isNotChoose == false )
                    trangThai = 1;
                });
              },
            ),

            // dòng note
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  '(*): Không được bỏ trống.',
                  style: TextStyle(
                      color: Color(0xff442EB5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )),


            
            // Button
            /* Mới vào trạng thái = 0
            * Nút gửi mờ đi, không gửi được
            */
            if (trangThai == 0)
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        /**
                           * Nhấn vào nút thì chạy hàm dưới để thông báo
                           */
                        _checkViTriMoTa(moTaController, viTriToaNha);
                      },
                      child: Container(
                        width: 250,
                        height: 45,
                        color: Color(0xff8D8D8D),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SvgPicture.asset(
                              'images/plane.svg',
                              width: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Gửi đến ban quản lý',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))

                  // Tất cả đều ok
            else if (trangThai == 1 )
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // Kiểm tra xem đã nhập mô tả với chọn vị trí chưa
                        // Nếu chưa thì setState lại, để gọi api hàm bên dưới không chạy
                        _checkViTriMoTa(moTaController, viTriToaNha);
                        print(this.isDone);

                     
                          taoPhanAnh(
                                  hihi['link0'],
                                  hihi['link1'],
                                  hihi['link2'],
                                  hihi['link3'],
                                  moTaController.text,
                                  idChuDe,
                                  thoiGianController.text,
                                  viTriToaNha,
                                  moTaThemController.text)
                              .then((onValue) {
                            // GỌi api xong thì kiểm tra sttcode,
                            // 200 ra page gửi thành công
                            if (onValue["sttCode"] == 200) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GuiThanhCongPage(
                                          idPa: onValue["id"],
                                        )),
                              );
                            }
                            // ngược lại ra page gửi thất bại
                            else
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GuiThatBaiPage()),
                              );
                          });
                        
                      },
                      child: Container(
                        width: 250,
                        height: 45,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff3F36AE),
                              Color(0xff6C18A4)
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SvgPicture.asset(
                              'images/plane.svg',
                              width: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Gửi đến ban quản lý',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            else
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        /**
                           * Nhấn vào nút thì chạy hàm dưới để thông báo
                           */
                        _checkViTriMoTa(moTaController, viTriToaNha);
                      },
                      child: Container(
                        width: 250,
                        height: 45,
                        color: Color(0xff8D8D8D),
                        child: Center(
                          child: JumpingText(
                        'Đang tải ảnh lên...',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }

  _checkViTriMoTa(TextEditingController moTaController, viTriToaNha) {
    if (moTaController.text.isEmpty) {
      setState(() {
        moTaTrong = true;
      });
    }
    if (viTriToaNha == null) {
      setState(() {
        viTriTrong = true;
      });
    }
  }
}
