import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/pages/my_stickers/view/my_stickers_view.dart';

///Metodos que a view MyStikersView poderá acessar
abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
}
