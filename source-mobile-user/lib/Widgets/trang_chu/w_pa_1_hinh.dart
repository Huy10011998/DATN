import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_sizeconfig.dart';
import 'package:flutter/material.dart';

class PhanAnhCo1Anh extends StatefulWidget {
  final PhanAnh pACo1Anh;

  const PhanAnhCo1Anh({Key key, this.pACo1Anh}) : super(key: key);

  @override
  _Co1AnhState createState() => _Co1AnhState();
}

class _Co1AnhState extends State<PhanAnhCo1Anh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.pACo1Anh.hinhnguoidung1 == "" &&
              widget.pACo1Anh.hinhnguoidung2 == "" &&
              widget.pACo1Anh.hinhnguoidung3 == "" //1 Anh
          ? Container(
              child: Container(
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                child: Image.network(widget.pACo1Anh.hinhnguoidung4,
                    fit: BoxFit.fitWidth),
              ),
            )
          : widget.pACo1Anh.hinhnguoidung1 == "" &&
                  widget.pACo1Anh.hinhnguoidung2 == "" &&
                  widget.pACo1Anh.hinhnguoidung4 == "" //1 Anh
              ? Container(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    child: Image.network(widget.pACo1Anh.hinhnguoidung3,
                        fit: BoxFit.fitWidth),
                  ),
                )
              : widget.pACo1Anh.hinhnguoidung1 == "" &&
                      widget.pACo1Anh.hinhnguoidung3 == "" &&
                      widget.pACo1Anh.hinhnguoidung4 == "" //1 Anh
                  ? Container(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        child: Image.network(widget.pACo1Anh.hinhnguoidung2,
                            fit: BoxFit.fitWidth),
                      ),
                    )
                  : widget.pACo1Anh.hinhnguoidung2 == "" &&
                          widget.pACo1Anh.hinhnguoidung3 == "" &&
                          widget.pACo1Anh.hinhnguoidung4 == "" //1 Anh
                      ? Container(
                          child: Container(
                            height: SizeConfig.screenWidth,
                            width: SizeConfig.blockSizeHorizontal * 95,
                            margin:
                                EdgeInsets.only(bottom: 5, left: 5, right: 5),
                            child: Image.network(widget.pACo1Anh.hinhnguoidung1,
                                fit: BoxFit.fitWidth),
                          ),
                        )
                      : Container(),
    );
  }
}
