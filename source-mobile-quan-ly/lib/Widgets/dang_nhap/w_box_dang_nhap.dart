import 'package:demo_quanly/Widgets/dang_nhap/service_dang_nhap.dart';
import 'package:demo_quanly/Widgets/menu_bar/w_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:status_alert/status_alert.dart';

class BoxDangNhap extends StatefulWidget {
  @override
  _BoxDangNhapState createState() => _BoxDangNhapState();
}

class _BoxDangNhapState extends State<BoxDangNhap> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final FocusNode email = FocusNode();
  final FocusNode password = FocusNode();
  bool emailIsNull = false;
  bool passIsNull = false;
  bool loginFail = false;
  String txt;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //Chữ đăng nhập
      Container(
        padding: EdgeInsets.only(top: 25),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Color(0xff442EB5)),
        ),
      ),

      //Nhập email
      Container(
          width: MediaQuery.of(context).size.width - 60 - 40,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: emailIsNull == true
                          ? Colors.red
                          : Color(0xff442EB5)))),
          padding: EdgeInsets.only(top: 15),
          child: Container(
              height: 40,
              child: TextField(
                onChanged: (v) {
                  setState(() {
                    v == '' ? emailIsNull = true : emailIsNull = false;
                  });
                },
                controller: emailController,
                onSubmitted: (term) {
                  _fieldFocusChange(context, email, password);
                },
                focusNode: email,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset(
                    'assets/images/user.svg',
                    width: 20,
                  ),
                  hintText: 'Email hoặc số điện thoại',
                  hintStyle: TextStyle(
                    fontSize: 12.5,
                    height: 1.5,
                    wordSpacing: -1.5,
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ))),

      //Nhập pass
      Container(
          width: MediaQuery.of(context).size.width - 60 - 40,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: passIsNull == true
                          ? Colors.red
                          : Color(0xff442EB5)))),
          padding: EdgeInsets.only(top: 10),
          child: Container(
              height: 40,
              child: TextField(
                onChanged: (v) {
                  setState(() {
                    v == '' ? passIsNull = true : passIsNull = false;
                  });
                },
                focusNode: password,
                controller: passwordController,
                onSubmitted: (value) {
                  password.unfocus();
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: SvgPicture.asset(
                      'assets/images/locked.svg',
                      width: 20,
                    ),
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      wordSpacing: -1.5,
                    )),
                textInputAction: TextInputAction.done,
                obscureText: true,
              ))),

      // câu thông báo này xuất hiện khi không nhập mà login
      emailIsNull == true || passIsNull == true
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '* Không được bỏ trống',
                style: TextStyle(fontSize: 13, color: Color(0xff441CB0)),
              ),
            )
          : Container(),

      // câu thông báo này xuất hiện khi nhập sai
      loginFail == true
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                txt,
                style: TextStyle(fontSize: 13, color: Color(0xff441CB0)),
              ),
            )
          : Container(),

      //Button Đăng nhập
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff442EB5), Color(0xff6C18A4)]),
              borderRadius: new BorderRadius.all(
                Radius.circular(3),
              )),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.04),
          width: MediaQuery.of(context).size.width - 60 - 80,
          height: 40,
          child: InkWell(
            onTap: () {
              // Chạy hàm kiểm tra xem đã nhập chưa để set state lại
              _checkEmpty(emailController.text, passwordController.text);

              // kiểm tra xem nhập hay chưa
              if (emailIsNull == false && passIsNull == false)
                // chay api
                ServiceDangNhap()
                    .dangNhap(emailController.text, passwordController.text)
                    .then((onValue) {
                  // 200 là thành công
                  onValue.code == 200
                      ? {
                          // StatusAlert.show(
                          //   context,
                          //   duration: Duration(seconds: 1),
                          //   title: 'Đăng nhập thành công',
                          //   // subtitle: 'Subtitle',
                          //   configuration:
                          //       IconConfiguration(icon: Icons.done, size: 100),
                          // ),
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThanhTabBar()),
                            (Route<dynamic> route) => false,
                          )
                        }
                      : {
                          loginFail = true,
                          txt = onValue.message.toString(),
                          print('login fail?    ' +
                              loginFail.toString() +
                              '   ' +
                              onValue.message.toString())
                        };

                  setState(() {
                    loginFail;
                  });
                });

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ThanhTabBar()),
              // );
            },
            child: Center(
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 18.5,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    ]);
  }

  _checkEmpty(String email, pass) {
    if (email.isEmpty) {
      setState(() {
        emailIsNull = true;
      });
    }
    if (pass.isEmpty) {
      setState(() {
        passIsNull = true;
      });
    }
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
