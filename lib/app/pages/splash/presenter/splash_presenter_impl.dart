import 'package:fwc_album/app/pages/splash/view/splash_view.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
//    await Future.delayed(const Duration(seconds: 2));
    //Login fake
    _view.logged(false);
  }

  ///Associa a tela com a presenter
  @override
  set view(view) => _view = view;
}
