import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/p_chi_tiet_phan_anh.dart';
import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/service_chi_tiet_pa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slider_button/slider_button.dart';

// ignore: must_be_immutable
class BtnNhanPhanAnh extends StatefulWidget {
  int id;
  BtnNhanPhanAnh(this.id);

  @override
  _BtnNhanPhanAnhState createState() => _BtnNhanPhanAnhState();
}

class _BtnNhanPhanAnhState extends State<BtnNhanPhanAnh> {
  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () async {
        // Chạy hàm nhận phản ánh rồi chờ phản hồi lại
        // nếu trả lại sttcode 200 tức là nhận pa thành công
        await ServiceNhanPa().nhanPhanAnh(widget.id, 3).then((onValue) {
          onValue == 200
          // push kiểu này sẽ k có hiệu ứng cuộn trang
              ? Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          ChiTietPhanAnh(widget.id, true, false)))
              : Container();
        });
      },
      label: Text(
        "Vuốt phải để nhận",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17),
      ),
      icon: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
          width: 35,
          color: Colors.white,
        ),
      ),
      width: 300,
      height: 60,
      radius: 5,
      buttonColor: Color(0xff441CB0),
      backgroundColor: Color(0xff8D8D8D),
      highlightedColor: Color(0xff3F36AE),
      baseColor: Colors.white,
    );
  }
}
