// import 'dart:async';
// import 'package:flutter/material.dart';

// import '../multi_image_out.dart';

// class ThanhChucNang extends StatelessWidget {
//   String noiDung;
//   var links;
//   var assetImg = [];
//   ThanhChucNang(this.noiDung, this.links, this.assetImg);

//   StreamController<dynamic> _controller = StreamController<dynamic>();

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Container(
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: 1.0, color: Colors.black12),
//         ),
//       ),
//       padding: EdgeInsets.only(top: 4, bottom: 4),

//       // các nút
//       child: Container(
//         height: 35,
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Positioned(
//               left: 15,
//               child: InkWell(
//                 child: Text(
//                   'Huỷ',
//                   style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff016ADD)),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),

//             // lbl trả lời
//             Center(
//               child: Container(
//                   child: Text(
//                 'Trả lời',
//                 style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black),
//               )),
//             ),

//             // nút hoàn thành
//             Positioned(
//               right: 15,
//               child: InkWell(
//                 child: Text(
//                   'Hoàn thành',
//                   style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                 ),
//                 onTap: () async {
//                   if (noiDung == '')
//                     print('Nội dung trống không gửi được !');
//                   else { 
                    
             
           
//                     // gọi api gửi đi
//                     // ServiceTraLoiPa().traLoiPhanAnh(noiDung);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
