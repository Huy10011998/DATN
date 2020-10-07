import 'package:demo_trangchu/Widgets/chi_tiet_phan_anh/modal_chi_tiet_pa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: must_be_immutable
class TinhTrang extends StatelessWidget {
  ChiTietPhanAnhModel phanAnh;
  TinhTrang(this.phanAnh);
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        

        // Tạo phần nền xanh đằng sau thông tin xử lý
        Container(
          color: Color(0xff3F36AE),
          height: 30,
        ),

        // phần thông tin xử lý
        Container(
          margin: EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // tinh trang
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          'Tình trạng:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),

                      // Tình trạng =3 là đã xử lý, bằng 1 là chưa xử lý
                      phanAnh.tinhTrangPa == '3'
                          ? Text('Đã xử lý',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff3E8AF7)))
                          : Row(
                              children: <Widget>[
                                Text('Đang xử lý ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffF2A13C))),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: ScalingText(
                                    '...',
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xffF2A13C)),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),

                  // thoi gian, nếu là phản ánh đã xử lý thì hiện, chưa xử lý thì k hiện
                  phanAnh.tinhTrangPa == '3' ?
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'images/clock.svg',
                        width: 13,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        phanAnh.timeTlPa,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  )
                  : Container()
                ],
              ),

              // Noi dung xu ly
              SizedBox(
                height: 15,
              ),

              phanAnh.tinhTrangPa == '3'
                  ? Text(
                      phanAnh.noiDungTl,
                      style: TextStyle(fontSize: 15),
                    )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
