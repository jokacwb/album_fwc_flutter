import 'package:flutter/widgets.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/core/ui/helpers/messages.dart';
import 'package:fwc_album/app/model/user_model.dart';
import 'package:fwc_album/app/pages/home/home_page.dart';

import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage> with Loader<HomePage>, Messages<HomePage> implements HomeView {
  UserModel? userModel;

  @override
  void initState() {
    //Conectando a presenter com a view
    widget.presenter.view = this;

    //quando terminar de fazer o build chama os dados do usuario
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @override
  void refreshUser(UserModel userModel) {
    hideLoader();
    setState(() {
      this.userModel = userModel;
    });
  }
}
