import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view.dart';

//Aqui na presenter colocamos os metodos que vai fazer a itermediação entre a camada de view e o repository (ou service qdo envolver regras de negocio)
abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
