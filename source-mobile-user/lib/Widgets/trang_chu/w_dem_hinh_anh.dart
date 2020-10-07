import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:flutter/material.dart';

class DemHinhAnhPa extends StatefulWidget {
  final PhanAnh demPa;
  const DemHinhAnhPa({Key key, this.demPa, PhanAnh thoigiantinhtrangpa});
  @override
  _DemHinhAnhPaState createState() => _DemHinhAnhPaState();
}

class _DemHinhAnhPaState extends State<DemHinhAnhPa> {
  int demhinh = 0;
  @override
  Widget build(BuildContext context) {
    print("aaaa: "+demhinh.toString());
    return Container(
        child: widget.demPa.hinhnguoidung1 != null &&
                widget.demPa.hinhnguoidung2 != null &&
                widget.demPa.hinhnguoidung3 != null &&
                widget.demPa.hinhnguoidung4 != null
            ? demhinh = demhinh + 1
            : Container(
                child: Text("asdasd"),
              ));
  }
}
