import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderHinhAnh extends StatefulWidget {
  List<String> linksHinh;
  SliderHinhAnh(this.linksHinh);

  @override
  _SliderHinhAnhState createState() => _SliderHinhAnhState();
}

class _SliderHinhAnhState extends State<SliderHinhAnh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // rộng full màn, tỷ lệ 16 :9
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 16 * 9,
      child: Carousel(
        dotBgColor: Color(0xff00ffffff),
        dotSize: 10,
        dotSpacing: 20,
        dotIncreasedColor: Color(0xff441CB0),
        // onImageTap: ,
        autoplay: false,
        images: [
          // chắc chắn có hình 1
          NetworkImage('${widget.linksHinh[0]}'),

          // kiểm tra coi có hình các hình sau không
          widget.linksHinh[1].isNotEmpty
              ? NetworkImage('${widget.linksHinh[1]}')
              : null,
          widget.linksHinh[2].isNotEmpty
              ? NetworkImage('${widget.linksHinh[2]}')
              : null,
          widget.linksHinh[3].isNotEmpty
              ? NetworkImage('${widget.linksHinh[3]}')
              : null
        ],
      ),
    );
  }
}
