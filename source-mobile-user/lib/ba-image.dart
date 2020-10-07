import 'package:demo_trangchu/Util/theme.dart';
import 'package:demo_trangchu/Widgets/ba-image-custom.dart';
import 'package:demo_trangchu/Widgets/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BAModel {
  final String bfImage;
  final String afImage;

  BAModel({this.bfImage, this.afImage});

  Map<String, Object> toJson() {
    return {
      'bfImage': bfImage,
      'afImage': afImage,
    };
  }

  factory BAModel.fromJson(Map<String, Object> doc) {
    BAModel version = new BAModel(
      bfImage: doc['bfImage'] ?? '',
      afImage: doc['afImage'] ?? '',
    );
    return version;
  }

  factory BAModel.fromDocument(doc) {
    return BAModel.fromJson(doc);
  }
}

enum Aliment { LEFT, RIGHT, CENTER }

class ImageEmpty extends StatelessWidget {
  final String vitri;
  final Aliment aliment;

  const ImageEmpty({Key key, this.aliment = Aliment.LEFT, this.vitri = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingL),
      alignment: aliment == Aliment.LEFT
          ? AlignmentDirectional.centerStart
          : aliment == Aliment.RIGHT
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: MediaQuery.of(context).size.width * 0.1,
            color: Colors.black54,
          ),
          Container(
            margin: EdgeInsets.only(top: paddingM),
            child: Text(
              'Không có hình ảnh.\n $vitri',
              style: style13.copyWith(color: text_chi),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class BAContainerImage extends StatefulWidget {
  final BAModel data;

  const BAContainerImage({Key key, this.data}) : super(key: key);
  @override
  BAContainerImageState createState() => BAContainerImageState();
}

class BAContainerImageState extends State<BAContainerImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(8))),
      // height: ScreenUtil().setHeight(200),
      // width: ScreenUtil().setHeight(500),
      color: colorWhite,
      child: BeforeAfter(
        isVertical: false,
        beforeImage: widget.data.bfImage != "" && widget.data.bfImage != null
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.data.bfImage,
                fit: BoxFit.cover,
              )
            : ImageEmpty(
                vitri: "Before",
              ),
        afterImage: widget.data.afImage != "" && widget.data.afImage != null
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.data.afImage,
                fit: BoxFit.cover,
              )
            : ImageEmpty(
                aliment: Aliment.RIGHT,
                vitri: "After",
              ),
        imageHeight: ScreenUtil().setHeight(200),
        imageWidth: ScreenUtil().setHeight(500),
      ),
    );
  }
}

class BAItemSlide extends StatefulWidget {
  final BAModel data;
  final Function onTap;
  final bool active;

  const BAItemSlide({Key key, this.data, this.onTap, this.active})
      : super(key: key);

  @override
  _BAItemStateSlide createState() => _BAItemStateSlide();
}

class _BAItemStateSlide extends State<BAItemSlide> {
  int lenght = 0;

  @override
  void initState() {
    super.initState();
    _checkData();
  }

/*
 * Dùng để lấy length
 */
  _checkData() {
    if ((widget.data.bfImage != '') && (widget.data.afImage != '')) {
      lenght = 2;
    } else if (((widget.data.bfImage != '') && widget.data.afImage == '') ||
        (widget.data.bfImage == '' && widget.data.afImage != '')) {
      lenght = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: paddingL),
      child: InkWell(
          onTap: () {
            widget.onTap();
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setHeight(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: NetworkImage(
                            (widget.data.bfImage != '' &&
                                    widget.data.bfImage != null)
                                ? widget.data.bfImage
                                : widget.data.afImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: colorGrey_2,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color:
                            widget.active ? Colors.transparent : Colors.black54,
                      ),
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setHeight(50),
                    )
                  ],
                ),
              ),
              !widget.active
                  ? Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(paddingS),
                      child: Text(
                        lenght.toString(),
                        style: style10_black.copyWith(color: colorWhite),
                      ),
                    )
                  : Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(paddingS),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: mau_main_test,
                        size: 15,
                      ),
                    )
            ],
          )),
    );
  }
}

class BAMultiImage extends StatefulWidget {
  final List<dynamic> data;

  const BAMultiImage({Key key, this.data}) : super(key: key);

  @override
  _BAMultiImageState createState() => _BAMultiImageState();
}

/*
 * [data]: Có dạng:
 * 
 * ``` 
   {
      "bfImage": 'link hình',
      "afImage": 'link hình',
    }
    ```
 */
class _BAMultiImageState extends State<BAMultiImage> {
  List<BAModel> _baData = [];

  BAModel imageContainer;
  bool noIname = false;
  int active = 0;

  @override
  void initState() {
    super.initState();
    _mapValue();
  }

  _mapValue() async {
    widget.data.forEach((f) {
      if ((f['bfImage'] != '' && f['bfImage'] != null) ||
          f['afImage'] != '' && f['afImage'] != null) {
        _baData.add(BAModel.fromJson(f));
      }
    });
    if (_baData.length > 0) {
      imageContainer = _baData[0];
    } else {
      noIname = true;
    }
  }

  showImgae(BAModel data, index) {
    setState(() {
      imageContainer = data;
      active = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: !noIname
            ? Container(
                margin: EdgeInsets.only(left: paddingL, right: paddingL),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: BAContainerImage(
                        data: imageContainer,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: paddingL,
                          right: paddingL,
                          top: paddingL,
                          bottom: paddingL),
                      height: ScreenUtil().setHeight(50),
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: _baData.mapIndexed((element, index) {
                            return BAItemSlide(
                              data: element,
                              onTap: () {
                                showImgae(element, index);
                              },
                              active: index == active,
                            );
                          }).toList()),
                    )
                  ],
                ))
            : Container());
  }
}

/*
 * Dùng để map có index
 */
extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }
}
