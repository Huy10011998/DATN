import 'package:demo_quanly/Widgets/chi_tiet_phan_anh/popup_tra_phan_anh.dart';
import 'package:flutter/material.dart';

class TraPhanAnh extends StatefulWidget {

  int id;
  TraPhanAnh(this.id);
  @override
  _TraPhanAnhState createState() => _TraPhanAnhState();
}

class _TraPhanAnhState extends State<TraPhanAnh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {
          _popUpTraPa(context);
        },
        child: Text(
          'Trả lại phản ánh này',
          style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              wordSpacing: 1,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  void _popUpTraPa(context) {
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: PopUpTraPa(widget.id),
          );
         });
  }
}
