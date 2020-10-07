import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnUpLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 120,
      width: 170,
      child: DottedBorder(
        dashPattern: [2],
        color: Color(0xff442EB5),
        strokeWidth: 1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/upload.svg',
                height: 38,
                color: Colors.black45,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Nhấn để tải ảnh lên!',
                style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
