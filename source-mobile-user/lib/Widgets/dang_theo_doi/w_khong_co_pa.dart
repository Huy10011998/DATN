import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KhongCoPhanAnh extends StatelessWidget {
  const KhongCoPhanAnh({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: 1,
          child: new SvgPicture.asset(
            'images/1178428.svg',
            height: 130,
            width: 130,
            allowDrawingOutsideViewBox: true,
          ),
          // Image.asset('images/thanhcongicon.png', height: 150),
        ),
        SizedBox(height: 10),
        Text(
          "Không có phản ánh nào !",
          style: TextStyle(
            color: Color(0xff3F36AE),
            fontSize: 19, 
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
