import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoiDung extends StatelessWidget {
  String chuDe;
  String noiDung;
  String viTri;
  String moTaViTri;
  String thoiGianXayRa;
  String thoiGianTaoPa;

  NoiDung(this.chuDe, this.noiDung, this.viTri, this.moTaViTri,
      this.thoiGianXayRa, this.thoiGianTaoPa);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Chủ đề
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Phản ánh:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  chuDe,
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                )
              ],
            ),

            // text
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10.0, bottom: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: .4, color: Colors.black12))),
              child: Text(
                noiDung,
                style: TextStyle(
                    fontSize: 15, wordSpacing: .8, fontWeight: FontWeight.w400),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Địa điểm
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 130,
                  child: Text(
                    'Địa điểm:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),

                // Mô tả vị trí không bắt buộc nhập nên phải kiểm tra
                moTaViTri == null
                    ? Text(viTri,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14))
                    : Text(viTri + "\n" + moTaViTri,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14))
              ],
            ),

            SizedBox(
              height: 10,
            ),

            // Thời gian
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 130,
                  child: Text(
                    'Thời gian:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),

                // Thời gian xảy ra k bắt buộc nhập nên phải ktra
                thoiGianXayRa == null
                    ? Text(thoiGianTaoPa,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14))
                    : Text(thoiGianXayRa + "\n" + thoiGianTaoPa,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14)),
              ],
            )
          ],
        ));
  }
}
