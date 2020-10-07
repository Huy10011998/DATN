import 'package:flutter/material.dart';

class PopUpTraPaThatBai extends StatefulWidget {
  @override
  _PopUpTraPaThatBaiState createState() => _PopUpTraPaThatBaiState();
}

class _PopUpTraPaThatBaiState extends State<PopUpTraPaThatBai> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      // padding: EdgeInsets.all(20),
      child: new Wrap(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                // lbl
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 10),
                  child: Text(
                    'Có lỗi xảy ra',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),

                // img
                Image.asset(
                  'assets/images/404.png',
                  width: MediaQuery.of(context).size.width * .6,
                ),

                // btn
                InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff441CB0), Color(0xff6C18A4)])),
                    margin: EdgeInsets.only(top: 20, bottom: 40),
                    height: 43,
                    width: 250,
                    child: Center(
                        child: Text(
                      'Thử lại',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
