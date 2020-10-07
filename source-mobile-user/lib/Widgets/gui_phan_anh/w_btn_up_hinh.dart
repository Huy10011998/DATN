import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnUpHinh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width - 30 - 40 + 8) / 4,
        height: 70,
        // Cái border nét đứt
        child: DottedBorder(
          dashPattern: [2],
          color: Color(0xff442EB5),
          strokeWidth: 1,
          child: Center(
            // hình mặc định
            child: SvgPicture.asset(
              'images/upload.svg',
              height: 26,
              color: Colors.black45,
            ),
          ),
        ));
  }
}
