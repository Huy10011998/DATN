import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_sizeconfig.dart';
import 'package:flutter/material.dart';

class PhanAnhCo2Anh extends StatefulWidget {
  final PhanAnh pACo2Anh;
  const PhanAnhCo2Anh({Key key, this.pACo2Anh}) : super(key: key);
  @override
  _PhanAnhCo2AnhState createState() => _PhanAnhCo2AnhState();
}

class _PhanAnhCo2AnhState extends State<PhanAnhCo2Anh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.pACo2Anh.hinhnguoidung1 == "" &&
              widget.pACo2Anh.hinhnguoidung2 == "" //2 anh
          ? Container(
              margin: EdgeInsets.only(left: 2),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 5, left: 5.0),
                      width: SizeConfig.blockSizeHorizontal * 48,
                      height: SizeConfig.screenWidth,
                      child: Image.network(
                        widget.pACo2Anh.hinhnguoidung3,
                        fit: BoxFit.fill
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom:5, left: 5.0),
                      width: SizeConfig.blockSizeHorizontal * 48,
                      height: SizeConfig.screenWidth,
                      child: Image.network(
                        widget.pACo2Anh.hinhnguoidung4,
                        fit: BoxFit.fill,
                      )),
                ],
              ))
          : widget.pACo2Anh.hinhnguoidung1 == "" &&
                  widget.pACo2Anh.hinhnguoidung3 == "" //2anh
              ? Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 5, left: 5.0),
                          width: SizeConfig.blockSizeHorizontal * 48,
                          height: SizeConfig.screenWidth,
                          child: Image.network(
                            widget.pACo2Anh.hinhnguoidung2,
                            fit: BoxFit.fill,
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 5, left: 5.0),
                          width: SizeConfig.blockSizeHorizontal * 48,
                          height: SizeConfig.screenWidth,
                          child: Image.network(
                            widget.pACo2Anh.hinhnguoidung4,
                            fit: BoxFit.fill,
                          )),
                    ],
                  ))
              : widget.pACo2Anh.hinhnguoidung1 == "" &&
                      widget.pACo2Anh.hinhnguoidung4 == "" //2anh
                  ? Container(
                      margin: EdgeInsets.only(left: 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 5, left: 5.0),
                              width: SizeConfig.blockSizeHorizontal * 48,
                              height: SizeConfig.screenWidth,
                              child: Image.network(
                                widget.pACo2Anh.hinhnguoidung2,
                                fit: BoxFit.fill,
                              )),
                          Container(
                              margin: EdgeInsets.only(bottom: 5, left: 5.0),
                              width: SizeConfig.blockSizeHorizontal * 48,
                              height: SizeConfig.screenWidth,
                              child: Image.network(
                                widget.pACo2Anh.hinhnguoidung3,
                                fit: BoxFit.fill,
                              )),
                        ],
                      ))
                  : widget.pACo2Anh.hinhnguoidung2 == "" &&
                          widget.pACo2Anh.hinhnguoidung3 == "" //2anh
                      ? Container(
                          margin: EdgeInsets.only(left: 2),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin:
                                      EdgeInsets.only(bottom: 5, left: 5.0),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.screenWidth,
                                  child: Image.network(
                                    widget.pACo2Anh.hinhnguoidung1,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                  margin:
                                      EdgeInsets.only(bottom: 5, left: 5.0),
                                  width: SizeConfig.blockSizeHorizontal * 48,
                                  height: SizeConfig.screenWidth,
                                  child: Image.network(
                                    widget.pACo2Anh.hinhnguoidung4,
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ))
                      : widget.pACo2Anh.hinhnguoidung2 == "" &&
                              widget.pACo2Anh.hinhnguoidung4 == "" //2anh
                          ? Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: 5, left: 5.0),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 48,
                                      height: SizeConfig.screenWidth,
                                      child: Image.network(
                                        widget.pACo2Anh.hinhnguoidung1,
                                        fit: BoxFit.fill,
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: 5, left: 5.0),
                                      width:
                                          SizeConfig.blockSizeHorizontal * 48,
                                      height: SizeConfig.screenWidth,
                                      child: Image.network(
                                        widget.pACo2Anh.hinhnguoidung3,
                                        fit: BoxFit.fill,
                                      )),
                                ],
                              ))
                          : widget.pACo2Anh.hinhnguoidung3 == "" &&
                                  widget.pACo2Anh.hinhnguoidung4 == "" //2anh
                              ? Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 5, left: 5.0),
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  48,
                                          height: SizeConfig.screenWidth,
                                          child: Image.network(
                                            widget.pACo2Anh.hinhnguoidung1,
                                            fit: BoxFit.fill,
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 5, left: 5.0),
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  48,
                                          height: SizeConfig.screenWidth,
                                          child: Image.network(
                                            widget.pACo2Anh.hinhnguoidung2,
                                            fit: BoxFit.fill,
                                          )),
                                    ],
                                  ))
                              : Container(),
    );
  }
}
