import 'dart:async';

import 'package:demo_quanly/Widgets/process-bar.dart';
import 'package:demo_quanly/Widgets/tra_loi_phan_anh/w_btn_up_load.dart';
import 'package:demo_quanly/util/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultiImageOut extends StatefulWidget {
  final List<Asset> listImages;
  final Function loadAssets;
  final ValueChanged<dynamic> boAnhMulti;
  final ValueChanged<dynamic> backValue;
  final Function onTap;
  final List<String> indexDone;
  final dynamic process;
  final dynamic colorMain;

  final Stream<dynamic> stream;
  const MultiImageOut(
      {Key key,
      this.listImages,
      this.loadAssets,
      this.boAnhMulti,
      this.onTap,
      this.indexDone,
      this.process,
      this.stream,
      this.colorMain,
      this.backValue})
      : super(key: key);
  @override
  _MultiImageOutState createState() => _MultiImageOutState();
}

class _MultiImageOutState extends State<MultiImageOut> {
  @override
  void initState() {
    super.initState();

    // Lắng nghe thay đổi từ widget cha, để build màn hình cho widget con
    widget.stream.listen((value) {
      setState(() {
        tienTrinh = value;
      });
    });
  }

  dynamic tienTrinh = {};
  double test = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: List.generate(widget.listImages.length, (index) {
          Asset asset = widget.listImages[index];
          return asset.name != 'test' //Bỏ item test(ô nét đứt)
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  width: (MediaQuery.of(context).size.width - 40 - 30) / 4,
                  height: (MediaQuery.of(context).size.width - 40 - 30) / 4,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: <Widget>[
                              Opacity(
                                opacity: widget.indexDone.contains(asset.name)
                                    ? 1
                                    : 0.2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                      image: DecorationImage(
                                          image: AssetThumbImageProvider(asset,
                                              width: 100, height: 100))),
                                ),
                              ),
                              !widget.indexDone.contains(asset
                                      .name) //Kiểm tra để hiển thị nút bỏ ảnh
                                  ? InkWell(
                                      onTap: () {
                                        widget.boAnhMulti({
                                          "index": index,
                                          "name": asset.name
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20))),
                                        child: Icon(
                                          EvaIcons.closeOutline,
                                          size: 30,
                                          color: text_chi,
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      ),
                      !widget.indexDone
                              .contains(asset.name) //Để hiện thị cái chạy chạy
                          ? tienTrinh['name'] == asset.name
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: paddingM, right: paddingM),
                                  child: FAProgressBar(
                                    currentValue:
                                        (tienTrinh["value"] * 100).round() ??
                                            test,
                                    displayText: '%',
                                    size: ScreenUtil().setHeight(17),
                                    progressColor: widget.colorMain,
                                    borderColor: widget.colorMain,
                                  ),
                                )
                              : Container()
                          : Container()
                    ],
                  ),
                )
              : widget.listImages.length <
                      5 //số lượng do mình đặt, nếu nhỏ hơn thì sẽ có ô nét đứt
                  ? InkWell(
                      onTap: () {
                        widget.loadAssets();
                        widget.onTap();
                      },
                      child: Container(
                          width: (MediaQuery.of(context).size.width - 40 - 30) /
                                  4 -
                              3,
                          height:
                              (MediaQuery.of(context).size.width - 40 - 30) /
                                      4 -
                                  3,
                          child: DottedBorder(
                            dashPattern: [2],
                            color: Color(0xff442EB5),
                            strokeWidth: 1,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/images/upload.svg',
                                    height: 30,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                          )))
                  : Container();
        }),
      ),
    );
  }
}

enum STATUSUPLOAD2 { DONE, ERROR }
List<Asset> listChung;

class ViewMultiImageOut extends StatefulWidget {
  final ValueChanged<List<String>> valueImage;
  final ValueChanged<List<Asset>> valueAsset;
  final ValueChanged<STATUSUPLOAD2> statusUpload;
  Future uploadFirebase(a) => createState().lala(a);
  final Stream<dynamic> stream;
  final String colorMain;
/**
 * valueImage: Trả về link hình được upload từ firebase
 * 
 * valueAsset: Trả về danh sách các Asset để cho gọi hàm upload ở widget cha
 * 
 * statusUpload: Trạng thái upload
 * 
 * stream: dùng để thay đổi giá trị cho widget con
 * 
 * colorMain: dùng để thay đổi màu
 */
  const ViewMultiImageOut({
    Key key,
    this.valueImage,
    this.valueAsset,
    this.statusUpload,
    this.stream,
    this.colorMain,
  }) : super(key: key);
  // State createState() => new ViewMultiImageOutState();

  @override
  ViewMultiImageOutState createState() => ViewMultiImageOutState();
}

class ViewMultiImageOutState extends State<ViewMultiImageOut> {
  StreamController<dynamic> _controllerWidget = StreamController<dynamic>();

  @override
  void initState() {
    super.initState();
    widget.stream.listen((seconds) {
      lala(seconds);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerWidget.close();
  }

  /**
   * Dùng cho bỏ ảnh trong multi
   */
  boAnhMulti(value) {
    setState(() {
      listImages.remove(listImages[value['index'] * 1]);
      // imageTamList.remove(imageTamList[value['index'] * 1]);
      // newList.remove(value['name']);
      // _imageUrls.remove(_imageUrls[value['index'] * 1]);
    });
  }

/**
 * Lấy nhiều ảnh từ thư viện ảnh trong máy
 */
  List<Asset> listImages = List<Asset>();
  loadAssets() async {
    List<Asset> resultList = List<Asset>();
    listImages.removeWhere((test) => test.name == 'test');
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: listImages,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
            actionBarColor:
                widget.colorMain != null ? widget.colorMain : "#0BE0A4",
            actionBarTitle: "Thư viện ảnh",
            allViewTitle: "Tất cả ảnh",
            useDetailsView: false,
            selectCircleStrokeColor: "#000000",
            textOnNothingSelected: "Vui lòng chọn ảnh",
            selectionLimitReachedText: "Chỉ được phép chọn 4 ảnh"),
      );
      // print(MultiImagePicker.requestMetadata('hihihi'));
      // print(MultiImagePicker.requestOriginal('phu phu', FilterQuality.medium));
      // print(MultiImagePicker.requestThumbnail('phu phu', 200, 200, 80));
      if (!mounted) return;

      /// Dùng để hiện ra ô nét đứt trong vùng ảnh. Để bấm vào mở thử viện ảnh
      Asset test = new Asset('', 'test', 10, 10);
      await resultList.add(test);

      setState(() {
        listImages = resultList;
        process = 0.0;
      });
      widget.valueAsset(resultList);
    } on Exception catch (e) {
      print(e);
      widget.statusUpload(STATUSUPLOAD2.ERROR);
    }
  }

  List<String> listUrls = List(); //Danh sách url tra về
  List<String> _imageUrls = List(); //Danh sách url tra về
  List<String> newList = []; // Danh sách kiểm tra hình đã upload chưa

  /**
   * Danh sách để check coi hình nào đã đc thêm
   * vi dụ: Lúc đầu thêm 2 hình -> upload firebase xong
   * Xong thêm 1 hình mới nữa, thì lúc này chỉ upload 1 hình vừa mới thêm vào thôi
   * 2 hình trước đó thì không upload nữa 
   */
  List<Asset> imageTamList = []; //
  StreamController<int> _controller = StreamController<int>();
  Future saveImage(value) async {
    List<Asset> tam = List.from(value);
    List<Asset> tamKhac = List.from(value);
    tam.removeWhere((test) => test.name == 'test');
    tamKhac.removeWhere((test) => test.name == 'test');

    //Không cho chọn hình nữa khi bắt đầu upload
    setState(() {
      listImages.removeWhere((test) => test.name == 'test');
    });

    //Kiểm tra chỉ upload những hình mới thêm vào, còn hình thêm vào trước đó thì không upload nữa
    tamKhac.forEach((f) {
      imageTamList.forEach((h) {
        if (h.name == f.name) {
          tam.remove(f);
        }
      });
    });
    //Dùng cho cái chạy chạy
    var tamProcess = {};
    if (tam.length > 0) {
      try {
        for (int i = 0; i < tam.length; i++) {
          ByteData byteData = await tam[i].requestOriginal();
          List<int> imageData = byteData.buffer.asUint8List();
          StorageReference storageReference =
              FirebaseStorage.instance.ref().child("${tam[i].name}");
          StorageUploadTask uploadTask = storageReference.putData(imageData);
          tamProcess["name"] = tam[i].name;
          tamProcess["value"] = 0.0;
          final StreamSubscription<StorageTaskEvent> streamSubscription =
              uploadTask.events.listen((event) {
            tamProcess["value"] = _bytesTransferred(event.snapshot);

            //Để stream qua cái widget con, dùng cho cái chạy chạy
            _controllerWidget.add(tamProcess);
          });

          await uploadTask.onComplete;
          streamSubscription.cancel();
          String imageUrl = await storageReference.getDownloadURL();
          setState(() {
            imageTamList.add(tam[i]);
            newList.add(tam[i].name);
          });

          _imageUrls.add(imageUrl); //danh sách link ảnh từ firebase
        }
      } catch (er) {
        widget.statusUpload(STATUSUPLOAD2.ERROR);
      }
    }
    return _imageUrls;
  }

  dynamic process = {};
  double _bytesTransferred(StorageTaskSnapshot snapshot) {
    double res = (snapshot.bytesTransferred / 1024.0) / 1000;
    double res2 = (snapshot.totalByteCount / 1024.0) / 1000;
    return double.parse(res.toStringAsFixed(2)) /
        double.parse(res2.toStringAsFixed(2));
  }

//Hàm gọi và trả về value của widget
  lala(value) async {
    await saveImage(value).then((onValue) {
      widget.valueImage(onValue);
      widget.statusUpload(STATUSUPLOAD2.DONE);
    }).catchError((onError) {
      widget.statusUpload(STATUSUPLOAD2.ERROR);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: paddingL, bottom: paddingL),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: MultiImageOut(
                      onTap: () {
                        // widget.onTap();
                      },
                      listImages: listImages,
                      boAnhMulti: (value) {
                        boAnhMulti(value);
                      },
                      loadAssets: () {
                        loadAssets();
                      },
                      colorMain: widget.colorMain != null
                          ? colorHex(widget.colorMain ?? '')
                          : mau_main_test,
                      stream: _controllerWidget.stream,
                      process: process,
                      indexDone: newList),
                ),
                // Nếu chưa có hình nào thì hiện giao diện như design, có 1 nút up hình
                listImages.length == 0
                    ? InkWell(
                        onTap: () {
                          loadAssets();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: BtnUpLoad())
                    : Container()
              ],
            ),
          ],
        ),
      ],
    );
  }
}
