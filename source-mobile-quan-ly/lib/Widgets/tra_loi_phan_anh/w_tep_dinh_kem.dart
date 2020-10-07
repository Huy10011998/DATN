import 'dart:io';

import 'package:flutter/material.dart';

class TepDinhKem extends StatefulWidget {
  @override
  _TepDinhKemState createState() => _TepDinhKemState();
}

class _TepDinhKemState extends State<TepDinhKem> {
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      color: Color(0xffffffff),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Text
          0 != 0
              //
              //
              //
              //
              //
              //
              //
              //
              //
              //
              ? Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: RichText(
                      text: TextSpan(
                          // set the default style for the children TextSpans
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color:
                                  imageFile == null ? Colors.red : Colors.blue),
                          children: [
                        TextSpan(
                          text: 'Tệp đính kèm ',
                        ),
                        TextSpan(
                            text: '(không bắt buộc)',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.red)),
                      ])))
              : Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: RichText(
                      text: TextSpan(
                          // set the default style for the children TextSpans
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                          children: [
                        TextSpan(
                          text: 'Tệp đính kèm ',
                        ),
                        TextSpan(
                            text: '(không bắt buộc)',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87)),
                      ]))),

          // // Nút upload tệp
          // FlatButton(
          //   onPressed: () {
          //     final act = CupertinoActionSheet(
          //         title: Text('Tải lên ảnh vi phạm'),
          //         actions: <Widget>[
          //           CupertinoActionSheetAction(
          //             child: Text('Máy ảnh'),
          //             onPressed: () {
          //               _openCamera(context, 0);
          //             },
          //           ),
          //           CupertinoActionSheetAction(
          //             child: Text('Thư viện'),
          //             onPressed: () {
          //               _openGalary(context, 1);
          //             },
          //           ),
          //           CupertinoActionSheetAction(
          //             child: Text('Quản lý tệp'),
          //             onPressed: () {
          //               _openGalary(context, 1);
          //             },
          //           )
          //         ],
          //         cancelButton: CupertinoActionSheetAction(
          //           child: Text('Huỷ bỏ'),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //         ));
          //     showCupertinoModalPopup(
          //         context: context,
          //         builder: (BuildContext context) => act);
          //   },
          //   child: Center(
          //       child: Container(
          //           width: 170,
          //           height: 125,
          //           child: DottedBorder(
          //             color: Color(0xff442EB5),
          //             dashPattern: [3],
          //             strokeWidth: 1,
          //             child: Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: <Widget>[
          //                   Padding(
          //                     padding: EdgeInsets.only(top: 20),
          //                   ),
          //                   SvgPicture.asset(
          //                     'images/paperclip.svg',
          //                     height: 40,
          //                     color: Colors.black45,
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.only(top: 5),
          //                   ),
          //                   Text('Nhấn để tải tệp lên!',
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontStyle: FontStyle.italic,
          //                           fontSize: 11,
          //                           fontWeight: FontWeight.w300))
          //                 ],
          //               ),
          //             ),
          //           ))),
          // ),

          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
