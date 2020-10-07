import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_sizeconfig.dart';
import 'package:flutter/material.dart';

class PhanAnhCo4Anh extends StatefulWidget {
  final PhanAnh pACo4Anh;
  const PhanAnhCo4Anh({Key key, this.pACo4Anh}) : super(key: key);
  @override
  _PhanAnhCo4AnhState createState() => _PhanAnhCo4AnhState();
}

class _PhanAnhCo4AnhState extends State<PhanAnhCo4Anh> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.025),
      width: SizeConfig.screenHeight * 91,
      height: SizeConfig.screenWidth * 0.91,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5.0),
            width: SizeConfig.blockSizeHorizontal * 49,
            height: SizeConfig.screenWidth * 0.9,
            child: Column(
              children: <Widget>[
                Container(
                    width: SizeConfig.blockSizeHorizontal * 49,
                    height: SizeConfig.screenWidth * 0.44,
                    margin: EdgeInsets.only(bottom: 3.0),
                    child: Image.network(
                      widget.pACo4Anh.hinhnguoidung1,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 49,
                  height: SizeConfig.screenWidth * 0.44,
                  child: Image.network(
                    widget.pACo4Anh.hinhnguoidung2,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            width: SizeConfig.blockSizeHorizontal * 49,
            height: SizeConfig.screenWidth * 0.9,
            child: Column(
              children: <Widget>[
                Container(
                    width: SizeConfig.blockSizeHorizontal * 49,
                    height: SizeConfig.screenWidth * 0.44,
                    margin: EdgeInsets.only(bottom: 3.0),
                    child: Image.network(
                      widget.pACo4Anh.hinhnguoidung3,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 49,
                  height: SizeConfig.screenWidth * 0.44,
                  child: Image.network(
                    widget.pACo4Anh.hinhnguoidung4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        //: Container(),
        );
  }
}
