import 'dart:io';

import 'package:demo_trangchu/Util/size_config.dart';
import 'package:flutter/material.dart';

//Font Size Scale With Screen
final double fontSizeByScreen = SizeConfig.fontSize; //fontSizeByApp
final double fontSizeByApp = 12; //fontSizeByApp
const double appBarSize = 40;

/// ----------------------Color----------------------
const Color colorBlack = Color.fromRGBO(33, 33, 33, 1);
const Color colorPuple = Color.fromRGBO(59, 89, 152, 1);
const Color colorGreen = Color.fromRGBO(24, 60, 34, 1);
const Color colorOrange = Color.fromRGBO(253, 85, 51, .78);
const Color colorRed = Color.fromRGBO(254, 43, 0, 1);
const Color colorBlue = Color.fromRGBO(0, 199, 255, 1);
const Color colorBlueV2 = Color.fromRGBO(0, 199, 255, 1);

const Color colorGrey_1 = Color.fromRGBO(234, 239, 240, 1);
const Color colorGrey_2 = Color.fromRGBO(223, 223, 223, 1);
const Color colorGrey_3 = Color.fromRGBO(172, 172, 172, 1);
const Color colorGrey_4 = Color.fromRGBO(140, 140, 140, 1);

const Color colorWhite = Colors.white;

const Color colorViolet = Color.fromRGBO(110, 55, 148, 1);

const Color colorBackground = Color.fromRGBO(239, 239, 244, 1);

const Color colorPurple = Color.fromRGBO(90, 39, 131, 1);

const Color colorBgImage = Color.fromRGBO(233, 239, 240, 1);

/// ----------------------Padding----------------------
const double paddingS = 4.0;
const double paddingM = 8.0; //
const double paddingL = 16.0; //
const double paddingXS = 24.0; //
const double paddingXXS = 36.0; //

/// Line height
const double lineHeight1 = 1.0;
const double lineHeight2 = lineHeight1 * 1.2;
const double lineHeight3 = lineHeight1 * 1.4;
const double lineHeight4 = lineHeight1 * 1.6;
const double lineHeight5 = lineHeight1 * 1.8;

///BlurRadius
double blurRadius = 5;

/// ----------------------Style chữ----------------------
///light
TextStyle style10 = TextStyle(
  fontSize: fontSizeByScreen * (10 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style13 = TextStyle(
  fontSize: fontSizeByScreen * (13 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
  height: lineHeight2,
);
TextStyle style15 = TextStyle(
  fontSize: fontSizeByScreen * (15 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  height: lineHeight2,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style17 = TextStyle(
  fontSize: fontSizeByScreen * (17 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style20 = TextStyle(
  fontSize: fontSizeByScreen * (20 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style22 = TextStyle(
  fontSize: fontSizeByScreen * (22 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  // letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style28 = TextStyle(
  fontSize: fontSizeByScreen * (28 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  letterSpacing: Platform.isIOS ? 2.0 : 0,
);
TextStyle style34 = TextStyle(
  fontSize: fontSizeByScreen * (34 / fontSizeByApp),
  fontWeight: FontWeight.w300,
  color: colorBlack,
  letterSpacing: Platform.isIOS ? 2.0 : 0,
);

///semibold
TextStyle style10_semibold = style10.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style13_semibold = style13.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style15_semibold = style15.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style17_semibold = style17.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style20_semibold = style20.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style22_semibold = style22.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style28_semibold = style28.copyWith(
  fontWeight: FontWeight.w600,
);
TextStyle style34_semibold = style34.copyWith(
  fontWeight: FontWeight.w600,
);

///extra bold
TextStyle style10_black = style10.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style13_black = style13.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style15_black = style15.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style17_black = style17.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style20_black = style20.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style22_black = style22.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style28_black = style28.copyWith(
  fontWeight: FontWeight.w800,
);
TextStyle style34_black = style34.copyWith(
  fontWeight: FontWeight.w800,
);

///light_grey
TextStyle style10_lightgrey = style10.copyWith(
  color: colorGrey_3,
);
TextStyle style13_lightgrey = style13.copyWith(
  color: colorGrey_3,
);
TextStyle style15_lightgrey = style15.copyWith(
  color: colorGrey_3,
);
TextStyle style17_lightgrey = style17.copyWith(
  color: colorGrey_3,
);
TextStyle style20_lightgrey = style20.copyWith(
  color: colorGrey_3,
);
TextStyle style22_lightgrey = style22.copyWith(
  color: colorGrey_3,
);
TextStyle style28_lightgrey = style28.copyWith(
  color: colorGrey_3,
);
TextStyle style34_lightgrey = style34.copyWith(
  color: colorGrey_3,
);

/// BorderSide
BorderSide borderNone = BorderSide(color: Colors.white, width: 0.0);
BorderSide borderSide = BorderSide(color: colorGrey_3, width: 0.5);

final themeQuyquy = ThemeData(
    fontFamily: 'Segoe UI',
    appBarTheme: AppBarTheme(
      color: colorViolet,
      elevation: 0.0,
    ),
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }));

Color colorHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  return Color(int.parse('FF' + hexColor, radix: 16));
}

var bg_main = colorHex('#e9edf1');
var mau_disable = colorHex('#fbd091');
var mau_text_create = colorHex('#ff9600');
var bg_icon = colorHex('#e0e6ee');
var mau_text_connect = colorHex('#1A3A46');
var mau_text_connect_nhat = colorHex('#345c6b');
var mau_dis_v2 = colorHex('#dcdcdc');
var mau_tab = colorHex('#16b085');
var mau_main_test = colorHex('#0BE0A4');
var mau_text_disable = colorHex('#52b9bc');
var button_create = colorHex('#52b9bc');
var mau_active = colorHex('#0BE0A4');
var mau_cam_bottom = colorHex('#ffac37');
var text_thu = colorHex('#52DE97');
var text_chi = colorHex('#eb576c');
var tong_tien = colorHex('#444444');
var text_sup = colorHex('#828282');
