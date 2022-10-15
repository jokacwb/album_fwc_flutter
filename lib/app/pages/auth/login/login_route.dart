import 'package:flutter/widgets.dart';

import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/pages/auth/login/login_page.dart';
import 'package:fwc_album/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album/app/pages/auth/login/presenter/login_presenter_impl.dart';
import 'package:fwc_album/app/service/login/login_service.dart';
import 'package:fwc_album/app/service/login/login_service_impl.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  //neste caso vamos colocar como binding uma camada de service, para separar a regra de negocio
  //quando não há regra de negocio , ou seja , há somente tratamento da tela, usamos direto a presenter
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(
            authRepository: i(),
          ),
        ),
        Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(loginService: i()),
        ),
      ];

  @override
  WidgetBuilder get page => (context) => LoginPage(
        presenter: context.get(),
      );
}
