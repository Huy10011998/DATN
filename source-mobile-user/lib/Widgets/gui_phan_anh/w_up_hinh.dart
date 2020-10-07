import 'dart:io';

import 'package:demo_trangchu/Widgets/gui_phan_anh/w_btn_up_hinh.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UpHinhMinhChung extends StatefulWidget {
  @override
  _UpHinhMinhChungState createState() => _UpHinhMinhChungState();
}

class _UpHinhMinhChungState extends State<UpHinhMinhChung> {
  @override
  Widget build(BuildContext context) {
    return // Up ảnh minh chứng
        Container(
      color: Color(0xffffffff),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // dòng label
          Container(
              margin: EdgeInsets.fromLTRB(15, 20, 0, 5),
              child: Text(
                'Ảnh minh chứng',
                style: TextStyle(
                    color: Color(0xff442EB5),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),

          // 4 Nút upload
          Container(
              height: (MediaQuery.of(context).size.width - 30 - 40 + 10) / 4,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: 
              InkWell(
                child: 
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: BtnUpHinh(),
                      );
                    }),
                onTap: (){final act = CupertinoActionSheet(
                      title: Text('Tải lên ảnh vi phạm'),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: Text('Máy ảnh'),
                          onPressed: () {
                            _openCamera(context);
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text('Thư viện'),
                          onPressed: () {
                            _openGalary(context);
                          },
                        )
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text('Huỷ bỏ'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ));
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => act);
                
                },
              ))

          // GridView.count(
          //   primary: false,
          //   crossAxisSpacing: 10,
          //   crossAxisCount: 4,
          //   children: <Widget>[
          //     for (int i =0; i <4; i++){
          //       new BtnUpHinh(),
          //     }.toList(),

          //     BtnUpHinh(),
          //     BtnUpHinh(),
          //     BtnUpHinh(),
          //     BtnUpHinh(),

          //   //  // Up 1
          //   //   InkWell(
          //   //     onTap: () {
          //   //       final act = CupertinoActionSheet(
          //   //           title: Text('Tải lên ảnh vi phạm'),
          //   //           actions: <Widget>[
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Máy ảnh'),
          //   //               onPressed: () {
          //   //                 _openCamera(context);
          //   //               },
          //   //             ),
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Thư viện'),
          //   //               onPressed: () {
          //   //                 _openGalary(context);
          //   //               },
          //   //             )
          //   //           ],
          //   //           cancelButton: CupertinoActionSheetAction(
          //   //             child: Text('Huỷ bỏ'),
          //   //             onPressed: () {
          //   //               Navigator.pop(context);
          //   //             },
          //   //           ));
          //   //       showCupertinoModalPopup(
          //   //           context: context,
          //   //           builder: (BuildContext context) => act);
          //   //     },
          //   //     child: Container(
          //   //         child: imageFile1 == null
          //   //             ? Container(
          //   //                 width: (MediaQuery.of(context).size.width -
          //   //                         30 -
          //   //                         40 +
          //   //                         8) /
          //   //                     4,

          //   //                 height: 70,
          //   //                 child: DottedBorder(
          //   //                   dashPattern: [2],
          //   //                   color: Color(0xff442EB5),
          //   //                   strokeWidth: 1,
          //   //                   child: Center(
          //   //                     child: SvgPicture.asset(
          //   //                       'images/upload.svg',
          //   //                       height: 26,
          //   //                       color: Colors.black45,
          //   //                     ),
          //   //                   ),
          //   //                 ))
          //   //             : Container(
          //   //                 padding: EdgeInsets.only(),
          //   //                 child: Image.asset(
          //   //                   imageFile1.path,
          //   //                   width: 80,
          //   //                   height: 80,
          //   //                 ))),
          //   //   ),

          //   //   // Up 2
          //   //   InkWell(
          //   //     onTap: () {
          //   //       final act = CupertinoActionSheet(
          //   //           title: Text('Tải lên ảnh vi phạm'),
          //   //           actions: <Widget>[
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Máy ảnh'),
          //   //               onPressed: () {
          //   //                 _openCamera1(context);
          //   //               },
          //   //             ),
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Thư viện'),
          //   //               onPressed: () {
          //   //                 _openGalary1(context);
          //   //               },
          //   //             )
          //   //           ],
          //   //           cancelButton: CupertinoActionSheetAction(
          //   //             child: Text('Huỷ bỏ'),
          //   //             onPressed: () {
          //   //               Navigator.pop(context);
          //   //             },
          //   //           ));
          //   //       showCupertinoModalPopup(
          //   //           context: context,
          //   //           builder: (BuildContext context) => act);
          //   //     },
          //   //     child: Container(
          //   //         child: imageFile1 == null
          //   //             ? Container(
          //   //                 width: (MediaQuery.of(context).size.width -
          //   //                         30 -
          //   //                         40 +
          //   //                         8) /
          //   //                     4,
          //   //                 height: 70,
          //   //                 child: DottedBorder(
          //   //                   dashPattern: [2],
          //   //                   color: Color(0xff442EB5),
          //   //                   strokeWidth: 1,
          //   //                   child: Center(
          //   //                     child: SvgPicture.asset(
          //   //                       'images/upload.svg',
          //   //                       height: 26,
          //   //                       color: Colors.black45,
          //   //                     ),
          //   //                   ),
          //   //                 ))
          //   //             : Container(
          //   //                 padding: EdgeInsets.only(),
          //   //                 child: Image.asset(
          //   //                   imageFile1.path,
          //   //                   width: 80,
          //   //                   height: 80,
          //   //                 ))),
          //   //   ),

          //   //   // Up 2
          //   //   InkWell(
          //   //     onTap: () {
          //   //       final act = CupertinoActionSheet(
          //   //           title: Text('Tải lên ảnh vi phạm'),
          //   //           actions: <Widget>[
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Máy ảnh'),
          //   //               onPressed: () {
          //   //                 _openCamera2(context);
          //   //               },
          //   //             ),
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Thư viện'),
          //   //               onPressed: () {
          //   //                 _openGalary2(context);
          //   //               },
          //   //             )
          //   //           ],
          //   //           cancelButton: CupertinoActionSheetAction(
          //   //             child: Text('Huỷ bỏ'),
          //   //             onPressed: () {
          //   //               Navigator.pop(context);
          //   //             },
          //   //           ));
          //   //       showCupertinoModalPopup(
          //   //           context: context,
          //   //           builder: (BuildContext context) => act);
          //   //     },
          //   //     child: Container(
          //   //         child: imageFile2 == null
          //   //             ? Container(
          //   //                 width: (MediaQuery.of(context).size.width -
          //   //                         30 -
          //   //                         40 +
          //   //                         8) /
          //   //                     4,
          //   //                 height: 70,
          //   //                 child: DottedBorder(
          //   //                   dashPattern: [2],
          //   //                   color: Color(0xff442EB5),
          //   //                   strokeWidth: 1,
          //   //                   child: Center(
          //   //                     child: SvgPicture.asset(
          //   //                       'images/upload.svg',
          //   //                       height: 26,
          //   //                       color: Colors.black45,
          //   //                     ),
          //   //                   ),
          //   //                 ))
          //   //             : Container(
          //   //                 padding: EdgeInsets.only(),
          //   //                 child: Image.asset(
          //   //                   imageFile2.path,
          //   //                   width: 80,
          //   //                   height: 80,
          //   //                 ))),
          //   //   ),

          //   //   // Up 3
          //   //   InkWell(
          //   //     onTap: () {
          //   //       final act = CupertinoActionSheet(
          //   //           title: Text('Tải lên ảnh vi phạm'),
          //   //           actions: <Widget>[
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Máy ảnh'),
          //   //               onPressed: () {
          //   //                 _openCamera3(context);
          //   //               },
          //   //             ),
          //   //             CupertinoActionSheetAction(
          //   //               child: Text('Thư viện'),
          //   //               onPressed: () {
          //   //                 _openGalary3(context);
          //   //               },
          //   //             )
          //   //           ],
          //   //           cancelButton: CupertinoActionSheetAction(
          //   //             child: Text('Huỷ bỏ'),
          //   //             onPressed: () {
          //   //               Navigator.pop(context);
          //   //             },
          //   //           ));
          //   //       showCupertinoModalPopup(
          //   //           context: context,
          //   //           builder: (BuildContext context) => act);
          //   //     },
          //   //     child: Container(
          //   //         child: imageFile3 == null
          //   //             ? Container(
          //   //                 width: (MediaQuery.of(context).size.width -
          //   //                         30 -
          //   //                         40 +
          //   //                         8) /
          //   //                     4,
          //   //                 height: 70,
          //   //                 child: DottedBorder(
          //   //                   dashPattern: [2],
          //   //                   color: Color(0xff442EB5),
          //   //                   strokeWidth: 1,
          //   //                   child: Center(
          //   //                     child: SvgPicture.asset(
          //   //                       'images/upload.svg',
          //   //                       height: 26,
          //   //                       color: Colors.black45,
          //   //                     ),
          //   //                   ),
          //   //                 ))
          //   //             : Container(
          //   //                 padding: EdgeInsets.only(),
          //   //                 child: Image.asset(
          //   //                   imageFile3.path,
          //   //                   width: 80,
          //   //                   height: 80,
          //   //                 ))),
          //   //   ),

          //   ],
          // )),
        ],
      ),
    );
  }

  File imageFile, imageFile1, imageFile2, imageFile3;
  var images = [];
  _openCamera(BuildContext context) async {
    var picture = (await ImagePicker.pickImage(source: ImageSource.camera));
    this.setState(() {
      imageFile = picture;
      images.add(imageFile);
    });
    Navigator.of(context).pop();
  }

  _openGalary(BuildContext context) async {
    var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
    this.setState(() {
      imageFile = picture;
      images.add(imageFile);
    });
    Navigator.of(context).pop();
  }

  // _openCamera1(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.camera));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openGalary1(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openCamera2(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.camera));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openGalary2(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openCamera3(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.camera));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }

  // _openGalary3(BuildContext context) async {
  //   var picture = (await ImagePicker.pickImage(source: ImageSource.gallery));
  //   this.setState(() {
  //     imageFile = picture;
  //     images.add(imageFile);
  //   });
  //   Navigator.of(context).pop();
  // }
}
