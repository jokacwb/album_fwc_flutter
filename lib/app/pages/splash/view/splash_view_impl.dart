import 'package:flutter/widgets.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/pages/splash/splash_page.dart';

import './splash_view.dart';

abstract class SplashViewImpl extends State<SplashPage> with Loader<SplashPage> implements SplashView {
  @override
  void initState() {
    //Criando o canal de comunicação entra a view e a presenter com as respectivas instanciando das classes
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();

    //Definindo para qual pagina ir
    var rota = isLogged ? '/home' : '/auth/login';

    //Vai para a Home removendo todas as rotas(telas) anteriores da pilha de telas que foi navegada, por isso o (route)=> false
    Navigator.of(context).pushNamedAndRemoveUntil(rota, (route) => false);
  }
}
