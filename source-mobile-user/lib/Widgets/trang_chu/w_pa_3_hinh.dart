import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_sizeconfig.dart';
import 'package:flutter/material.dart';

class PhanAnhCo3Anh extends StatefulWidget {
  final PhanAnh pACo3Anh;
  const PhanAnhCo3Anh({Key key, this.pACo3Anh}) : super(key: key);
  @override
  _PhanAnhCo3AnhState createState() => _PhanAnhCo3AnhState();
}

class _PhanAnhCo3AnhState extends State<PhanAnhCo3Anh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.pACo3Anh.hinhnguoidung1 == "" //3anh
          ? Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.025,
                  left: SizeConfig.screenWidth * 0.025),
              width: SizeConfig.screenHeight * 91,
              height: SizeConfig.screenWidth * 0.91,
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 2, left: 5.0),
                      width: SizeConfig.blockSizeHorizontal * 47,
                      height: SizeConfig.screenWidth,
                      child: Image.network(
                        widget.pACo3Anh.hinhnguoidung2,
                        fit: BoxFit.fill,
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    width: SizeConfig.blockSizeHorizontal * 45,
                    height: SizeConfig.screenWidth * 0.9,
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: SizeConfig.blockSizeHorizontal * 45,
                            height: SizeConfig.screenWidth * 0.44,
                            margin: EdgeInsets.only(bottom: 3.0),
                            child: Image.network(
                              widget.pACo3Anh.hinhnguoidung3,
                              fit: BoxFit.fill,
                            )),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 45,
                          height: SizeConfig.screenWidth * 0.44,
                          child: Image.network(
                            widget.pACo3Anh.hinhnguoidung4,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
          : widget.pACo3Anh.hinhnguoidung2 == "" //3anh
              ? Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.025,
                      left: SizeConfig.screenWidth * 0.025),
                  width: SizeConfig.screenHeight * 91,
                  height: SizeConfig.screenWidth * 0.91,
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(bottom: 2, left: 5.0),
                          width: SizeConfig.blockSizeHorizontal * 47,
                          height: SizeConfig.screenWidth,
                          child: Image.network(
                            widget.pACo3Anh.hinhnguoidung1,
                            fit: BoxFit.fill,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        width: SizeConfig.blockSizeHorizontal * 45,
                        height: SizeConfig.screenWidth * 0.9,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 45,
                                height: SizeConfig.screenWidth * 0.44,
                                margin: EdgeInsets.only(bottom: 3.0),
                                child: Image.network(
                                  widget.pACo3Anh.hinhnguoidung3,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              width: SizeConfig.blockSizeHorizontal * 45,
                              height: SizeConfig.screenWidth * 0.44,
                              child: Image.network(
                                widget.pACo3Anh.hinhnguoidung4,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
              : widget.pACo3Anh.hinhnguoidung3 == "" //3 anh
                  ? Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.025,
                          left: SizeConfig.screenWidth * 0.025),
                      width: SizeConfig.screenHeight * 91,
                      height: SizeConfig.screenWidth * 0.91,
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 2, left: 5.0),
                              width: SizeConfig.blockSizeHorizontal * 47,
                              height: SizeConfig.screenWidth,
                              child: Image.network(
                                widget.pACo3Anh.hinhnguoidung1,
                                fit: BoxFit.fill,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                            width: SizeConfig.blockSizeHorizontal * 45,
                            height: SizeConfig.screenWidth * 0.9,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    width: SizeConfig.blockSizeHorizontal * 45,
                                    height: SizeConfig.screenWidth * 0.44,
                                    margin: EdgeInsets.only(bottom: 3.0),
                                    child: Image.network(
                                      widget.pACo3Anh.hinhnguoidung2,
                                      fit: BoxFit.fill,
                                    )),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 45,
                                  height: SizeConfig.screenWidth * 0.44,
                                  child: Image.network(
                                    widget.pACo3Anh.hinhnguoidung4,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                  : widget.pACo3Anh.hinhnguoidung4 == "" //3anh
                      ? Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.025,
                              left: SizeConfig.screenWidth * 0.025),
                          width: SizeConfig.screenHeight * 91,
                          height: SizeConfig.screenWidth * 0.91,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(bottom: 2, left: 5.0),
                                  width: SizeConfig.blockSizeHorizontal * 47,
                                  height: SizeConfig.screenWidth,
                                  child: Image.network(
                                    widget.pACo3Anh.hinhnguoidung1,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: 5.0),
                                width: SizeConfig.blockSizeHorizontal * 45,
                                height: SizeConfig.screenWidth * 0.9,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        width: SizeConfig.blockSizeHorizontal *
                                            45,
                                        height: SizeConfig.screenWidth * 0.44,
                                        margin: EdgeInsets.only(bottom: 3.0),
                                        child: Image.network(
                                          widget.pACo3Anh.hinhnguoidung2,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 45,
                                      height: SizeConfig.screenWidth * 0.44,
                                      child: Image.network(
                                        widget.pACo3Anh.hinhnguoidung3,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                      : Container(),
    );
  }
}
