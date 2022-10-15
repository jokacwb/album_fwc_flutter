import 'dart:developer';

import 'package:fwc_album/app/pages/home/view/home_view.dart';
import 'package:fwc_album/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home_presenter.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({required this.userRepository});

  @override
  Future<void> getUserData() async {
    //busca no repositorio os dados do caboclo
    try {
      _view.showLoader();
      final user = await userRepository.getUsuario();

      //Aciona o comando da view que vai mandar pra tela (Home)
      _view.refreshUser(user);
    } catch (e) {
      log('Erro ao tentar coletar dados do usuário!', error: e);
      _view.error('Erro ao tentar coletar dados do usuário!');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) => _view = view;
}
