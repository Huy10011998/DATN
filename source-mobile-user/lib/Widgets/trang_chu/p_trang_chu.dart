import 'package:demo_trangchu/Widgets/trang_chu/bloc.dart';
import 'package:demo_trangchu/Widgets/trang_chu/get_event_list.dart';
import 'package:demo_trangchu/Widgets/trang_chu/get_list.dart';
import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/service_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_khong_co_data.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_list_trang_chu.dart';
import 'package:demo_trangchu/Widgets/trang_chu/w_sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'model_trang_chu.dart';
import 'w_list_trang_chu.dart';

class TrangChu extends StatefulWidget {
  final String title;
  TrangChu([Key key, this.title]) : super(key: key);
  @override
  _TrangchuState createState() => _TrangchuState();
}

class _TrangchuState extends State<TrangChu> {
  //khai bao doi tuong list de dung
  ServicePhanAnh servicePhanAnh;
  GetPABloc _getPABloc;
  static const double _endReachedThreshold = 200;
  final ScrollController _controller = ScrollController();
  List<PhanAnh> _phanAnh = [];

  @override
  void initState() {
    super.initState();
    servicePhanAnh = ServicePhanAnh();
    _getPABloc = GetPABloc();
    _getPABloc.dispatch(GetPAEvent());

    _controller.addListener(onScroll);
    _phanAnh = List<PhanAnh>();
    _getPhanAnh();

    // gan doi tuong do vao bien ser.
    servicePhanAnh.getTotalItem().then((value) async {
      setState(() {
        servicePhanAnh.totalItem = int.parse(value);
        print('Tong: ' + servicePhanAnh.totalItem.toString());
      });
    });
  }

  Future _getPhanAnh() async {
    servicePhanAnh.isLoadMore = true;

    final newPhanAnh = await servicePhanAnh.layDSPhanAnh();

    setState(() {
      _phanAnh.addAll(newPhanAnh);
      //servicePhanAnh.currentPage++;
      print("Page: " + servicePhanAnh.currentPage.toString());
      // if (newPhanAnh.length < servicePhanAnh.perPage) {
      //   servicePhanAnh.canLoadMore = false;
      // }
      if (servicePhanAnh.currentPage < servicePhanAnh.getTotalPage()) {
        setState(() {
          servicePhanAnh.currentPage++;
          servicePhanAnh.isLoadMore = true;
        });
      }
      servicePhanAnh.isLoadMore = false;
    });
  }

  void onScroll() {
    if (!_controller.hasClients || servicePhanAnh.isLoadMore) {
      return;
    }

    final thresholdReached =
        _controller.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      _getPhanAnh();
    }
  }

  Future refresh() async {
    servicePhanAnh.canLoadMore = true;
    _phanAnh.clear();
    servicePhanAnh.currentPage = 1;
    await _getPhanAnh();
  }

  //bien dung de kiem tra load danh sach.
  // onScrollDown() {
  //   if (servicePhanAnh.currentPage < servicePhanAnh.getTotalPage()) {
  //     setState(() {
  //       servicePhanAnh.currentPage++;
  //       servicePhanAnh.isLoadMore = true;
  //     });
  //   }
  // }

  //phuong thuc dung de hien thi giao dien.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
        // Container(
        //     child: NotificationListener<ScrollNotification>(
        //         onNotification: (ScrollNotification scrollInfor) {
        //           if (!servicePhanAnh.isLoadMore &&
        //               scrollInfor.metrics.pixels ==
        //                   scrollInfor.metrics.maxScrollExtent) {
        //             onScrollDown();
        //           }
        //           return true;
        //         },
        //child:
        BlocProvider(
      builder: (BuildContext context) => _getPABloc,
      // child: Scaffold(
      child: BlocBuilder(
        bloc: _getPABloc,
        builder: (context, GetPAState state) {
          if (state is GetPAUnInitial)
            return Container();
          else if (state is GetPALoading)
            return Center(child: CircularProgressIndicator());
          else if (state is GetPASuccess)
            return buildTest2(state.pa);
          else {
            return Center(child: Text("Error"));
          }
        },
      ),
      //)
    );
  }
  // )
  //);
  // return Container(
  //     //lang nghe su kien, khi ng dung keo man hinh.
  //     child: NotificationListener<ScrollNotification>(
  //   onNotification: (ScrollNotification scrollInfor) {
  //     if (!servicePhanAnh.isLoadMore &&
  //         scrollInfor.metrics.pixels == scrollInfor.metrics.maxScrollExtent) {
  //       onScrollDown();
  //     }
  //     return true;
  //   },
  //   child: FutureBuilder<List<PhanAnh>>(
  //       //phan hoi lai yeu cau khi gui len api
  //       future: servicePhanAnh.layDSPhanAnh() ?? [],
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           List<PhanAnh> ds = snapshot.data ?? [];
  //           if (ds.length == 0) {
  //             return KhongCoData();
  //           } else {
  //             return ListTrangChu.buildListView(
  //                 ds, servicePhanAnh.isLoadMore);
  //           }
  //         } else {
  //           Container();
  //           return Center(child: CircularProgressIndicator()
  //               // child: JumpingText(
  //               //   'Đang tải ...',
  //               //   style: TextStyle(color: Color(0xff3F36AE)),
  //               // ),
  //               );
  //         }
  //       }),
  // ));

  Widget buildTest(BuildContext context, int index) {
    return ListTrangChu(_phanAnh[index]);
  }

  Widget buildTest2(List<PhanAnh> pa) {
    print("_phanAnh: " + _phanAnh.length.toString());
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: refresh,
        ),
        SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.25,
              crossAxisCount: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              buildTest,
              childCount: _phanAnh.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: servicePhanAnh.canLoadMore
              ? Container(
                  padding: EdgeInsets.only(bottom: 16),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : SizedBox(),
        ),
      ],
    );
    // ignore: dead_code
    return Container();
  }
}
