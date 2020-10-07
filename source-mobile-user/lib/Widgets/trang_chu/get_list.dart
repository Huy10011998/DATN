import 'package:demo_trangchu/Widgets/trang_chu/model_trang_chu.dart';

class GetPAState {}

class GetPAUnInitial extends GetPAState {}

class GetPALoading extends GetPAState {}

class GetPASuccess extends GetPAState {
  List<PhanAnh> pa;

  GetPASuccess({this.pa}) : assert(pa != null);
}

class GetPAError extends GetPAState {}
