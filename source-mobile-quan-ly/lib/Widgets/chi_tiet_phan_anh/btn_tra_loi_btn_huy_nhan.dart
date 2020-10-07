import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/service_chi_tiet_pa.dart';
import 'package:demo_quanly/Widgets/menu_bar/w_menu_bar.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/p_popup_tra_loi_pa.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class BtnTraLoiHuyNhan extends StatefulWidget {
  int id;
  BtnTraLoiHuyNhan(this.id);

  @override
  _BtnTraLoiHuyNhanState createState() => _BtnTraLoiHuyNhanState();
}

class _BtnTraLoiHuyNhanState extends State<BtnTraLoiHuyNhan> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //Trả lời pa
        InkWell(
          onTap: () {
            _popupTraLoiPa();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff441CB0), Color(0xff6C18A4)])),
            height: 43,
            width: 170,
            child: Center(
                child: Text(
              'Trả lời phản ánh',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            )),
          ),
        ),

        //
        SizedBox(
          width: 15,
        ),

        // Huỷ nhận
        InkWell(
          onTap: () {
            return Alert(
              context: context,
              type: AlertType.info,
              title: "Xác nhận",
              desc: "Nhấn Đồng ý để huỷ nhận phản ánh",
              style: AlertStyle(
                  descStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              buttons: [
                DialogButton(
                  radius: BorderRadius.circular(3),
                  child: Text(
                    "Huỷ",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Color(0xff808D8D8D),
                ),
                DialogButton(
                    radius: BorderRadius.circular(3),
                    child: Text(
                      "Đồng ý",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () async {
                      await ServiceHuyNhanPa()
                          .huyNhanPhanAnh(widget.id)
                          .then((onValue) {
                        // Tạo cái snackbar để hiện thông báo
                        final snackBar = SnackBar(
                          content: onValue == 200
                              ? Text('Huỷ nhận phản ánh thành công !')
                              : Text('Huỷ nhận phản ánh thất bại !'),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);

                        onValue == 200
                            ? Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThanhTabBar()),
                                (Route<dynamic> route) => false,
                              )
                            : Navigator.pop(
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                context,
                              );
                      });
                    },
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff441CB0), Color(0xff6C18A4)]))
              ],
            ).show();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            height: 43,
            width: 115,
            child: Center(
                child: Text(
              'Huỷ nhận',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            )),
          ),
        ),
      ],
    );
  }

  _popupTraLoiPa() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return PopUpTraLoiPhanAnh(widget.id);
        });
  }
}
