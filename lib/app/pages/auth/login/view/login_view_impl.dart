import 'package:flutter/widgets.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/core/ui/helpers/messages.dart';
import 'package:fwc_album/app/pages/auth/login/login_page.dart';

import './login_view.dart';

abstract class LoginViewImpl extends State<LoginPage> with Messages<LoginPage>, Loader<LoginPage> implements LoginView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
