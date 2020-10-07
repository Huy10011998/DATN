import 'package:bloc/bloc.dart';
import 'package:demo_trangchu/Widgets/trang_chu/get_event_list.dart';
import 'package:demo_trangchu/Widgets/trang_chu/get_list.dart';
import 'package:demo_trangchu/Widgets/trang_chu/service_trang_chu.dart';

class GetPABloc extends Bloc<PAEvent, GetPAState> {
  ServicePhanAnh servicePhanAnh = ServicePhanAnh();
  @override
  GetPAState get initialState => GetPAUnInitial();

  @override
  Stream<GetPAState> mapEventToState(PAEvent event) async* {
    // to notify that is loading
    yield GetPALoading();
    // if you have multiple event
    if (event is GetPAEvent) {
      yield GetPASuccess(pa: await servicePhanAnh.layDSPhanAnh());
    }
    // if have error you can yield GetUsersError state
  }
}
