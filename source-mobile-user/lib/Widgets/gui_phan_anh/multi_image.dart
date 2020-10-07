import 'dart:async';
import 'package:demo_trangchu/Util/theme.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/process-bar.dart';
import 'package:demo_trangchu/Widgets/gui_phan_anh/w_btn_up_hinh.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultiImage extends StatefulWidget {
  final List<Asset> listImages;
  final Function loadAssets;
  final ValueChanged<dynamic> boAnhMulti;
  final ValueChanged<dynamic> backValue;
  final Function onTap;
  final List<String> indexDone;
  final dynamic process;
  final dynamic colorMain;

  const MultiImage(
      {Key key,
      this.listImages,
      this.loadAssets,
      this.boAnhMulti,
      this.onTap,
      this.process,
      this.colorMain,
      this.indexDone,
      this.backValue})
      : super(key: key);
  @override
  _MultiImageState createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  @override
  void initState() {
    super.initState();
  }

  double test = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(widget.listImages.length, (index) {
          Asset asset = widget.listImages[index];
          return asset.name != 'test'
              ? Container(
                width: MediaQuery.of(context).size.width /4 - 10,
                height: MediaQuery.of(context).size.width /4 - 10,
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Opacity(
                          opacity: widget.indexDone.contains(asset.name) ? 1 : 0.2,
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(3)),
                                        image: DecorationImage(
                                            image: AssetThumbImageProvider(asset,
                                                width: 100, height: 100))),
                                    margin: EdgeInsets.all(paddingM),
                                  ),

                                  // Nút xoá ảnh
                                  InkWell(
                                    onTap: () {
                                      widget.indexDone.contains(asset.name)
                                          ? widget.boAnhMulti(
                                              {"index": index, "name": asset.name})
                                          : null;
                                      // widget.boAnhMulti(
                                      //     {"index": index, "name": asset.name});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20))),
                                      child: Icon(
                                        EvaIcons.closeOutline,
                                        size: 30,
                                        color: text_chi,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      !widget.indexDone.contains(asset.name)
                          ? widget.process['name'] == asset.name
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: paddingM, right: paddingM),
                                  child: FAProgressBar(
                                    currentValue:
                                        (widget.process["value"] * 100).round() ??
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
              : widget.listImages.length < 5
                  ? InkWell(
                      onTap: () {
                        widget.loadAssets();
                        widget.onTap();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width /4 - 10,
                          child: BtnUpHinh()),
                      )
                    )
                  : Container();
        }),
      ),
    );
  }
}

enum STATUSUPLOAD { DONE, ERROR ,LOADING}

class ViewMultiImage extends StatefulWidget {
  final ValueChanged<List<String>> valueImage;
  final ValueChanged<STATUSUPLOAD> statusUpload;
  final String colorMain;

/**
 * 
 * - [colorMain] Mặc định là màu "#0BE0A2". 
 * 
 *    Chỉ nhận mã màu Hex
 * 
 * - Bắt buộc phải có valueImage và statusUpload
 */
  const ViewMultiImage(
      {Key key, this.valueImage, this.statusUpload, this.colorMain})
      : super(key: key);

  @override
  _ViewMultiImageState createState() => _ViewMultiImageState();
}

class _ViewMultiImageState extends State<ViewMultiImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /**
   * Dùng cho bỏ ảnh trong multi
   */
  boAnhMulti(value) {
    setState(() {
      listImages.remove(listImages[value['index'] * 1]);
      imageTamList.remove(imageTamList[value['index'] * 1]);
      newList.remove(value['name']);
      _imageUrls.remove(_imageUrls[value['index'] * 1]);
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
      if (!mounted) return;

      /// Dùng để hiện ra ô nét đứt trong vùng ảnh. Để bấm vào mở thử viện ảnh
      Asset test = new Asset('', 'test', 10, 10);
      await resultList.add(test);

      setState(() {
        listImages = resultList;
      });
       widget.statusUpload(STATUSUPLOAD.LOADING);
      await saveImage(resultList).then((onValue) {
        List<String> lala = List.from(onValue);
        // for (final e in newList) {
        //   bool found = false;
        //   for (final f in lala) {
        //     if (e ==
        //         f.toString().substring(
        //             f.toString().indexOf('o/') + 2,
        //             f.toString().indexOf(
        //                   '?' ?? f.toString().length,
        //                 ))) {
        //       found = true;
        //       break;
        //     }
        //   }
        //   if (!found) {
        //     lala.remove(
        //         'https://firebasestorage.googleapis.com/v0/b/cong-phan-anh.appspot.com/o/21101777.png?alt=media&token=b940b119-b3bb-4c08-8a50-e163a8f5fc30');
        //   }
        // }
        widget.valueImage(onValue);
        widget.statusUpload(STATUSUPLOAD.DONE);
      }).catchError((onError) {
        print(onError);
        widget.statusUpload(STATUSUPLOAD.ERROR);
      });
    } on Exception catch (e) {
      print(e);
      widget.statusUpload(STATUSUPLOAD.ERROR);
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

  Future saveImage(resultList) async {
    List<Asset> tam = List.from(resultList);
    List<Asset> tamKhac = List.from(resultList);
    tam.removeWhere((test) => test.name == 'test');
    tamKhac.removeWhere((test) => test.name == 'test');

    //Kiểm tra chỉ upload những hình mới thêm vào, còn hình thêm vào trước đó thì không upload nữa
    tamKhac.forEach((f) {
      imageTamList.forEach((h) {
        if (h.name == f.name) {
          tam.remove(f);
        }
      });
    });

    if (tam.length > 0) {
      try {
        for (int i = 0; i < tam.length; i++) {
          ByteData byteData = await tam[i].requestOriginal();
          List<int> imageData = byteData.buffer.asUint8List();
          StorageReference storageReference =
              FirebaseStorage.instance.ref().child("${tam[i].name}");
          StorageUploadTask uploadTask = storageReference.putData(imageData);
          process["name"] = tam[i].name;
          process["value"] = 0.0;
          final StreamSubscription<StorageTaskEvent> streamSubscription =
              uploadTask.events.listen((event) async {
            setState(() {
              process["value"] = _bytesTransferred(event.snapshot);
            });
            print(_bytesTransferred(event.snapshot));
            // print(process);
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
        widget.statusUpload(STATUSUPLOAD.ERROR);
        // print(er);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
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

          Container(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: new BoxConstraints(),
                      // Chưa add hình nào thì hiện 4 nút upload
                      child: listImages.length == 0
                          ? InkWell(
                              onTap: () {
                                loadAssets();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              child: GridView.count(
                                shrinkWrap: true,
                                primary: false,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 4,
                                children: <Widget>[
                                  BtnUpHinh(),
                                  BtnUpHinh(),
                                  BtnUpHinh(),
                                  BtnUpHinh(),
                                ],
                              ))

                          // Nếu có hình rồi thì trả về danh sách hình
                          : MultiImage(
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
                              process: process,
                              indexDone: newList),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
